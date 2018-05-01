require 'test_helper'

class Api::CoachesControllerTest < ActionDispatch::IntegrationTest
  test "response" do
    get '/api/coach_directory'

    assert_response :success, "status is 200"
    assert_equal @response.headers["Content-Type"], "application/json; charset=utf-8"
  end
end
