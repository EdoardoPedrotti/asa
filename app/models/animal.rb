class Animal < ApplicationRecord
	enum statuses: [:adoptable, :not_adoptable]

	belongs_to :shelter

	has_many :adoption_requests

	validates_presence_of :shelter

	validates :temp_name, :status, presence: true

	validates :status, inclusion: statuses.keys
	
	validates :image_url, allow_blank: true, format: {
	  with: %r{\.(gif|jpg|png)\Z}i,
	  message: 'Animal image must be a GIF, JPG or PNG'
	}
end
