require 'pry'
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    binding.pry
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @students = Student.search(params[:query])
    render 'index'
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
