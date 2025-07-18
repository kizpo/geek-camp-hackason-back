class StreamsController < ApplicationController
    before_action :set_stream, only: %i[show update destroy]
    # before_action :authorize_request

    def index
        @streams = Stream.all
        render json: @streams
    end

    def show
        render json: @stream
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
        params.require(:stream).permit(:streamer_id, :title, :status)
    end
end