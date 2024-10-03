class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director

  has_one_attached :poster

  # Validações
  validates :title, presence: true
  validates :release_year, presence: true
  validates :draft, inclusion: { in: [true, false] } # Validação para o campo draft

  def draft?
    self.draft
  end

  def publish!
    self.update(draft: false)
  end
end
