require 'test_helper'
require 'awesome_print'

class Api::CoachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Coach.destroy_all
  end

  test 'response status and content type' do
    get '/api/coach_directory'

    assert_response(:success, 'status is 200')
    assert_equal('application/json; charset=utf-8', @response.headers['Content-Type'])
  end

  test 'pagination' do
    coaches = 40.times.collect { Coach.create!(show_in_directory: 1) }

    get '/api/coach_directory'

    coaches_response = JSON.parse(@response.body)['coaches']

    assert_equal(25, coaches_response.length)
    assert_equal(coaches[0].id, coaches_response.first['id'])
    assert_equal(coaches[24].id, coaches_response.last['id'])

    get '/api/coach_directory?page=2'

    coaches_response = JSON.parse(@response.body)['coaches']

    assert_equal(15, coaches_response.length)
    assert_equal(coaches[25].id, coaches_response.first['id'])
    assert_equal(coaches[39].id, coaches_response.last['id'])

    get '/api/coach_directory?page=2&per_page=10'

    coaches_response = JSON.parse(@response.body)['coaches']

    assert_equal(10, coaches_response.length)
    assert_equal(coaches[10].id, coaches_response.first['id'])
    assert_equal(coaches[19].id, coaches_response.last['id'])
  end

  test 'search' do
    Coach.create!(show_in_directory: 1, fullname: 'Charisma Carpenter')
    Coach.create!(show_in_directory: 1, fullname: 'Karen Carpenter')

    get '/api/coach_directory?name=Charisma'

    coaches_response = JSON.parse(@response.body)['coaches']

    assert_equal(1, coaches_response.length)
    assert_equal('Charisma Carpenter', coaches_response.first['name'])
  end

  test 'response attributes' do
    coach = Coach.create!(
      show_in_directory: 1,
      fullname: 'Full Name',
      businessname: 'Business Name',
      address1: 'Address 1',
      address2: 'Address 2',
      city: 'City',
      province: 'Province',
      postalcode: 'Postal Code',
      country: 'Country',
      email: 'Email',
      businessphone: 'Business Phone',
      mobilephone: 'Mobile Phone',
      url: 'URL',
      specialty: 'Specialty',
      level1_status: 1)

    get '/api/coach_directory'

    coach_response = JSON.parse(@response.body)['coaches'][0]

    assert_equal({
      'id'=> coach.id,
      'name'=> 'Full Name',
      'certification_level' => 1,
      'tagline' => 'Specialty',
      'business_name' => 'Business Name',
      'location' => {
        'address1' => 'Address 1',
        'address2' => 'Address 2',
        'city' => 'City',
        'province' => 'Province',
        'postal_code' => 'Postal Code',
        'country' => 'Country'
      },
      'mobile_phone' => 'Mobile Phone',
      'website' => 'URL',
      'email' => 'Email'
    }, coach_response)
  end
end
