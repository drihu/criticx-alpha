class Review < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :reviewable, polymorphic: true

  validates :title, :body, presence: true
  validates :title, length: { maximum: 40 }, uniqueness: true
end
