pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

function zx0_decompress(get_in, get_out, set_out)
	local offset, shift, input_count, output_count, last_byte, backtrack, temp, v = 1, 0, -1, 0

	local function read_byte()
		input_count += 1
		return get_in(input_count)
	end

	local function read_bit()
		if backtrack then
			temp, backtrack = backtrack & 1
			return temp
		end
		if (shift == 0) last_byte, shift = read_byte(), 8
		shift -= 1
		return last_byte >> shift & 1
	end

	local function read_var(invert)
		v = 1
		while (read_bit() == 0) v <<= 1 v |= read_bit() ^^ invert
		return v
	end

	::copy_literals::
	for _ = 1, read_var"0" do set_out(output_count, read_byte()) output_count += 1 end
	if (read_bit() == 0) read_var"0" goto copy_from_last_offset

	::copy_from_new_offset::
	if (read_var"1" == 256) return
	backtrack = read_byte()
	offset, v = v * 128 - backtrack \ 2, read_var"0" + 1

	::copy_from_last_offset::
	for _ = 1, v do set_out(output_count, get_out(output_count - offset)) output_count += 1 end

	::loop::
	if (read_bit() == 0) goto copy_literals
	goto copy_from_new_offset
end
