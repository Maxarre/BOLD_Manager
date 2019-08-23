class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new(params[:task])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to list_path
  end

  def edit
    @task = Task.find(params[:id])
    # redirect_to
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @list.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
