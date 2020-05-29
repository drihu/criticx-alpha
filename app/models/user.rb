class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews

  validates :username, :email, presence: true, uniqueness: true
  validate :older_than_16

  private
  def older_than_16
    if birth_date >= 16.year.ago.to_date
      errors.add(:birth_date, 'You should be 16 years old to create an account')
    end
  end
end
