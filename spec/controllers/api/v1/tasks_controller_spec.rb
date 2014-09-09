require 'rails_helper'

module Api

  RSpec.describe TasksController, :type => :controller do

    let(:valid_attributes) {
      {name: 'test', description: 'description'}
    }

    before do
      @task = Task.create! valid_attributes
    end

    context 'tasks' do
      it 'should get list of tasks' do
        get :index, format: :json
        expect(response.status).to eql(200)
      end

      it 'should return task' do
        get :show, id: @task, format: :json
        expect(response.status).to eql(200)
      end

      it 'should return task not found' do
        get :show, id: 123332, format: :json
        expect(response.status).to eql(404)
      end
    end
  end
end
