pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

function mem_set(start_addr)
	return function(i, v)
		return poke(start_addr+i, v)
	end
end
