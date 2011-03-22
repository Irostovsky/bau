class Event < ActiveRecord::Base
  validates_presence_of :title, :body
  has_many :photos, :as => :photoable, :dependent => :destroy
  
end
