class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    puts "Params: #{params.inspect}"
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      puts "Errors: #{comment.errors.full_messages.inspect}"
      render :edit
    end
  end

  def destroy
    @comment.destroy!
    redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
  end
  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:title,:content)

  end
end
