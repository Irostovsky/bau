class Photo < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :avatar, 
  :styles => { :thumb => "80x80>", :medium => '200x200>', :middle => '250x250>', :big => '600x600>' },
                  :url  => "/assets/galleries/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/galleries/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar, :message => 'не может иметь пустое значение'
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => 'должно быть одним из перечисленных типов: jpg, png, gif'
  
end
