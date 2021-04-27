class RoutineTasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user

  def index
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
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @routine_task = RoutineTask.find(params[:id])
  end

  def update
    @routine_task = RoutineTask.find(params[:id])
    if @routine_task.update(routine_task_params)
      redirect_to routine_tasks_path(@routine_task.id)
    else
      render "edit"
    end
  end

  def destroy
    routine_task = RoutineTask.find(params[:id])
    routine_task.destroy
    redirect_back(fallback_location: root_path)
  end

    private

  def routine_task_params
    params.require(:routine_task).permit(:user_id, :name)
  end

  # def ensure_correct_user
  #   unless User.find_by(id: params[:user_id]).nil?
  #     @user = User.find(params[:user_id])
  #     unless @user == current_user
  #       redirect_to routine_tasks_path(user_id: current_user.id)
  #     end
  #   else
  #     redirect_to routine_tasks_path(user_id: current_user.id)
  #     # redirect_to edit_user_path(current_user)
  #   end
  # end
end
