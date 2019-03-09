require "open3"
module BT
	refine String do
		def <<(input_binary)
			Open3.popen3(self) do |stdin, stdout|
				stdin.binmode
				stdin.write input_binary
				stdin.close
				stdout.binmode
				stdout.read
			end
		end
	end
end
