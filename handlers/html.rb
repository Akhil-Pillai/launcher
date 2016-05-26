class Html

	DEFAULT_BROWSER = 'firefox'

	def run file, args
		if args.empty?
			system "#{DEFAULT_BROWSER} #{file}"
			else
			dispatch_on_parameters file, args
		end
	end

	def dispatch_on_parameters files,args

		cmd = args.shift
		send "do_#{cmd}", file, args
	end

	def do_chrome  file, args = nil
		system "chrome  #{file} #{args}"
	end
end
