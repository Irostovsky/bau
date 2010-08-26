class KitsController < ApplicationController
  
  before_filter :setup_page
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :create, :destroy]
  
  def index
    @kits = Kit.all
  end

  def show
    @kit = Kit.find(params[:id])
    @kits = Kit.all
    
  end

  def new
    @kit = Kit.new
  end

  def edit
    @kit = Kit.find(params[:id])
  end

  def create
    @kit = Kit.new(params[:kit])

    if @kit.save
      redirect_to(@kit, :notice => 'Kit was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @kit = Kit.find(params[:id])

    if @kit.update_attributes(params[:kit])
      redirect_to(@kit, :notice => 'Kit was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy

    redirect_to(kits_url)
  end
  
  private
  
  def setup_page
    @page = :kits
  end
  
end
