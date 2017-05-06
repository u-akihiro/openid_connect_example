class AuthenticationsController < ApplicationController
  def new
    # GoogleのOAtuh2サーバへリダイレクトさせる。
    state = SecureRandom.urlsafe_base64

    auth_endpoint = 'https://accounts.google.com/o/oauth2/v2/auth'
    query_hash = {
      client_id: 'YOUR OWN CLIENT ID',
      response_type: 'code',
      scope: 'openid',
      redirect_uri: 'http://localhost:3000/auth',
      state: state,
    }

    url = URI(auth_endpoint)
    url.query = URI.encode_www_form(query_hash)
    redirect_to(url.to_s, status: 302)
  end

  def create
    exchange_endpoint = URI('https://www.googleapis.com/oauth2/v4/token')
    form_data = {
      code: params[:code],
      client_id: 'YOUR OWN CLIENT ID',
      client_secret: 'YOUR OWN CLIENT SECRET',
      redirect_uri: 'http://localhost:3000/auth',
      grant_type: 'authorization_code'
    }

    response = Net::HTTP.post_form exchange_endpoint, form_data
    p response.body
  end
end
