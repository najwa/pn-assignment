class Api::CoachesController < ApplicationController
  def index
    @coaches = Coach.all.limit(100)
    render json: { coaches: @coaches }, status: 200
  end
end
