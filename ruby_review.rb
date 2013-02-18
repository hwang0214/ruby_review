# Testing / Assertion
# Define a method that takes two values and compares them, printing pass or fail
def assert_equal(actual, expected)
	if actual == expected
		puts "pass"
	else
		puts "fail"
end
 
assert_equal(1,1) #=> pass
assert_equal(2,1) #=> fail
 
# Use assert to test the following:
 
# define a method to sum the values of an array. Make this method defend against nils and
# other errors
 
def sum(numbers)
	result = 0
	numbers.collect do |i|
	result += i if i.is_a? Integer
	end
	result
end
 
assert_equal sum([]), 0
assert_equal sum([1,2]), 3
assert_equal sum([1,nil,2]), 3
assert_equal sum([1, "2", 2]), 3
 
# define a method that returns comfortable for temps between 60-80, cold for below and hot
# for above.
 
def temperature_bot(temp)
	if temp >=60 && temp <=80
		puts "comfortable"
	elsif temp < 60
		puts "cold"
	else
		puts "hot"
	end
end
 
assert_equal temperature_bot(65), "comfortable"
assert_equal temperature_bot(70), "comfortable"
assert_equal temperature_bot(85), "hot"
assert_equal temperature_bot(30), "cold"
 
# define an object, Person, that has a birthdate and a name. Define a method for a person
# that returns their age.

class Person
	attr_accessor :birthday, :name

	def age
		birth_year = @birthday.split("/").last.to_i
		Time.now.year - birth_year
	end
end


begin
  person = Person.new
  person.name = "Alan Turing"
  person.birthday = "06/23/1912"
 
  assert_equal person.name, "Alan Turing"
  assert_equal person.birthday, "06/23/1912"
  assert_equal person.age, 101
 
rescue => e
  puts "Fail: #{e}"
end