class Api::V1::FollowsController < ApplicationController
    before_action :authenticate_user
    before_action :ensure_viewer

    def index
        @follows = @current_user.follows.includes(:followee)
        render json: @follows.as_json(include: { followee: { only: [:id, :name, :email] } })
    end

    def create
        @follow = @current_user.follows.new(followee_id: follow_params[:followee_id])

        if @follow.save
            render json: @follow, status: :created
        else
            render json: @follow.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @follow = @current_user.follows.find(params[:id])
        @follow.destroy
        head :no_content
    end

    private

    def follow_params
        params.require(:follow).permit(:followee_id)
    end

    def ensure_viewer
        render json: { error: "Only viewers can follow" }, status: :unauthorized unless @current_user.is_a?(Viewer)
    end
end
