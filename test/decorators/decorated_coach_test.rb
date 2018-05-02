require 'test_helper'

class DecoratedCoachTest < ActiveSupport::TestCase
  test 'changes blanks to nil' do
    coach = Coach.new(city: 'Toronto', province: '')
    decorated_coach = DecoratedCoach.new(coach)

    assert_equal('Toronto', decorated_coach.city, 'delegates attribute to coach if not blank')
    assert_nil(decorated_coach.province, 'changes value to nil if empty string')
    assert_nil(decorated_coach.country, 'keeps value at nil if nil')
  end
end
