=begin - This is a sample basic template, the '#truncated_details' test below fits this basic template

require 'rails_helper'

RSpec.describe Class, type: :mvc_type do
  describe '#method' do
    it 'description of test' do
      expect(value).to eq(expected_result)
    end
  end
end

=end

require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { Task.new(title: "Rspec Task for testing", details: "12345678901234567890<-twenty characters") }

  describe '#initialize' do
    context 'when valid' do
      it 'returns a valid Task' do
        expect(task.valid?).to eq(true)
      end
    end
    
    context 'task without title' do
      before { task.title = nil }

      # the test in this 'it' block is not a good practice,
      # the proper way is on the next it block
      # this 'it' block is just for 'context when...' demo purpose
      it 'task is invalid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns an error message' do
        task.valid?
        expect(task.errors.messages[:title][0]).to eq("can't be blank")
      end
    end
  end

  describe '#truncated_details' do
    it 'returns the first 16 characters + "..." of the task description' do
      expect(task.truncated_details).to eq("1234567890123456...")
    end
  end
end
