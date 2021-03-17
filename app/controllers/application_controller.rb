class ApplicationController < ActionController::API
  # We are handling error directly in the Application Controller, could be good to have an
  # error handler in /app/controllers/concerns/error_helper.rb
  rescue_from JWT::VerificationError do |error|
    render_error(error.message, :unauthorized)
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render_error(error.message, :not_found)
  end

  def render_error(message, status)
    render json: { error: message }, status: status
  end
end
