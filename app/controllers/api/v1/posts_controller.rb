module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user! # Devise authentication
      load_and_authorize_resource # CanCanCan
      def index
        user = User.find(params[:user_id])
        posts = user.posts.includes(:comments)
        render json: posts
      end

      private

      def fetch_user_by_id
        User.find(params[:user_id]) # Use :user_id here
      end

      def retrieve_user_posts_with_comments(user)
        user.posts.includes(:comments)
      end

      def render_posts_as_json(posts)
        render json: posts
      end
    end
  end
end
