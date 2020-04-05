class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  def self.custom_display
    order(:created_at).last(20)
  end
end

