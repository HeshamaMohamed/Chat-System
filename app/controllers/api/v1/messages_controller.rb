class Api::V1::MessagesController < Api::V1::ApisController
  before_action :set_message, only: %i[show update]

  def index
    @messages = Message.where(set_chat_params)
    render json: @messages, except: :id || { errors: 'chat has no messages.' }
  end

  def show
    render json: @current_message, except: :id
  end

  def create
    CreateMessageJob.perform_later(create_params)
    render json: { message_number: @message_number }, status: :accepted
  end

  def update
    if @current_message.update(message_params)
      render json: { 'Modified!': @current_message }, except: :id
    else
      render json: { errors: @current_message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:body)
  end

  def create_params
    application_token = params[:application_token]
    chat_number = params[:chat_number]
    @message_number = $redis.incr("application_#{application_token}_chat_#{chat_number}_message_count")
    body = params[:body]

    [application_token, chat_number, @message_number, body]
  end
end
