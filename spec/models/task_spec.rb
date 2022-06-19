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

  describe '#initialize' do
    it 'returns a valid Task' do
      task = Task.new(title: "Rspec Task for testing", details: "12345678901234567890<-twenty characters")
      expect(task.valid?).to eq(true)
    end
  end

  describe '#truncated_details' do
    it 'returns the first 16 characters + "..." of the task description' do
      task = Task.new(title: "Rspec Task for testing", details: "12345678901234567890<-twenty characters")
      expect(task.truncated_details).to eq("1234567890123456...")
    end
  end
end
