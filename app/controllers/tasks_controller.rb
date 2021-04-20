class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: :index

  def index
    # @tasks = Task.all
    @tasks = Task.rank(:row_order)
    # @tasks = Task.order("row_order ASC")

    selection =  params.dig(:task, :keyword)
    @tasks = Task.sort(selection)
    @label_list = Label.all
    @task = current_user.tasks.new
  end

  def sort
    task = Task.find(params[:task_id])
    task.update(task_params)
    logger.debug("更新しました")                                        #ソートしたときのログを表示する。
    logger.debug("row_orderの値" + task_params["row_order_position"])
    head :ok # アクション実行後にViewをレンダリングしたくない時に使う
  end

  def search
    @label_list = Label.all                 #こっちの投稿一覧表示ページでも全てのタグを表示するために、ラベルを全取得
    @label = Label.find(params[:label_id])  #クリックしたラベルを取得
    @tasks = @label.tasks.all               #クリックしたラベルに紐付けられた投稿を全て表示
  end

  def new
    @task = Task.new
    @label_list = Label.all
  end

  def create
    label_list = params[:task][:label_name].split(nil)
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      @task.save_label(label_list)
      # redirect_back(fallback_location: tasks_path)
      redirect_to tasks_path
    else
      flash[:alert] = '未入力です。空欄に入力してください。'
      @label_list = Label.all
      render :new
      # redirect_to new_task_path
      # redirect_back(fallback_location: tasks_path)
    end
  end

  def show
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
      params.require(:task).permit(:user_id, :title, :details, :priority, :remind_at, :start_date, :end_date, :status, :row_order_position)
    end
    # ドラッグ＆ドロップの実装のために:row_order_positionを追加
end
