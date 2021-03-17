class JwtHandler
  HMAC_SECRET = Rails.application.credentials.jwt[:hmac_secret]
  EXPIRED_HOURS = Rails.application.credentials.jwt[:expired_hours]
  JWT_KEYS = %w[user_id expired_at issued_at].freeze
  JWT_ALGORITHM = 'HS256'.freeze

  def create(user_id)
    payload = {
      user_id: user_id,
      issued_at: Time.now,
      expired_at: Time.now + EXPIRED_HOURS.hours
    }

    JWT.encode payload, HMAC_SECRET, JWT_ALGORITHM
  end

  def validate(token)
    decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: JWT_ALGORITHM }
    response_params = decoded_token[0]
    response_params[:valid] = token_valid?(response_params)
    response_params
  end

  private

  def token_valid?(token_params)
    return false unless JWT_KEYS.all? { |k| token_params.key? k }
    return false if User.find_by(uuid: token_params['user_id']).nil?
    return false if Time.now > token_params['expired_at']
    true
  end
end
