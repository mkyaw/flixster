class User < ActiveRecord::Base
	has_many :courses
  has_many :enrollments

### refactoring one last time using has_many :through relation
### to replace "enrolled_courses = enrollments.collect(&:course)"
  has_many :enrolled_courses, :through => :enrollments, :source => :course
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def enrolled_in?(course)
    
### refactoring once more using "&:" and "collect"
    # enrolled_courses = enrollments.collect(&:course)


### refactoring code below using "collect" instead of "each"
    
=begin
    enrolled_courses = enrollments.collect do |enrollment|
      enrollment.course
    end
=end

### code before refactoring

=begin
    enrolled_courses = []
    enrollments.each do |enrollment|
      enrolled_courses << enrollment.course
    end

=end
    
    return enrolled_courses.include?(course)
  end
end
