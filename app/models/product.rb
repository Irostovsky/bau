class Product < ActiveRecord::Base
  
  belongs_to :kit
  
  has_attached_file :avatar, 
  :styles => { :thumb => "80x80>", :medium => '200x200>', :big => '600x600>' },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar, :message => 'не может иметь пустое значение'
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => 'должно быть одним из перечисленных типов: jpg, png, gif'
  
  validates_presence_of :name, :description, :price
  validates_numericality_of :price, :greater_than => 0.01
  
end
