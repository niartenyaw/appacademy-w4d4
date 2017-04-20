class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save
      redirect_to "/bands/#{@album.band_id}/albums/#{@album.id}"
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to "/bands/#{@album.band_id}/albums/new"
    end
  end

  def edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
  end

  def update
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.destroy
    redirect_to band_url(params[:band_id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
