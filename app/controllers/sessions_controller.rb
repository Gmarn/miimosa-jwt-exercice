class SessionsController < ApplicationController
  def new
    validate_params('user_id')
    user_id = params['user_id']
    print user_id
    render json: { token: '11!' }, status: 200
  end

  def validate
    validate_params('token')
    token = params['token']
    print token
    render json: { token: '13!', valid: true, expired_at: '2021-01-20T15:04:05Z07:00',
                   issued_at: '2021-01-20T15:04:05Z07:00' }, status: 200
  end

  private

  def validate_params(params_keys)
    params.permit(params_keys).require(params_keys)
  end
end
