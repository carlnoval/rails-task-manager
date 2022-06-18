class Task < ApplicationRecord

  validates :title, presence: true

  def truncated_details
    # returns first 16 characters of details
    details[0..15]
  end

  def checked_or_unchecked
    return self.completed ? "far fa-check-square" : "far fa-square"
  end

  def completed_or_not
    return self.completed ? "This task has been completed." : "This task has not been completed yet."
  end

  def toggle_completed
    return "Click to mark this task as #{ self.completed ? 'not completed.' : 'completed.'}" 
  end
end
