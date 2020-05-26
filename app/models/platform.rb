class Platform < ApplicationRecord
  has_and_belongs_to_many :games
  enum category: {
    console: 0,
    arcade: 1,
    platform: 2,
    operating_system: 3,
    portable_console: 4,
    computer: 5,
  }

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  def es
    self.valid?
    p self.errors.messages
  end
end
