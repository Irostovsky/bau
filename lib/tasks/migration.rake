namespace :migration do
  
  desc "Make photo polymorphic"
  task :make_photo_polymorphic => :environment do
    Photo.update_all( :photoable_type => 'Gallery')
  end
end