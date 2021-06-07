class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h,k| h[k] = []}
    end
    def name
        @name
    end 
    def slogan 
        @slogan
    end
    def teachers
        @teachers
    end
    def students 
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        return @students.include?(student)
    end

    def student_to_teacher_ratio
        return (@students.length / @teachers.length).to_i
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            return true
        end
        return false
    end
    def num_grades(student)
        @grades[student].count
    end

    def average_grade(student)
        if enrolled?(student) && num_grades(student) > 0
            @grades[student].sum / @grades[student].length
        else
            return nil
        end
        
    end

end
