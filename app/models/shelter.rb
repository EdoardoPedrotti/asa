class Shelter < ApplicationRecord

	has_many :workers, dependent: :nullify

	has_many :animals, dependent: :nullify

end
