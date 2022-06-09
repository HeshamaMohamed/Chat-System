class Api::V1::ApisController < ApplicationController
  def set_application
    @current_application = Application.find_by(application_params) # for application routes
    render json: { errors: 'Application not found' } unless @current_application
  end

  def application_params
    params.permit(:token)
  end

  def set_chat
    @current_chat = Chat.find_by(chat_params)
    render json: { errors: 'Chat not found' } unless @current_chat
  end

  def chat_params
    params.permit(:application_token, :chat_number)
  end
end
