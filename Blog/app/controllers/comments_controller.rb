class CommentsController < ApplicationController

def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    respond_to do |f|
      f.html{redirect_to post_path(@post)}
      f.js
    end
  end

def destroy
    @post = Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was destroyed.' }
      format.js
      format.json { head :no_content }
    end
@comment.destroy
end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
