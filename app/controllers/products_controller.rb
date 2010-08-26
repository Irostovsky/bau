class ProductsController < ApplicationController

  before_filter :setup_page
  before_filter :authenticate_user!
  before_filter :find_kit


  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @kit.products << @product
      redirect_to(kit_path(@kit), :notice => 'Product was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @product = Product.find(params[:id])

      if @product.update_attributes(params[:product])
        redirect_to(kit_path(@kit), :notice => 'Product was successfully updated.')
      else
        render :action => "edit"
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to(kit_path(@kit), :notice => 'Product was successfully deleted.')
  end
  
  private
  
  def setup_page
    @page = :kits
  end
  
  def find_kit
    @kit = Kit.find params[:kit_id]
  end
  
end
