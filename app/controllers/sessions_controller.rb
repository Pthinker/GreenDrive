class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end
 
  def create
    if params[:session].nil?
      email = params[:email]
      password = params[:password]
    else
      email = params[:session][:email]
      puts email
      password = params[:session][:password]
    end
    user = User.authenticate(email, password)

    respond_to do |format|
      if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        format.html { render 'new' }
        user = User.new
        user.id = -1
        format.json { render :json => user }
      else
        format.html {
          sign_in user
          redirect_to user
        }
        format.json { render :json => user }
      end
    end
  end

end
