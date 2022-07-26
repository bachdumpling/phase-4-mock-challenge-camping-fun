class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :update, :destroy]

  # POST /signups
  def create
    signup = Signup.new(signup_params)

    if signup.save
      render json: signup.activity, status: :created
    else
      render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signup_params
      params.permit(:camper_id, :activity_id, :time)
    end
end
