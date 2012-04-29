namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    admin = User.create!(:name => "Vortrex",
                 :email => "vortrex99@gmail.com",
                 :password => "vortrex",
                 :password_confirmation => "vortrex")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end