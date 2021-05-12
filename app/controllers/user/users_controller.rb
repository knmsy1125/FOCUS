class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @mypage_flag = false

    if params[:m_flg].present?
      @mypage_flag = true
    end
  end

  def show
    @user = current_user
    #id 1の情報を無理やり持ってきている。あとで書き換える。
    @goal = Goal.find(1)
    @tasks = @goal.tasks
  end

	def unsubscribe
	  @user = current_user
	end

	def update
	  user = current_user
	  if user.update(user_params)
	    flash[:success] = "登録情報を変更しました"
	    if params[:m_flg].present?
	      redirect_to show_users_path(user)
	      return
	    end

	    redirect_to goals_path
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
    params.require(:user).permit(:name, :email, :profile_image, :frend_id)
  end

end
