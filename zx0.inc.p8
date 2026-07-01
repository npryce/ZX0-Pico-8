pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function zx0_decompress(get_in, get_out, set_out)
	local offset, shift, i, o, byte, last, temp, v = 1, 0, -1, 0

	local function rbyte()
		i += 1
		return get_in(i)
	end

	local function rbit()
		if last then
			temp, last = last & 1
			return temp
		end
		if (shift == 0) byte, shift = rbyte(), 8
		shift -= 1
		return byte >> shift & 1
	end

	local function rvar(inv)
		v = 1
		while (rbit() == 0) v <<= 1 v |= rbit() ^^ inv
		return v
	end

	::copy_literals::
	for _ = 1, rvar"0" do set_out(o, rbyte()) o+=1 end
	if (rbit() == 0) rvar"0" goto copy_from_last_offset

	::copy_from_new_offset::
	if (rvar"1" == 256) return
	last = rbyte()
	offset, v = v * 128 - last \ 2, rvar"0" + 1

	::copy_from_last_offset::
	for _ = 1, v do set_out(o, get_out(o - offset)) o+=1 end

	::loop::
	if (rbit() == 0) goto copy_literals
	goto copy_from_new_offset
end
