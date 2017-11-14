class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(due_date: :asc)
  end

  def new
    @task = Task.new
  end

  def update
    if @task.update_attributes(task_params)
      flash[:notice] = "succesfully Updated !"
      redirect_to task_path(@task)
    else
      flash[:notice] = "something's missing !"
      render :action => :edit
    end
  end

  def destroy
    if @task.can_destroy?
      @task.destroy
      flash[:alert] = "succesfully Deleted !"
      redirect_to tasks_url
    else
      flash[:alert] = "mission impossible at present !"
    end

  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "succesfully Created !"
      redirect_to tasks_url
    else
      render :action => :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :note)    
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
