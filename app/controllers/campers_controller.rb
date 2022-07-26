class CampersController < ApplicationController
  before_action :set_camper, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    render json: @camper,  serializer: CamperActivitiesSerializer
  end

  # POST /campers
  def create
    @camper = Camper.new(camper_params)

    if @camper.save
      render json: @camper, status: :created
    else
      render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end

    def render_not_found_response
      render json: { "error": "Camper not found" }, status: :not_found
    end
end
