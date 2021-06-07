require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return @salaries.has_key?(title)
    end

    def >(new_startup)
        return true if self.funding > new_startup.funding
        return false
    end
    
    def hire(employee_name, title)
        if @salaries.has_key?(title)
            employee = Employee.new(employee_name, title)
            @employees << employee
        else
            return raise_error
        end
    end

    def size 
        return @employees.length
    end

    def pay_employee(employe)
        if @funding > @salaries[employe.title]
            employe.pay(@salaries[employe.title])
            @funding -= @salaries[employe.title]
        else
            return raise_error
        end
    end

    def payday
        @employees.each do |employe|
            pay_employee(employe)
        end
    end

    def average_salary
        newarr = @employees.map {|person| @salaries[person.title]}

        return newarr.sum / newarr.length
    end
    def close 
        @employees = []
        @funding = 0
    end

    def acquire(new_startup)
        @funding += new_startup.funding

        new_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        new_startup.employees.each {|employe| @employees << employe}

        new_startup.close
    end
end
