namespace :user do
  desc 'Create a new user account'
  task :create => :environment  do
    unless ENV.include?('email') && ENV.include?('password')
      raise 'usage: rake user:create email=test@example.com password=qwerty'
    end

    account = User.new :email => ENV['email'], :password => ENV['password']
    if account && account.save!
      p "User account has been created"
    end
  end

end


