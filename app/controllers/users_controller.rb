class UsersController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # ログインしているユーザーでしか編集できないようにする
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new
  end

  def new
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new
  end

  def create
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new(routine_task_params)
    @routine_task.user_id = current_user.id
    if @routine_task.save
      redirect_back(fallback_location: root_path)
    else
      render "index"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "更新に成功しました。"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  # ログインしているユーザーが他のユーザーと同一人物か確認するコード
  def ensure_correct_user
    unless User.find_by(id: params[:id]).nil?
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to users_path
      end
    else
      redirect_to users_path
    end
  end
end
