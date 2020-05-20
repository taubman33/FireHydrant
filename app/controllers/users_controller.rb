class UsersController < ApplicationController
    before_action :authorize_request, except: :create
     
  
      def index
          @users = User.all
          render json: { message: "ok", users: @users }
        end
      
        def show
          begin
            @user = User.find(params[:id])
            render json: { message: "ok", user: @user }
          rescue ActiveRecord::RecordNotFound
            render json: { message: 'no user matches that ID' }, status: 404
          rescue StandardError => e
            render json: { message: e.to_s }, status: 500
          end
        end
  
        def create
          @user = User.new(user_params)
          if @user.save
            render json: @user
          else
            render json: {error: @user.errors}
          end
        end
  
  
      private 
  
      def user_params
        params.require(:user).permit( :username, :email, :password )
       end
      
      end
  
  