require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  setup do
    @coach = Coach.new
  end

  test '#certification_level' do
    @coach.level1_status = 1
    @coach.level2_status = 1

    assert_equal(2, @coach.certification_level, '2 if both certifications')

    @coach.level1_status = 0
    @coach.level2_status = 1

    assert_equal(2, @coach.certification_level, '2 if only level 2')

    @coach.level1_status = 1
    @coach.level2_status = 0

    assert_equal(1, @coach.certification_level, '1 if only level 1')

    @coach.level1_status = 0
    @coach.level2_status = 0

    assert_nil(@coach.certification_level, 'null if neither level')
  end

  test '#location' do
    @coach.city = 'City'
    @coach.province = 'Province'
    @coach.country = 'Country'

    assert_equal('City, Province, Country', @coach.location, 'joins city, province, country if all available')

    @coach.city = ''

    assert_equal('Province, Country', @coach.location, 'leaves out empty attributes')

    @coach.city = nil

    assert_equal('Province, Country', @coach.location, 'leaves out null attributes')
  end

  test '.search' do
    Coach.create(fullname: 'Karen Carpenter', postalcode: '12345', country: 'USA', show_in_directory: 1)
    Coach.create(fullname: 'Richard Carpenter', postalcode: '54321', country: 'USA', show_in_directory: 1)
    Coach.create(fullname: 'Wesley Jacobs', postalcode: '90210', country: 'USA', show_in_directory: 1)

    assert_equal(["Karen Carpenter", "Richard Carpenter"], Coach.search(name: 'carp').pluck(:fullname),  'search is case insensitive and partial')

    assert_equal(["Karen Carpenter"], Coach.search(name: 'carp', postal_code: '23').pluck(:fullname), 'multiple attributes can be searched at once')

    Coach.create(fullname: 'Charisma Carpenter', postalcode: '12345', country: 'USA', show_in_directory: 0)

    assert_equal(Coach.search(name: 'carp', postal_code: '23').pluck(:fullname), ["Karen Carpenter"], 'only displays coaches where show_in_directory is 1')
  end
end
