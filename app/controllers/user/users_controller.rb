class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

	def unsubscribe
	  @user = current_user
	end

	def update
	  @user = current_user
	  if @user.update(user_params)
	    flash[:success] = "登録情報を変更しました"
	    redirect_to user_params
	  else
	    render :edit and return
	  end
	end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path #削除に成功すればrootページに戻る
  end

	private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image_id, :frend_id)
  end

end
