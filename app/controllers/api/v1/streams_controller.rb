class Api::V1::StreamsController < ApplicationController
    before_action :set_stream, only: %i[show update destroy]
    before_action :authenticate_user

    def index
        @streams = Stream.all
        render json: @streams
    end

    def show
        render json: @stream
    end

    def get_selected_streamers_stream
        streamer_id = params[:streamer_id]

        stream = Stream.where(streamer_id: streamer_id, status: 'live')

        render json: stream
    end

    def create
        @stream = Stream.new(stream_params)

        if @stream.save
            render json: @stream, status: :created
        else
            render json: @stream.errors, status: :unprocessable_entity
        end
    end

    def update
        @stream = Stream.find(params[:id])

        if @stream.update(stream_params)
            render json: @stream, status: :ok
        else
            render json: @stream.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @stream.destroy
        head :no_content
    end

    private

    def set_stream
        @stream = Stream.find(params[:id])
    end

    def stream_params
        params.require(:stream).permit(:streamer_id, :title, :status, :description, :stream_url)
    end
end
