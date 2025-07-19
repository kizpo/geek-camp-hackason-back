class Api::V1::ViewersController < ApplicationController
    before_action :set_viewer, only: %i[show update destroy]
    before_action :authenticate_user, except: [:create]

    def index
        @viewers = Viewer.all
        render json: @viewers
    end

    def show
        render json: @viewer
    end

    def create
        @viewer = Viewer.new(viewer_params)

        if @viewer.save
            render json: @viewer, status: :created
        else
            render json: @viewer.errors, status: :unprocessable_entity
        end
    end

    def update
        @viewer = Viewer.find(params[:id])

        if @viewer.update(viewer_params)
            render json: @viewer, status: :ok
        else
            render json: @viewer.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @viewer.destroy
        head :no_content
    end

    private

    def set_viewer
        @viewer = Viewer.find(params[:id])
    end

    def viewer_params
        params.require(:viewer).permit(:name, :email, :password)
    end
end
