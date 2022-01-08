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
end
