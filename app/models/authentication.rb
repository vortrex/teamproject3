class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid
  
  #for oauth
  belongs_to :user 
end
