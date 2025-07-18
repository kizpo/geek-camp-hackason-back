class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, Rails.application.secret_key_base)
    end

    def authenticate_user
        header = request.headers['Authorization']
        return render_unauthorized unless header

        token = header.split(' ').last
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]

        if decoded['streamer_id']
            @current_user = Streamer.find(decoded['streamer_id'])
        elsif decoded['viewer_id']
            @current_user = Viewer.find(decoded['viewer_id'])
        else
            render_unauthorized
        end
    end
end
