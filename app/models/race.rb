class Race < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :comments, dependent: :destroy

  validates :title, uniqueness: true
  validates :description, uniqueness: true
  validates_presence_of :format, :date, :bike, :swim, :run, :organizer

  def self.search(search)
    where('title ILIKE ? OR format ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
