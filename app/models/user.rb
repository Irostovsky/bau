class User < ActiveRecord::Base
  devise :authenticatable, :rememberable

  validates_uniqueness_of :email
  validates_format_of :email, :with => Regexp::EMAIL_PATTERN
  
end
