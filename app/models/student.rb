require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
	attr_reader :age, :name
	validates :age, :numericality => {greater_than: 4}
	validates :email, :uniqueness => true
	validates :email, :format => { :with => /\w@\w{1}+[.]\w{2}/}
	validates :phone, :format => { :with => /\d{3}[-]\d{3}[-]\d{4}/}
# implement your Student model here
	def name
		@name = first_name + " " + last_name
	end

	def age
		now = Date.today.year
		@age = now - (birthday.year)
	end	
end

# student = Student.find 4
# student.name
# student.age

# p Student.all