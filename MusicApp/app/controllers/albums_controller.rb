class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
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
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to band_album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_band_album_url
    end
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
