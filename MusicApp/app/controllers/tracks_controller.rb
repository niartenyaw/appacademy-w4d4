class TracksController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def show
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
  end

  def update
  end

  def destroy
  end
end
