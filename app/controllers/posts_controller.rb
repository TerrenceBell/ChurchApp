class PostsController < ApplicationController

  get '/posts' do
    not_logged_in
    if current_user.posts != []
      @user_posts = current_user.posts.all
    end
    @posts = Post.all
    @not_user_posts = @posts - @user_posts
    erb :"posts/index"
  end


    get '/posts/new' do 
        not_logged_in
       @users = User.all
        erb :"posts/new"
    end
    
    get '/posts/:id/edit' do
        
        not_logged_in
        @users = User.all
        @post = Post.find_by_id(params[:id])
        if @post.user.id == current_user.id
        erb :"posts/edit"
        else 
            redirect "/posts"
        end
    end

      patch '/posts/:id' do 
        @post = Post.find_by_id(params[:id])
    params.delete("_method")
    if @post.update(params)
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{@post.id}/edit"
    end
  end
    
      post '/posts' do
        post = Post.new(body: params[:body], title: params[:title], user_id: current_user.id)
        if post.save
            redirect "posts/#{post.id}"
        else 
            redirect "posts/new"
        end
    end

    get '/posts/:id' do
        not_logged_in
        @post = Post.find_by_id(params[:id])
        erb :"/posts/show"
        
    end
    
    delete '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      if @post.user.id == current_user.id
        @post.destroy
        redirect "/posts"
      else
      
        redirect "/posts"
      end
    end

end

