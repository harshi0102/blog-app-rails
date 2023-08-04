class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      user_id: current_user.id,
      post_id: params[:post_id],
      text: params[:text]
    )
    return unless @comment.save

    redirect_to user_post_path(@comment.user.id, @post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize! :destroy, @comment  # Check authorization using CanCanCan
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully deleted.' }
      format.js   # Renders comments/destroy.js.erb
    end
end
end