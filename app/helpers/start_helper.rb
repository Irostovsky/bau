module StartHelper
  
  def licenzies
    gallery = Gallery.find_by_name('Лицензии')
    gallery ? gallery.photos : [] 
  end
end
