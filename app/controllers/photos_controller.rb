class PhotosController < ApplicationController
  
  before_filter :setup_page
  before_filter :authenticate_user!
  before_filter :find_gallery
  
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])

    if @gallery.photos << @photo
      redirect_to(gallery_path(@gallery), :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def setup_page
    @page = :galleries
  end
  
  def find_gallery
    @gallery = Gallery.find params[:gallery_id]
  end
  
end
