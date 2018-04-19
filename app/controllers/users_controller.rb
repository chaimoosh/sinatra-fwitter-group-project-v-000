class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.username.empty? || @user.email.empty? || @user.password_digest == nil
      redirect to "/signup"
    end
    @user.save
    session[:user_id] = @user.id
    redirect to "/tweets"
  end

  get '/login' do
    if logged_in?
      #binding.pry
      redirect to "/tweets"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params["username"])
    session[:user_id] = @user.id
    binding.pry
    redirect to "/tweets"
  end

  get '/logout' do
    session.clear
    redirect to "/login"
  end

  get '/users/:user_slug' do
    erb :'/users/show'
  end
end
