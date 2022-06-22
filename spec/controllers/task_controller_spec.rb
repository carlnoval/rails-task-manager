require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#create' do
    # post action has to be inside `before` otherwise it won't work 
    before { post :create, params: { task: { title: 'My Task Title', details: 'Details for the task I created' } } }
    # the task key is the task variable inside each `it` blocks
    let!(:task) { Task.last }

    it 'creates a new task' do
      # params for Task will always be a hash
      # inside the hash will be the fields that were permitted from model's strong params (see strong params from model)
      # can also be seen by putting a `raise` on the top of create model then running `params.permit!.to_h[:model]`
      expect(task.details).to eq('Details for the task I created')
    end

    it 'redirects to task show path' do
      expect(response).to redirect_to(task_path(task))
    end
  end
end
