require 'test_helper'

class CourseTest < ActiveSupport::TestCase

=begin  
  test "should not save course without title, description and cost" do
    #user = FactoryGirl.create(:user)
    #sign_in user

    course = FactoryGirl.create(:course)
    assert_not course.save
    course.title = "Title"
    #assert_not course.save
    #course.description = "Description"
    #assert_not course.save
    #course.cost = 20
    assert course.save
  end
=end  

end