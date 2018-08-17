require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
	
	test "animal attributes must not be empty" do
		animal = Animal.new
		assert animal.invalid?
		assert animal.errors[:temp_name].any?
		assert animal.errors[:status].any?
		assert animal.errors[:shelter].any?

	end


	test "animal should have a valid status" do
		animal = Animal.new(temp_name: "chip",
							status: -1,
							shelter: shelters(:one))
	end

end
