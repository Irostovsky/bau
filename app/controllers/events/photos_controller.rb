class Events::PhotosController < ApplicationController
  
  before_filter :setup_page
  before_filter :authenticate_user!
  before_filter :find_event
  
  def index
    @photo = Photo.new
  end
  
  def create
    @photo = @event.photos.build params[:photo]
    if @photo.save
      redirect_to event_photos_path(@event)
    else
      render :index
    end
  end

  def destroy
  end

  private
  
  def find_event
    @event = Event.find_by_id params[:event_id]
  end
  
  def setup_page
    @page = :events
  end

end
