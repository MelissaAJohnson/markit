class Bookmark < ApplicationRecord
  belongs_to :topic

  validates :topic, presence: true
  validates :url, presence: true
end
