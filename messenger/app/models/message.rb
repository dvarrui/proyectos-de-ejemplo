class Message < ApplicationRecord
  validates :title, presence: true
end
