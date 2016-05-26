# Example application demonstrating
# basic Ruby features. 
# This code loads given file into 
# associated application.

#When the interpreter encouters class definition
#makes it available for creating objects
class Launcher 
	#we created an instance of the class by new
	#to create an instance with some life/data, we can pass arguments in 'new'
	#To handle that we use initialize
	def initialize app_map
		@app_map = app_map #instance_var meaning it is available to all code in this object
		#you create this instance variable, when you create your object
		#It will be available to any methods
	#All classes in ruby inherit from the class Object
	#the objects they create have a default initialize method
	#when 'new' is called, it first allocates some resources for desired object
	#then invokes the fresh object's initialize method
	#if you wish to provide creation parameters via new, you must define your own initialize method
	#to handle the arguments in the
	#newly created instance
	end

	#execute the given file using associate app
	def run file_name
		application = select_app file_name #passing the file name to select_app
		puts "#{application} #{file_name}"
		system "#{application} #{file_name}"
		#Ruby's system method to invoke the app, passing file name
		#the system method simply kicks the given command into a sub-shell
	end

	#Given a file, look up matching app
	def select_app file_name
		ftype = file_type file_name
		@app_map[ ftype ]
		#this takes the file name and calls file type
		#receives the 'normalized' file extension
		#using it as a key into  @app_map ro see which app to run
	end

	#Return part of the file name string after the last '.'
	def file_type file_name
		File.extname(file_name).gsub(/^\./,'').downcase
		#takes file name and uses File.extname(extname is a ruby class method on File class) to get extension
		#the returned string consists the '.' that precedes file extension. 
		#example : File.extname("shell.rb") will return ".rb"
		#we don't need the '.' we just need 'rb'
		#hence it is stripped using gsub and regex
		#converts all that remains to lowercase using 'downcase'


	end
end

#creates a variable
#then assigns reference to the new instance of the class
#Ruby creates object instance by invoking
#new (class method) on launcher
#launcher = Launcher.new -> this will work if i pass something with new

#almost everything in Ruby is an object

#SIDE NOTE
#when you see foo.bar
#bar is a message passed to the object which is being referenced to by as foo
#most of the time the object will have a method bar
#

def help
	puts <<-END
	You must pass in the path to the file to launch.

	USAGE: #{__FILE__} target_file
	END
end

if ARGV.empty?
	help
	exit
end

app_map = {
	'html' => 'firefox',
	'rb' => 'gvim',
	'jpg' => 'gimp',
	'jpeg' => 'picasaphotoviewer',
	'pdf' => 'acroread'
}

l =Launcher.new app_map
target = ARGV.join ' '
l.run target
