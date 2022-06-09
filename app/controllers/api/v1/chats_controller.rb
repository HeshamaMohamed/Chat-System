class Api::V1::ChatsController < Api::V1::ApisController
  before_action :set_chat, only: %i[show update]

  def index
    @chats = Chat.where(application_params)
    render json: @chats, except: :id || { errors: 'Application has no chats.' }
  end

  def show
    render json: @current_chat, except: :id
  end

  def create
    application_token = params[:application_token]
    chat_number = $redis.incr("application_#{application_token}_chat_count")
    CreateChatJob.perform_later(application_token, chat_number)
    render json: { chat_number: chat_number }
  end

  private

  def application_params
    params.permit(:application_token)
  end
end
