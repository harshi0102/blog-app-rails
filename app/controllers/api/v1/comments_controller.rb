module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_post, only: %i[index create]

      def create
        user = current_user # Assuming you have authentication in place
        comment = @post.comments.build(comment_params.merge(user:))

        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        comments = @post.comments
        render json: comments
      end

      private

      def comment_params
        params.require(:comment).permit(:content)
      end

      def set_post
        @post = Post.find(params[:post_id])
      end
    end
  end
end
