Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :applications,  only: %i[index show update create], param: :token do
        resources :chats,       only: %i[index show update create], param: :chat_number do
          member do
            post 'search', to: 'chats#search'
            resources :messages, only: %i[index show update create], param: :message_number
          end
        end
      end
    end
  end
end
