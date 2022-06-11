class Api::V1::ApisController < ApplicationController
  private

  def set_application
    @current_application = Application.find_by(set_application_params) # for application routes
    render json: { errors: 'Application not found' } unless @current_application
  end

  def set_application_params
    params.permit(:token)
  end

  def set_chat
    @current_chat = Chat.find_by(set_chat_params)
    render json: { errors: 'Chat not found' } unless @current_chat
  end

  def set_chat_params
    params.permit(:application_token, :chat_number)
  end

  def set_message
    @current_message = Message.find_by(set_message_params)
    render json: { errors: 'Message not found' } unless @current_message
  end

  def set_message_params
    params.permit(:application_token, :chat_number, :message_number)
  end
end
