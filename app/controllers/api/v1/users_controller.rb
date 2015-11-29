module Api
  module V1
    class UsersController < Api::BaseController
      before_filter :authenticate
      respond_to    :json

      def index
       respond_with build_success_object(User.all)
      end

      def show
        respond_with build_success_object(User.find(params[:id]))
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: build_success_object(user), status: 201
        else
          render json: build_error_object(user), status: 403
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end
