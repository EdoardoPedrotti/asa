class User < ApplicationRecord
	has_many :adoption_requests, dependent: :destroy
end
