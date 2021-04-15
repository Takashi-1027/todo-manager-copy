class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: :index

  def index
    @tasks = Task.all
    # @tasks = Task.where(user_id: @user)
    @label_list = Label.all
    @task = current_user.tasks.new
  end

  def search
    @label_list = Label.all                 #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @label = label.find(params[:label_id])  #クリックしたタグを取得
    @tasks = @label.tasks.all               #クリックしたタグに紐付けられた投稿を全て表示
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

    # label_list = params[:task][:label_name].split(nil)
    # if @task.save
    #   @task.save_label(label_list)
    #   # redirect_back(fallback_location: tasks_path)
    #   redirect_to tasks_path(@task)
    # else
    #   redirect_to tasks_path(@task)
    #   # redirect_back(fallback_location: tasks_path)
    # end
  end

  def show
    # @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @task_labels = @task.labels
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
