class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
    validates :address
  end
end
