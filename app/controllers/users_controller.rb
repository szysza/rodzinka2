 class UsersController < ApplicationController
=begin
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
=end

   def index
     @users = User.all

     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @users }
     end
   end

   def index
     @q = User.search(params[:q])
     @users = @q.result(:distinct => true)

     respond_to do |format|
       format.html # index.html.erb
       format.js
       format.json { render json: @users }
     end
   end

  def show
    @user = User.find(params[:id])
    @invitations = @current_user.build_invitations_for(@user)
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

=begin
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
=end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      # TODO: Gdzie przenieść i jaka to powinna być akcja w stylu REST?
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

=begin
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
=end

=begin
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
=end
end
