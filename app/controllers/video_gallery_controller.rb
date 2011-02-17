class VideoGalleryController < ApplicationController

  before_filter :setup_page

  private

  def setup_page
    @page = :galleries
  end

end
