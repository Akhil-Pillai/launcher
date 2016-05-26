require_relative 'launcher'
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
	'pdf' => 'acroread',
	'txt' => 'notepad'
}

l =Launcher.new app_map
target = ARGV.join ' '
l.run target