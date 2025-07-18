class FollowsController < ApplicationController
    before_action :set_follow, only: %i[show update destroy]
    # before_action :authorize_request

    def index
        @follows = Follow.all
        render json: @follows
    end

    def show
        render json: @follow
    end

    def create
        @follow = Follow.new(follow_params)

        if @follow.save
        render json: @follow, status: :created
        else
        render json: @follow.errors, status: :unprocessable_entity
        end
    end

    def update
        @follow = Follow.find(params[:id])

        if @follow.update(follow_params)
            render json: @follow, status: :ok
        else
            render json: @follow.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @follow.destroy
        head :no_content
    end

    private

    def set_follow
        @follow = Follow.find(params[:id])
    end

    def follow_params
        params.require(:follow).permit(:folower_id, :followee_id)
    end
end