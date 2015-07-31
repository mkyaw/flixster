require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase

  def user
    # @user = @user || FactoryGirl.create(:user)
    @user ||= FactoryGirl.create(:user)
  end

  def setup
    sign_in user
  end
  
  test "create button creates a new course in database" do
    assert_difference 'Course.count' do
      post :create, :course => {
        :title => 'The title',
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

  test "create button does not create a new course when course is invalid" do
    assert_no_difference 'Course.count' do
      # This is invalid because title is missing
      post :create, :course => {
        :name => 'Hola',
        :description => 'Hello hello hello',
        :cost => 70
      }
    end

    assert_template :new
    assert_response :unprocessable_entity
  end

end
