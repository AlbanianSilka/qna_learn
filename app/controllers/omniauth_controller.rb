class OmniauthController < ApplicationController
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      flash[:notice] = 'You are logged in' if is_navigational_format?
      # set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = 'There was a problem singing you in through Github. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'Please, try again later, we have technical problems.'
    redirect_to new_user_registration_url
  end
end
