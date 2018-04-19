class TweetsController < ApplicationController
 get '/tweets' do
   if logged_in?
     @tweets = Tweet.all
     erb :'/tweets/tweets'
   else
     redirect to "/login"
   end
 end

 get '/tweets/new' do
   if logged_in?
     @user = User.find_by_id(session[:user_id])
     erb :'/tweets/create_tweet'
   else
     redirect to "/login"
   end
 end

 post '/tweets' do
   @tweet = Tweet.create(:content => params["content"], :user_id => session[:user_id])
   redirect to "/tweets"
 end
end
