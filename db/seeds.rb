# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_uncompleted_tasks(task_count)
  task_count.times do
    task_title = Faker::Verb.base.capitalize
    task_details = "#{task_title} #{rand(1..10)} #{Faker::Game.title}"
    new_task = Task.new(title: task_title, details: task_details)
    new_task.save
  end
end

def create_completed_tasks(task_count)
  task_count.times do
    task_title = Faker::Verb.base.capitalize
    task_details = "#{task_title} #{rand(1..10)} #{Faker::Game.title}"
    new_task = Task.new(title: task_title, details: task_details, completed: true)
    new_task.save
  end
end

puts "Deleting all Tasks..."
Task.destroy_all
puts 'Create 9 Tasks...'
create_uncompleted_tasks(2)
create_completed_tasks(4)
create_uncompleted_tasks(2)
puts 'Completed creating Tasks...'

