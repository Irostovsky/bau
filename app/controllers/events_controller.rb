class EventsController < ApplicationController

  before_filter :setup_page
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :create, :destroy]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to events_path, :notice => 'News was successfully created.'
    else
      render :action => "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to events_path, :notice => 'News was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, :notice => 'News was successfully deleted.'
  end
  
  private
  
  def setup_page
    @page = :events
  end
  
end
