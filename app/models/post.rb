class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validates :title, :body, presence: true
  scope :drafts, -> { where(draft: true) }
  scope :published, -> { where(draft: false) }
end
