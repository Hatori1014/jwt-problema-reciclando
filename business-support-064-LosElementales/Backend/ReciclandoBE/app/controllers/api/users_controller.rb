class Api::UsersController < ApplicationController
    protect_from_forgery prepend:true
    before_action :set_status, only: [:show, :update, :destroy]
       
    def index
      @users = User.all
      render json: @users
    end
   
    def show
      @user = User.find(params[:id])
      render json: @user
    end
   
    def create
      @user = User.new(user_params)
   
      if @user.save
        render json: @user, user: :created
      else
        render json: @user.errors, user: :unprocessable_entity
      end
    end
   
    def update
      if @user.update(user_params)
        render json: @user, user: :ok
      else
        render json: @user.errors, user: :unprocessable_entity
      end
    end
   
    def destroy
      @user.destroy
      head :no_content
    end

    def current
      render json: current_user
    end
   
    private
      def set_user
        @user = User.find(params[:id])
      end
   
      def user_params
        params.require.permit(:nombre_usuario, :apellidos_ususario, :fecha_nacimiento_usuario, :puntaje_usuario, :password, :password_confirmation, :timestamps)
      end
end
