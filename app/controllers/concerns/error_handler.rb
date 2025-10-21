module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActionController::ParameterMissing, with: :unprocessable_entity
  end

  private

  def not_found(exception)
    render json: {
      error: {
        message: exception.message,
        details: {}
      }
    }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: {
      error: {
        message: exception.message,
        details: exception.respond_to?(:record) ? exception.record.errors.messages : {}
      }
    }, status: :unprocessable_entity
  end
end

