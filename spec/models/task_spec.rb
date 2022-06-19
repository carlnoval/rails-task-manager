require 'rails_helper'

=begin
This is a sample basic template, the '#truncated_details' test below fits this basic template

RSpec.describe Class, type: :mvc_type do
  describe '#method' do
    it 'description of test' do
      expect(value).to eq(expected_result)
    end
  end
end
=end

RSpec.describe Task, type: :model do
  let!(:task) { Task.new(title: "Rspec Task for testing", details: "12345678901234567890<-twenty characters") }

  describe '#initialize' do
    it 'returns a valid Task' do
      expect(task.valid?).to eq(true)
    end

    it 'returns an invalid Task without a title' do
      task = Task.new(details: "12345678901234567890<-twenty characters")
      task.valid?
      expect(task.errors.messages[:title][0]).to eq("can't be blank")
    end
  end

  describe '#truncated_details' do
    it 'returns the first 16 characters + "..." of the task description' do
      expect(task.truncated_details).to eq("1234567890123456...")
    end
  end
end
