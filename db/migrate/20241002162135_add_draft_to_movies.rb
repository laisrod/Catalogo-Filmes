class AddDraftToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :draft, :boolean, default: false
  end
end
