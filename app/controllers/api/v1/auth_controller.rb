class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate_user, only: [:streamer_login, :viewer_login]

  def streamer_login
    streamer = Streamer.find_by(email: params[:email])
    if streamer&.authenticate(params[:password])
        token = encode_token({ streamer_id: streamer.id })
        render json: { token: token, streamer_id: streamer.id }
    else
        render json: { error: 'メールアドレスまたはパスワードが正しくありません' }, status: :unauthorized
    end
  end

  def viewer_login
    viewer = Viewer.find_by(email: params[:email])
    if viewer&.authenticate(params[:password])
        token = encode_token({ viewer_id: viewer.id })
        render json: { token: token, viewer_id: viewer.id }
    else
        render json: { error: 'メールアドレスまたはパスワードが正しくありません' }, status: :unauthorized
    end
  end

end
