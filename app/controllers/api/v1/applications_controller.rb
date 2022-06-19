class Api::V1::ApplicationsController < Api::V1::ApisController
  before_action :set_application, only: %i[show update]

  def index
    applications = Application.all
    render json: applications, except: :id
  end

  def show
    render json: @current_application, except: :id
  end

  def create
    new_application = Application.new(application_params)
    if new_application.save
      render json: { 'Created!': new_application }, except: :id, status: :created
    else
      render json: { errors: new_application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @current_application.update(application_params)
      render json: { 'Modified!': @current_application }, except: :id
    else
      render json: { errors: @current_application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.permit(:name)
  end
end
