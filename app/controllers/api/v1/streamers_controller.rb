class Api::V1::StreamersController < ApplicationController
    before_action :set_streamer, only: %i[show update destroy]
    before_action :authenticate_user, except: [:create]

    def index
        @streamers = Streamer.all
        render json: @streamers
    end

    def show
        render json: @streamer
    end

    def create
        @streamer = Streamer.new(streamer_params)

        if @streamer.save
        render json: @streamer, status: :created
        else
        render json: @streamer.errors, status: :unprocessable_entity
        end
    end

    def update
        @streamer = Streamer.find(params[:id])

        if @streamer.update(streamer_params)
            render json: @streamer, status: :ok
        else
            render json: @streamer.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @streamer.destroy
        head :no_content
    end

    private

    def set_streamer
        @streamer = Streamer.find(params[:id])
    end

    def streamer_params
        params.require(:streamer).permit(:name, :email, :password, :youtube_url, :twitch_url, :donation_share_ratio)
    end
end
