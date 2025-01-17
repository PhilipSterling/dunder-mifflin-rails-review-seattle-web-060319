class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def show
        @employee = Employee.find(params[:id])
    end
    def new
        @employee = Employee.new
        @dogs = Dog.all
    end
    def create
        @dogs = Dog.all
        @employee= Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            render :new
        end
    end
    private
    def employee_params
        params.require(:employee).permit(:first_name,:last_name,:title,:office,:alias,:dog_id)
    end
end
