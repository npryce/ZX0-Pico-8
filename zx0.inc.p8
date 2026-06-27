pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

function zx0_decompress(
	get_input_byte,
	get_output_byte,
	set_output_byte
)
	local last_offset, bit_shift, input_count_m1, output_count,  bit_value, last_byte, temp = unpack(split"1,0,-1,0")

	local function read_byte()
		input_count_m1 += 1
		return get_input_byte(input_count_m1)
	end

	local function read_bit()
		if last_byte then
			temp, last_byte = last_byte & 1
			return temp
		else
			bit_shift -= 1
			if bit_shift == -1 then
				bit_value, bit_shift = read_byte(), 7
			end
			return bit_value>>bit_shift & 1
		end
	end

	local function read_var(invert)
		local v = 1
		while read_bit() == 0 do
			v <<= 1
			v |= read_bit()~invert
		end
		return v
	end

	local function write_byte(b)
		set_output_byte(output_count, b)
		output_count += 1
	end

	local function copy_bytes(n)
		for _ = 1,n do
			write_byte(
				get_output_byte(
					output_count-last_offset))
		end
	end

	::copy_literals::
		for _ = 1,read_var(0) do
			write_byte(read_byte())
		end

		if read_bit() == 0 then
			-- ::copy_from_last_offset::
			copy_bytes(read_var(0))

			goto loop
		end

	::copy_from_new_offset::
		temp = read_var(1) --msb
		if (temp == 256) return

		last_byte = read_byte()
		last_offset = temp * 128 - last_byte\2

		copy_bytes(read_var(0) + 1)

	::loop::
		if read_bit() == 0 then
			goto copy_literals
		else
			goto copy_from_new_offset
		end
end
