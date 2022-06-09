class Api::V1::ApisController < ApplicationController
  def set_application
    @current_application = Application.find_by(application_params) # for application routes
    render json: { errors: 'Application not found' } unless @current_application
  end

  def application_params
    params.permit(:token)
  end
end
