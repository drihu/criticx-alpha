class User < ApplicationRecord
  has_many :reviews

  validates :username, :email, presence: true, uniqueness: true

  validate :older_than_16

  before_create do |user|
    user.review_count = 0
  end

  private
  def older_than_16
    if birth_date > Date.today - 16.year
      errors.add(:birth_date, 'You should be 16 years old to create an account')
    end
  end
end
