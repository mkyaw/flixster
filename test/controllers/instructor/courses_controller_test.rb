require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  
  test "create button creates a new course in database" do
    user = FactoryGirl.create(:user)
    sign_in user
    
    assert_difference 'Course.count' do
      post :create, :course => {
        :name => 'Hola',
        :description => 'Hola means hello',
        :cost => 20
      }
    end

    c = Course.last
    assert_redirected_to instructor_course_path(c)
    
    #assert_equal user, c.user
    assert_equal 1, user.courses.count
  end

end
