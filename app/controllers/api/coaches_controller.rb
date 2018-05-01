class Api::CoachesController < ApplicationController
  def index
    @coaches = Coach.search(params)
  end
end
