require 'omniauth'
require 'omniauth-twitter'


Rails.application.config.middleware.use OmniAuth::Builder do  
	provider :twitter, 'N2Fs1OYXiUtqViHJaVBP4A', 'g1Od5cmGjLpgvEDaHLqySMJ3OOeEdQlefKZjffTtKSs'
  #provider :facebook, 'APP_ID', 'APP_SECRET'  
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
end  
