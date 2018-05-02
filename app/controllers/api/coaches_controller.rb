class Api::CoachesController < ApplicationController
  def index
    @coaches = Coach.search(params).page(params[:page]).per(params[:per_page])
  end
end
