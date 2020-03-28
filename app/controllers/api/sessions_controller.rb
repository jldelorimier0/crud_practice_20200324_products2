class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])    
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time for the token
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm. 256 is 16^2. This must have something to do with a hexademical System being involved in encryption. In fact, maybe the HS stands for Hexadecimal System or something.
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
