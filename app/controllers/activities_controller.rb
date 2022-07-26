class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /activities
  def index
    render json: Activity.all
  end

  # DELETE /activities/1
  def destroy
    signup = Signup.find(params[:id])
    @activity.destroy
    signup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.permit(:name, :difficulty)
    end

    def render_not_found_response
      render json: { "error": "Activity not found" }, status: :not_found
    end
end
