class Gallery < ActiveRecord::Base
  validates_presence_of :name
  has_many :photos, :as => :photoable, :dependent => :destroy
  
  named_scope :visible, :conditions => {:visible => true}
end
