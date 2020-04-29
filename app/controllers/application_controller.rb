require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "iloveellie"
  end

  get '/' do
    are_logged_in
    redirect "/login"
  end



  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
      @user ||= User.find(session[:user_id])
    end

      def not_logged_in 
        if !logged_in?
          redirect '/login' 
      end
    end

    def are_logged_in
      if logged_in?
        redirect '/post'
      end
    end
    

  
		
    end
end
