pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

function table_get(t)
	return function(i)
		assert(i < #t,
		 "get out of bounds, "
		 .. i .. " >= " .. #t)
			return t[i+1]
	end
end