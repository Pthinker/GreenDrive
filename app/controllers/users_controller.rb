class UsersController < ApplicationController

  def home

  end

  def contact
    @title = "Contact"
  end
 
  def help 
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @title = "Sign up"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to SpeedMatters App!"
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.json { render :json => @user.to_json(:except => [ :created_at, :updated_at, :ispool]) }
      else
        @title = "Sign up"
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.json { render :text=>'FAIL', :status => '400' }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def recommendUsers
    user_id = params[:user_id]
    if user_id.nil?
      respond_to do |format|
        format.json { render :text => 'FAIL', :status => 400 }
      end
    else
      user = User.find(user_id)
      address_id = user.address_id
      #puts address_id
      @recommendUsers = User.find(:all, :conditions => ["address_id=? and ispool=1 and id!=?", address_id, user_id] )
      respond_to do |format|
        format.json { render :json => @recommendUsers.to_json(:except => [ :created_at, :updated_at, :id, :encrypted_password, :salt, :ispool])}
      end
    end
  end
end
