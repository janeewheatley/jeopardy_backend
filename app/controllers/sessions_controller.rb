class SessionsController < ApplicationController
  def new
  end

  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to root_path
    else
      format.json do
        return render :json => user
      end
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
