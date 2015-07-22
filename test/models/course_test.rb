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

  test "Course should not allow a course without a title to be created" do
    course = Course.new(:title => nil, :description => 'omg', :cost => 20)
    course.valid?
    problems_with_course_title = course.errors[:title]
    has_error = problems_with_course_title.present?
    assert_equal true, has_error
  end

  test "Course, should be allowed to be created if it has a good title (and good other stuff too)" do
    course = Course.new(:title => "title", :description => "omg", :cost => 20)
    course.valid?

#  {:title => [‘isn’t there’] }
#  { }

    problems_with_course_title = course.errors[:title]
    has_error = problems_with_course_title.present?
    assert_equal false, has_error
end



end