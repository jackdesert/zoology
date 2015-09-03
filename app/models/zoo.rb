class Zoo < ActiveRecord::Base

  has_many :animals, dependent: :destroy
  validates_presence_of :name

  attr_accessor :unique_species_count

  def self.with_species_count
    # This raw SQL is used to produce a count of unique species
    array = connection.execute('SELECT zoos.id, zoos.name AS name, COUNT(DISTINCT(animals.species)) as unique_species_count FROM zoos LEFT OUTER JOIN animals ON animals.zoo_id = zoos.id GROUP BY zoos.id ORDER BY zoos.name')

    # Keep only hash keys that interest us
    array.map do |hash|
      relevant_values = hash.symbolize_keys.slice(:id, :name, :unique_species_count)
      new(relevant_values)
    end
  end

end
