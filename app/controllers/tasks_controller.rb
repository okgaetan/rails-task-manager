class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end
  def create
    @tasks = Task.new(tasks_params)
    @tasks.save
    redirect_to task_path(@tasks)
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(tasks_params)
    redirect_to task_path(@tasks)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path
  end
end
