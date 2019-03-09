describe "BtPngquant" do

	it 'should raise exception if bit is smaller than 8' do
		expect {BT::PngQuant.new(bit: 7)}.to raise_error ArgumentError, "Bit cannot be smaller than 8"
	end

	it 'should raise exception if either max or min is lower than 0' do
		expect {BT::PngQuant.new(max: -1)}.to raise_error ArgumentError, "at least 0% quality"
		expect {BT::PngQuant.new(min: -1)}.to raise_error ArgumentError, "at least 0% quality"
	end

	it 'should raise exception if either max or min is larger than 100' do
		expect {BT::PngQuant.new(max: 101)}.to raise_error ArgumentError, "at most 100% quality"
		expect {BT::PngQuant.new(min: 101)}.to raise_error ArgumentError, "at most 100% quality"
	end

	it 'should raise exception if min is larger than max' do
		expect {BT::PngQuant.new(max: 10, min: 20)}.to raise_error ArgumentError, "max must be larger than min"
	end

	it 'should raise exception if speed is lower than 1' do
		expect {BT::PngQuant.new(speed: 0)}.to raise_error ArgumentError, "Lowest speed is 1"
	end

	it 'should raise exception if speed is larger than 11' do
		expect {BT::PngQuant.new(speed: 12)}.to raise_error ArgumentError, "Maximum speed is 11"
	end

		# it 'should compress the image as expected' do
		# 	image = IO.binread "sophie.png"
		# 	image.extend StreamLike
		# 	expected = IO.binread "small.png"
		# 	quant = BT::PngQuant.new(speed: 11, iebug: false)
		# 	compressed = image > quant
		# 	expect(compressed.length).to eq(expected.length)
		# end

end
