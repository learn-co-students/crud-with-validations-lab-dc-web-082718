class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validate :released_without_year?
  validate :future_release_date?


  private

  def released_without_year?
    if self.released && self.release_year == nil
      errors.add(:release_year, "add a release year")
      return false
    else
      return true
    end
  end

  def future_release_date?
    if self.release_year
      if self.release_year > 2018
        errors.add(:release_year, "add correct release year")
        return false
      else
        return true
      end
    end
  end

end
