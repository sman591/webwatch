class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    flash[:notice] = 'Welcome back!'

    # Redirect to the URL you want after successful auth
    redirect_to '/websites'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def logout
    session[:userinfo] = nil
    flash[:notice] = 'See you next time!'
    query = { returnTo: root_url, client_id: Rails.application.secrets.auth0_client_id }.to_query
    redirect_to "https://webwatch.auth0.com/v2/logout?#{query}"
  end
end
