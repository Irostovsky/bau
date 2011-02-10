module StartHelper
  
  def licenzies
    Gallery.find_by_name('Лицензии').photos
  end
end
