class EpisodesController < ApplicationController

  def index
    episodes = Episode.all
    render json: episodes, status: 200
  end

  def show
    render json: [], status: 200
  end

  def preview
    render json: [], status: 200
  end

  def edit
    render json: [], status: 200
  end


end
