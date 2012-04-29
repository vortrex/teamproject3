class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
=begin
 omniauth = request.env["omniauth.auth"]  
  authentication = Authentication.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])  
  if authentication
    flash[:notice] = "Signed in successfully."  
    sign_in_and_redirect(@user, authentication.user)  
  elsif current_user  
    current_user.authentication.create(:provider => omniauth  ['provider'], :uid => omniauth['uid'])  
    flash[:notice] = "Authentication successful."  
    redirect_to authentications_url  
  else  
    user = User.new  
    user.authentication.build(:provider => omniauth ['provider'], :uid => omniauth['uid'])  
    user.save!  
    flash[:notice] = "Signed in successfully."  
    sign_in_and_redirect(:user, user)  
  end  
=end
  
    @authentication = Authentication.new(params[:authentication])
	#render :text => request.env['omniauth.auth'].inspect
	#auth = request.env["omniauth.auth"] current_user.authentications.create(:provider => auth ['provider'], :uid => auth['uid'])  
	omniauth = request.env["omniauth.auth"]
	auth = current_user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	flash[:notice] = "Authentication successful."  
	#redirect_to authentications_url
	#session[:return] || default

    if @authentication.save
	#session[:return] || default
      redirect_to root_url, :notice => "Successfully created authentication."
    else
     render :action => 'new'
    end
  end

  def destroy
    @authentication = current_user.authentication.find(params[:id])
    @authentication.destroy
	flash[:notice]="Successfully destroyed authentication"
    redirect_to authentications_url
  end
end