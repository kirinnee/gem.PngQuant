require "bt_pngquant/version"
require "bt_pngquant/shell_helper"
require "binary_transformer"

using BT

module BT
	class PngQuant < BinaryTransformer::Transformer

		def initialize(bit: 256, min: 65, max: 80, speed: 3, iebug: false)
			raise ArgumentError.new("Bit cannot be smaller than 8") if bit < 8
			raise ArgumentError.new("at least 0% quality") if min < 0 or max < 0
			raise ArgumentError.new("at most 100% quality") if max > 100 or min > 100
			raise ArgumentError.new("max must be larger than min") if min > max
			raise ArgumentError.new("Lowest speed is 1") if speed < 1
			raise ArgumentError.new("Maximum speed is 11") if speed > 11
			@min = min
			@max = max
			@speed = speed
			@ie_bug = iebug ? "--iebug " : ""
			@bit = bit
		end

		def transform(bytes)
			ret = "pngquant #{@bit} --speed #{@speed} #{@ie_bug}--quality=#{@min}-#{@max}" << bytes
			ret.length > bytes.length ? bytes : ret
		end

		# @return [Array<String>]
		def accepted_type
			["image/png"]
		end
	end
end