class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @dream = @user
  end

  def edit
    @user = current_user
    @mypage_flag = false

    if params[:m_flg].present?
      @mypage_flag = true
    end
  end

  def show
    @user = current_user
    @goal =  @user.goal
    @user_comments = current_user.user_comments
    @fan_count = Fan.where(user_id: current_user.id).count
  end

	def unsubscribe
	  @user = current_user
	end

  def dream
    user = current_user
    if params[:user][:dream] == ""
      render :new
    else
      user.update(user_params)
      # 登録後ゴールフォーカス、タスク新規登録ページに飛びflash表示
      redirect_to goals_path, flash: {success: "夢を登録しました。"}
    end
  end

	def update
	  user = current_user
	  if user.update(user_params)
	    if params[:m_flg].present?
	      # 登録後ユーザーページに飛びflash表示
	      redirect_to show_users_path, flash: {success: "登録情報を保存しました。"}
	      return
	    end

	    redirect_to new_users_path
	  else
	    render :edit
	  end
	end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

	private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :frend_id, :dream)
  end

end
