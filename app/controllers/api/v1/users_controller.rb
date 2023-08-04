module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      before_action :set_user, only: %i[show posts comments add_comment]


      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          render json: { error: 'Failed to create user' }, status: :unprocessable_entity
        end
      end

      def index
        users = retrieve_all_users
        render_users_as_json(users)
      end

      def show
        @user = User.find(params[:id])
        render_user_as_json(@user)
      end

      def posts
        user = fetch_user_by_id
        posts = user.posts
        render_posts_as_json(posts)
      end

      def comments
        comments = retrieve_user_comments
        render_comments_as_json(comments)
      end

      def add_comment
        post = find_post_by_id
        comment = build_comment_for_post(post)

        if save_comment(comment)
          render_created_comment(comment)
        else
          render_comment_creation_error
        end
      end

      def post_comments
        user = User.find(params[:id])
        post = user.posts.find(params[:post_id])
        comments = post.comments
        render json: comments
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def load_user
        @user = fetch_user_by_id
      end

      def fetch_user_by_id
        User.find(params[:id])
      end

      def retrieve_all_users
        User.all
      end

      def render_users_as_json(users)
        render json: users
      end

      def render_user_as_json(user)
        render json: user
      end

      def retrieve_user_posts
        @user.posts
      end

      def render_posts_as_json(posts)
        render json: posts
      end

      def retrieve_user_comments
        Comment.where(post_id: @user.posts.pluck(:id))
      end

      def render_comments_as_json(comments)
        render json: comments
      end

      def find_post_by_id
        Post.find(params[:post_id])
      end

      def build_comment_for_post(post)
        post.comments.new(comment_params)
      end

      def save_comment(comment)
        comment.save
      end

      def render_created_comment(comment)
        render json: comment, status: :created
      end

      def render_comment_creation_error
        render json: { error: 'Failed to create comment' }, status: :unprocessable_entity
      end

      def comment_params
        params.require(:comment).permit(:text)
      end

      def user_params
        params.require(:user).permit(:name, :email, :password) # Adjust permitted attributes
      end
    end
  end
end
