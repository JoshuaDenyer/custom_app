class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			
			flash[:success] = "Sign up successful!"
			redirect_to @user
		else
			flash[:error] = "Sign up error"
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end