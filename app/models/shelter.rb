class Shelter < ApplicationRecord

	# has_many :workers, dependent: destroy

	has_many :animals

end
