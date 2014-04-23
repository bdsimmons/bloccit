class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    Rails.logger.info ">>>>>>>>>>>>>>>> #{@comment.inspect}"
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "There was an error saving your comment. Please try again."
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end