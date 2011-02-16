class GalleriesController < ApplicationController
  
  before_filter :setup_page
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :create, :destroy]
  

  def index
    @galleries = current_user ? Gallery.all : Gallery.visible
    @photos = @galleries.map{|g| g.photos.slice(0, 2)}.flatten
  end

  def show
    @gallery = Gallery.find(params[:id])
    @galleries = Gallery.all
    @photos = @gallery.photos
  end

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    if @gallery.save
      redirect_to(galleries_path, :notice => 'Gallery was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(params[:gallery])
      redirect_to(galleries_path, :notice => 'Gallery was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    redirect_to(galleries_url)
  end
  
  private
  
  def setup_page
    @page = :galleries
  end
end
