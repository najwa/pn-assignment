require 'test_helper'
require 'awesome_print'

class Api::CoachesControllerTest < ActionDispatch::IntegrationTest
  test 'response status and content type' do
    get '/api/coach_directory'

    assert_response(:success, 'status is 200')
    assert_equal('application/json; charset=utf-8', @response.headers['Content-Type'])
  end

  test 'pagination' do
    coaches = 40.times.collect { Coach.create!(show_in_directory: 1) }

    get '/api/coach_directory'

    assert_equal(25, JSON.parse(@response.body)['coaches'].length)
    assert_equal(coaches[0].id, JSON.parse(@response.body)['coaches'].first['id'])
    assert_equal(coaches[24].id, JSON.parse(@response.body)['coaches'].last['id'])

    get '/api/coach_directory?page=2'

    assert_equal(15, JSON.parse(@response.body)['coaches'].length)
    assert_equal(coaches[25].id, JSON.parse(@response.body)['coaches'].first['id'])
    assert_equal(coaches[39].id, JSON.parse(@response.body)['coaches'].last['id'])

    get '/api/coach_directory?page=2&per_page=10'

    assert_equal(10, JSON.parse(@response.body)['coaches'].length)
    assert_equal(coaches[10].id, JSON.parse(@response.body)['coaches'].first['id'])
    assert_equal(coaches[19].id, JSON.parse(@response.body)['coaches'].last['id'])
  end
end
