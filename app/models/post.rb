class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  default_scope  { order(:created_at => :desc) }

  scope :drafts, -> { where(draft: true) }
  scope :published, -> { where(draft: false) }

  validates :title, :body, presence: true
end
