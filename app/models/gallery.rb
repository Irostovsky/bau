class Gallery < ActiveRecord::Base
  validates_presence_of :name
  has_many :photos, :dependent => :destroy
  
  named_scope :visible, :conditions => {:visible => true}
end
