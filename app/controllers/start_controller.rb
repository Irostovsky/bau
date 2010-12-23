class StartController < ApplicationController
  
  layout 'start'
  
  def index
    @page = :start
  end

end
