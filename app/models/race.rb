class Race < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, :description, uniqueness: true
  validates :date, :bike, :swim, :run, :format, :organizer, :photo, :address, presence: true
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end
end
