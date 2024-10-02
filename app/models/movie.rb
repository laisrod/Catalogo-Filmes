class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director

  def released?
    release_year <= Date.today.year
  end
end
