class UsersController < ApplicationController
  # => GET /users/:id
  def show
    @user = User.find(params[:id])

    # => GET app/views/users/shows.html.erb
  end

  #  => GET /users/new or /signup
  def new
    @user = User.new
    #  => GET app/views/users/new.html.erb
  end

  # POST /users
  def create
    # params => user => user.save => if ... else ... end
    # params[user[:name]] => 'foobar'
    # params[user[:email]] => 'foobar@example.com'
    # ...
    # params[user[:admin]] => true
    # params[user] => name, email, password, ...
    @user = User.new(user_params)
    if @user.save
      # => Success
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
      # redirect_to user_path(@user)   # => GET /user/:id
      # redirect_to user_path(@usr.id) # => GET /user/2
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end
  end

  private

    #Storng Parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
