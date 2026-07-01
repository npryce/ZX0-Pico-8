pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function zx0_decompress(get_in, get_out, set_out)
	local offset, shift, i, o, byte, last, temp, v = 1, 0, -1, 0

	local function read_byte()
		i += 1
		return get_in(i)
	end

	local function read_bit()
		if last then
			temp, last = last & 1
			return temp
		end
		if (shift == 0) byte, shift = read_byte(), 8
		shift -= 1
		return byte >> shift & 1
	end

	local function read_var(invert)
		v = 1
		while (read_bit() == 0) v <<= 1 v |= read_bit() ^^ invert
		return v
	end

	::copy_literals::
	for _ = 1, read_var"0" do set_out(o, read_byte()) o+=1 end
	if (read_bit() == 0) read_var"0" goto copy_from_last_offset

	::copy_from_new_offset::
	if (read_var"1" == 256) return
	last = read_byte()
	offset, v = v * 128 - last \ 2, read_var"0" + 1

	::copy_from_last_offset::
	for _ = 1, v do set_out(o, get_out(o - offset)) o+=1 end

	::loop::
	if (read_bit() == 0) goto copy_literals
	goto copy_from_new_offset
end
