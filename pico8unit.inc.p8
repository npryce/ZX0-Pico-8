pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- pico8 unit testing framework

function _init()

poke(0x5f2d, 1)


-- generic support functions

local function noop()
end

local function seq(f1,f2)
 return function()
  return f2(f1())
 end
end


-->8
-- running tests

local results
local run_test


local function sort(
 rs, start, endi
)
 local start, endi = 
   start or 1, endi or #rs
 
 if endi - start < 1 then 
  return
 end
 
 local pivot = start
 for i = start + 1, endi do
  if rs[i].name<=rs[pivot].name
  then
   if i == pivot + 1 then
    rs[pivot],rs[pivot+1] = 
      rs[pivot+1],rs[pivot]
   else
    rs[pivot],rs[pivot+1],rs[i]=
      rs[i],rs[pivot],rs[pivot+1]
   end
   pivot = pivot + 1
  end
 end
 
 sort(rs, start, pivot-1)
 sort(rs, pivot+1, endi)
end


local function trim_err(
 err
)
 local s = err
 
 for i = 1,#s-1 do
  if s[i] == ":" 
  and s[i+1] == " "
  then
   return sub(s,i+2)
  end
 end
 
 return err
end


local function run_test_case(
  name, test_fun, fixture
)
 local c = cocreate(function()
  local context = 
    fixture.before_each()
  test_fun(context)
  fixture.after_each(context)
 end)

 printh("running test: " .. name)
 local _,err = coresume(c)
 printh("")

 local r = {
  type = "test";
  name = name;
 }
 
 if err then
  r.passed = false
  r.message = trim_err(err)  
  r.trace = {}
  
  local lines = 
    split(trace(c),"\n",false)
  for i = 2,#lines-1 do
   add(r.trace,
     trim_err(lines[i]))
  end
  
  printh(r.name)
  printh(trace(c,err))
  
 elseif costatus(c) ~= "dead"
 then
  r.trace = "not complete!"
  r.passed = false
  
 else
  r.passed = true
 end
 
 return r
end

local function run_test_suite(
 name, tests, outer_fixture
)
 local rs = {
  type = "suite";
  name = name;
  passed = true;
 }
 
 local fixture = {
  before_each = 
   tests._before_each and
    seq(
     outer_fixture.before_each,
     tests._before_each
    )
   or outer_fixture.before_each;
  after_each = 
   tests._after_each and
    seq(
     tests._after_each,
     outer_fixture.after_each
    )
   or outer_fixture.after_each;
 }   
 
 for name,t in pairs(tests) do
  if tostr(name)[1] ~= "_" then
	  local r = 
	    run_test(name,t,fixture)
	  
	  rs.passed = 
	    rs.passed and r.passed
	  
	  add(rs, r)
  end
 end
 
 sort(rs)
 
 return rs
end


function run_test(
  name,t,fixture
)
 if type(t) == "function" then
  return run_test_case(
   name, t, fixture)
 elseif type(t) == "table" then
  return run_test_suite(
   name, t, fixture)
 end
end


local function collect(
 depth,
 r
)
 r.depth = depth
 add(results,r)
 
 if r.type == "test" then
  results.test_count += 1
  if r.passed then
   results.pass_count += 1
  else
   results.fail_count += 1
   results.passed = false
  end
 else -- r.type == "suite"
  for r2 in all(r) do
   collect(depth+1,r2)
  end
 end
end


local function run_all_tests()
 results = {
  passed = true;
  test_count = 0;
  pass_count = 0;
  fail_count = 0;
 }
 
 local rs = {}
 for name,t in pairs(tests) do
  add(rs, run_test(name,t,{
    before_each = noop,
    after_each = noop
   }))
 end
 
 sort(rs)
 
 for r in all(rs) do
  collect(0,r)
 end
end



-->8
-- ui

local selection
local show_detail = false

function wwrap(s)
 local ret,len = "",0
 
 for word
 in all(split(s," ",false)) 
 do
  if len+#word > 32 then
   ret=ret.."\n"
   len=0
  end
  ret=ret..word.." "
  len += #word+1
 end
 
 return ret
end

function is_test_failure(r)
  return r.type == "test"
     and not r.passed
end

local function first_failure()
 for i = 1,#results do
  local r = results[i]
  
  if is_test_failure(r) then
   return i
  end
 end
 
 return 1
end

local function next_failure(
 s,ds
)
 local s2 = s
 
 while true do
  s2 = s2 + ds
  local r = results[s2]
  
  if r == nil then
   return s
  elseif is_test_failure(r) 
  then
   return s2
  end
 end
end


function _update()
 if not show_detail then
  local nav_failures =
   (not results.passed)
   and stat(28,226)
  
  if btnp(⬇️) then
		 selection = 
		   nav_failures 
		   and
		    next_failure(selection,1)
		   or
		    min(selection+1,#results)
	 elseif btnp(⬆️) then
		 selection = 
		   nav_failures
		   and
		    next_failure(selection,-1)
		   or
		    max(selection-1,1)
		end
	end
	
 if btnp(❎) or btnp(🅾️) then
  show_detail = not show_detail
 end
end

function result_color(r)
 color(r.passed and 11 or 8)
end

function row_y(row)
 return 2 + (row-1)*8
end

function draw_summary()
	result_color(results)
	rectfill(0,121,127,127)
	color(5)
	print(
	  (results.pass_count + 
	   results.fail_count) ..
	  " tests" ..
	  ". pass: " .. 
	  results.pass_count ..
	  ", fail: " .. 
	  results.fail_count .. ".",
	  1,122)
end

function draw_detail()
 local r = results[selection]
 
 color(7)
 print(r.name)
 
 
 print("")
 
 if r.passed then
  color(11)
  print("passed!")
 else
  print(wwrap(r.message))
  print("")
  for t in all(r.trace) do
   print(t)
  end
 end
end

function draw_results()
	
	local first_line = mid(
   0,
   #results-15,
   selection-8)
 camera(0,first_line*8)
 
	for i = 1,#results do
	 local r = results[i]
	 
	 local msg = ""
	 for d = 1,r.depth do
	  msg = msg .. "   "
	 end

	 if r.type == "suite" then
	  msg = msg .. 
	   "⁶:3e213f21211f0000"
	 elseif r.passed then
	  msg = msg .. 
	   "⁶:2010080502000000"
	 else
	  msg = msg .. 
	   "⁶:110a040a11000000"
	 end
	 
	 msg = msg .. " " .. r.name
	 
	 result_color(r)
	 print(msg, 8, row_y(i))
	end
	
	color(7)
	
	print("▶", 3,row_y(selection))
	
	camera()
	
	if selection > 8 then
		print("⁶:00081c3e00000000",
		0,0)
	end
	
	if selection < #results-7 then
		print("⁶:000000003e1c0800",
		0,112)
	end
		
	draw_summary()
end

function _draw()
 cls()
 
 if not results
 or #results == 0 
 then
  color(8 + (time()*6 % 8))
  print("time to write some tests...")
 elseif show_detail then
  draw_detail()
 else
  draw_results()
 end
end

-->8
-- entry point


run_all_tests()
selection = first_failure()

end -- of _init

-->8
-- assertions

function assert_nil(v)
 assert(v == nil,
  "expected nil\nwas " ..
  tostr(v))
end

local function _str(v, str)
 return v ~= nil 
   and str(v) 
   or "[nil]"
end

function assert_eq(t)
 local eq = 
   t.eq or function(a,b)
    return a == b
   end
 
 local prefix
 if t.message ~= nil then
  prefix = t.message .. "\n"
 else
  prefix = ""
 end
 
 assert(
   t.expected ~= nil
   and t.actual ~= nil
   and eq(t.expected,t.actual),
   
   prefix..
    "expected ".. 
    _str(t.expected,
      t.tostr or tostr)..
    "\n"..
    "actual   ".. 
    _str(t.actual,
      t.tostr or tostr)
 )
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000800001125411251112510c2510c2510c2510c2510c2510c2510c2410c2410c2310c2310c2210c2210c2110c211002010020100201002010020100201002010020100201002010020100201002010020100201
000400000505005050070500a0500c0500f05013050180501b05022050270502b0502e0502e0502e0402e02000000000000000000000000000000000000000000000000000000000000000000000000000000000
