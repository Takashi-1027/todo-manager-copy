class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: :index

  def index
    @tasks = Task.all
    # @tasks = Task.where(user_id: @user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path(@task), notice: "タスクの登録に成功しました。"
    else
      render "new"
    end
  end

  def show
    # @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path(@task.id)
    else
      render "edit"
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def task_params
      params.require(:task).permit(:user_id, :title, :details, :priority, :remind_at, :start_date, :end_date, :status)
    end

end
