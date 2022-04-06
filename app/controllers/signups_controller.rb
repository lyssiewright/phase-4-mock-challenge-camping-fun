class SignupsController < ApplicationController
  def create
    signup = Signup.create!(signup_params).activity
    render json: signup, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end
end
