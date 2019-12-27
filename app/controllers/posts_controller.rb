class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :new]
    def index
        @posts = Post.all
        
    end

    def new
        @post = Post.new
        
    end

    def create
        @post = Post.new(strong_params)
        if @post.save
            flash[:success] = "Your post has been create" 
            redirect_to root_path
        else
            flash.now[:warning] = "Please check your post again"
            render "new"
        end

        

        
    end

    private
    
    def strong_params
        params.require(:post).permit(:title, :body, :user_id)
    end

    def logged_in_user
        if !logged_in?
            flash[:warning] = "Please log in!!!"
            redirect_to login_path
        end
        
    end

    
end
