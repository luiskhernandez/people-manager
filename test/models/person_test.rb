require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  %w(first_name last_name).each do |attribute|
    should validate_presence_of(attribute.to_sym)
    should validate_length_of(attribute.to_sym).is_at_most(75)
  end

  should validate_uniqueness_of(:email)
  should validate_presence_of(:email)
  should validate_presence_of(:gender)
  should validate_length_of(:email).is_at_most(254)
  should validate_length_of(:job).is_at_most(75)
  should validate_inclusion_of(:gender).in_array ['female', 'male']
  be_past_date(:birthdate)
end
