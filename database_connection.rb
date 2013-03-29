require 'singleton'
require 'sqlite3'

class RestaurantsReviewsDB < SQLite3::Database
  include Singleton

  def initialize
    super('restaurantsreviews.db')

    self.results_as_hash  = true
    self.type_translation = true
  end
end