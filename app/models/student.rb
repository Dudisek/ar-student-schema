require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
	attr_reader :age, :name
	validates :age, :numericality => {greater_than: 4}
	validates :email, :format => { :with => /\w@\w{1}+[.]\w{2}/}, :uniqueness => true
	validate :valid_phone? 
	# validates :phone, :format => { :with => /\D\d{3}\D{2}\d{3}\D\d{4}\D{2}\d{4}/, :message "Invalid phone number!"}

	# implement your Student model here
	def name
		@name = first_name + " " + last_name
	end

	def age
		now = Date.today.year
		@age = now - (birthday.year)
	end	

	def valid_phone?
		if self.phone.scan(/\d+/).join.length < 10
			errors.add(:phone, "Must contain at least 10 digits.")
		end
	end

end

# student = Student.find 4
# student.name
# student.age

# p Student.all