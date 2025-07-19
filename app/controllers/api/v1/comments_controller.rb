class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: %i[show update destroy]
    before_action :authenticate_user

    def index
        @comments = Comment.all
        render json: @comments
    end

    def show
        render json: @comment
    end

    def get_donations_amount
        if params[:streamer_id].present?
            comments = Comment.joins(stream: :streamer)
                            .where(streams: { streamer_id: params[:streamer_id] })
                            .includes(stream: :streamer)
        else
            comments = Comment.includes(stream: :streamer)
        end

        total_amount = 0
        total_donation = 0

        comments.each do |comment|
            amount = comment.amount
            streamer_ratio = comment.stream.streamer.donation_share_ratio
            donation_part = amount * streamer_ratio / 100

            total_amount += amount
            total_donation += donation_part
        end

        render json: {
            total_amount: total_amount,
            total_donation: total_donation
        }
    end

    def get_comment_history
        viewer_id = params[:viewer_id]

        comments = Comment.includes(:stream)
                            .where(viewer_id: viewer_id)
                            .order(created_at: :asc)

        result = comments.map do |comment|
            {
                content: comment.content,
                amount: comment.amount,
                stream_name: comment.stream.title,
                stream_date: comment.created_at.strftime("%Y-%m-%d %H:%M:%S")
            }
        end

        render json: result
    end

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def update
        @comment = Comment.find(params[:id])

        if @comment.update(comment_params)
            render json: @comment, status: :ok
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @comment.destroy
        head :no_content
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :amount, :viewer_id, :stream_id)
    end
end
