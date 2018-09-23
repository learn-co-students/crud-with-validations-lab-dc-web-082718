require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  validate :release_year_valid

  def release_year_valid
    if self.released && self.release_year == nil
      errors.add(:release_year, "Enter a release year")
    elsif self.release_year
       if self.release_year > DateTime.now.year
         errors.add(:release_year, "Enter a valid release year")
       end
    end
  end

end
