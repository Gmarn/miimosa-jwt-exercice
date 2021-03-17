class SessionsController < ApplicationController
  def new
    # In any case invalid uuid or invalid body request endpoint will responde 404. TODO: bettered
    validate_params(:user_id)
    token = JwtHandler.new.create(user.uuid)
    render json: { token: token }, status: 200
  end

  def validate
    validate_params(:token)
    token = session[:token]
    decoded_token = JwtHandler.new.validate(token)
    render json: decoded_token, status: decoded_token[:valid] ? :ok : :unauthorized
  end

  private

  def validate_params(params_keys)
    session.permit(params_keys)
  end

  def session
    @session ||= params.require(:session)
  end

  def user
    # Here we check the existence of the user we could also create the token and only check
    # the user existence when validating the token
    @user ||= User.find_by!(uuid: session[:user_id])
  end
end
