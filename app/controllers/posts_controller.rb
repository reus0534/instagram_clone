class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user = current_user
    
        if @post.save
            redirect_to root_url
        else
            render :new
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:description, :image)
    end
end
