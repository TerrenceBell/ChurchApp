class UsersController < ApplicationController 

    get '/users/signup' do 
        are_logged_in
        erb :"/users/signup"
    end

    post '/users' do 
        @user = User.new(params)
        if @user.save && @user
            session[:user_id] = @user.id
			redirect "/posts"
		  else
			erb :"users/signup"
		  end
    end


end