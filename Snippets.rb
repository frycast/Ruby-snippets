## %% Hello Doony
your_name = "Doony"
puts "Hello #{your_name}"

## %% Math
a = 3**2
b = 3**4
puts Math.sqrt(a+b)

## %% Function syntax
def hi
    puts "hello world"
end
hi()
hi # parentheses optional

## %% Named arguments and string interpolation
def hi(name = "world")
    puts "Hello #{name.capitalize}!"
end
hi()

## %% Create a class and instantiate object 
class Greeter
    def initialize(name = "World")
       @name = name
    end
    def say_hi
        puts "Hi #{@name}!"
    end
    def say_bye
        puts "Bye #{@name}, come back soon."
    end
end
greeter = Greeter.new("Pat")

## %% Access the instance methods of an object
Greeter.instance_methods

## %% Use false to exclude ancestor methods
Greeter.instance_methods(false)

## %% Check which methods the greeter class responds to
greeter.respond_to?("name")
greeter.respond_to?("say_hi")
greeter.respond_to?("to_s")

## %% You can reopen a class and modify it
# and the changes are accessible to existing instances!
class Greeter
    attr_accessor :name # makes it public
end
greeter = Greeter.new("Andy")
greeter.respond_to?("name")
greeter.respond_to?("name=") # check if we can set name
greeter.say_hi
greeter.name="Betty"
greeter
greeter.name
greeter.say_hi


## %% Class megagreeter with uses for respond_to?
class MegaGreeter
    attr_accessor :names
  
    # Create the object
    def initialize(names = "World")
      @names = names
    end
  
    # Say hi to everybody
    def say_hi
      if @names.nil?
        puts "..."
      elsif @names.respond_to?("each")
        # @names is a list of some kind, iterate!
        # The do block with parameter name is passed to the each method
        @names.each do |name|
          puts "Hello #{name}!"
        end
      else
        puts "Hello #{@names}!"
      end
    end
  
    # Say bye to everybody
    def say_bye
      if @names.nil?
        puts "..."
      elsif @names.respond_to?("join")
        # Join the list elements with commas
        puts "Goodbye #{@names.join(", ")}.  Come back soon!"
      else
        puts "Goodbye #{@names}.  Come back soon!"
      end
    end
end
  
# Contains the name of current file.
# $0 is the name of the file being used to start the program.
# So this checks that the current file is being used to start the program.
# it's like python's if __name__ == "__main__":
if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end

