class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  after_create do |review|
    user = review.user
    user.update(review_count: user.review_count + 1)
  end

  after_destroy do |review|
    user = review.user
    user.update(review_count: user.review_count - 1)
  end
end
