class Api::V1::ChatsController < Api::V1::ApisController
  before_action :set_chat, only: %i[show update search]

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

  def search
    query = params[:query]
    search_matches =
      Message.search query,
                     fields: [:body],
                     match: :text_middle,
                     where: { application_token: @current_chat.application_token,
                              chat_number: @current_chat.chat_number },
                     order: { _score: :desc }, # most relevant first
                     load: false # load from elastic search instead of db

    if !search_matches.empty?
      render json: search_matches.results, only: %i[body message_number created_at]
    else
      render json: { results: 'No messages found that matches your search.' }
    end
  end

  private

  def application_params
    params.permit(:application_token)
  end

  def search_params
    params.permit(:query)
  end
end
