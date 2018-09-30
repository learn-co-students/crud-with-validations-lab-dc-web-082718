class Song < ActiveRecord::Base

    validates :title, presence: true
    validates :title, uniqueness:
    {
        scope: [:release_year, :artist_name]
    }
    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true,false]}
    with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {
        less_than_or_equal_to: Date.today.year
      }
    end



    def released?
      self.released
    end

    # before_validation(on: :create) do
    #     # binding.pry
    #     self.release_year = release_year.to_i if attribute_present?("release_year")
    # end

end
