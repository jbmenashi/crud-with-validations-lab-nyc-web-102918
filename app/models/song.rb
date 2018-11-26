class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?

  def released?
    released == true
  end

end
