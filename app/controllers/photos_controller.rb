class PhotosController < ApplicationController
  
  before_filter :setup_page
  before_filter :authenticate_user!
  before_filter :find_gallery
  before_filter :find_photo, :only => [:edit, :update, :destroy]
  
  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(params[:photo])

    if @gallery.photos << @photo
      redirect_to(gallery_path(@gallery), :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @photo.update_attributes params[:photo]
      redirect_to(gallery_path(@gallery), :notice => 'Photo was successfully updated.')
    else
      render :action => :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to(gallery_path(@gallery), :notice => 'Photo was successfully deleted.')
  end
  
  private
  
  def setup_page
    @page = :galleries
  end
  
  def find_gallery
    @gallery = Gallery.find params[:gallery_id]
  end

  def find_photo
    @photo = @gallery.photos.find_by_id params[:id] 
  end
end
