class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end

  def new
    # initiating an object with nil values
    # needed to instantiate the form_for
    @task = Task.new
  end

  def create
    # after the users clicks the save/create button the form_for/simple_form_for helper...
    # automatically passes the task data entered by the user through Task.new(params[:task])...
    # however this will raise an ActiveModel::ForbiddenAttributesError because...
    # only manually allowed fields should be accepted by the app...
    # manually allowed fields could be done via a private strong params method: task_strong_params
    @task = Task.new(task_strong_params("create"))
    # rails app does not save data without strong params
    @task.save
    # task_path is a dynamic method created based from routes
    # task_path(@task) is the path for the show page
    # task_path(@task) has a dynamic value which is the id
    # passing @task allows task_path() to know the id automatically
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_strong_params("update"))
    redirect_to task_path(@task)
  end

  def destroy
  
  end

  private
  # strong param method makes the app only only accept data from manually selected　fields
  def task_strong_params(action)
    # require's only one params key and disregard the other keys 
    # :task     - is the selected key
    # .permit   - the manaully allowed fields to be accepted by the app
    # params.require(:task).permit(:title, :details)

    case action
    when 'create' then params.require(:task).permit(:title, :details)
    when 'update' then params.require(:task).permit(:title, :details, :completed)
    else 'unexpected action'
    end
  end
end
