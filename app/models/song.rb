class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: 2018}, if: :released?
  validates :artist_name, presence: true
end
