class Feedback < ApplicationRecord
  validates :email, :body, presence: true
end
