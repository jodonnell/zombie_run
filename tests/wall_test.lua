module(..., package.seeall)

require "wall"

function setup()
   wall = Wall(0, 6)
end

function test_has_prop()
   assert_userdata(wall.props[1])
end

function test_has_hole()
   local x, y = wall.props[1]:getLoc()
   assert_equal(0, x)
end

function test_contains_the_right_length_of_props()
   assert_equal(6, table.getn(wall.props))
end

function test_the_wall_is_spread_out_correctly()
   local width, height = wall.props[1]:getDims()

   local x, y = wall.props[1]:getLoc()
   assert_equal(0, x)

   local x, y = wall.props[2]:getLoc()
   assert_equal(width, x)

   local x, y = wall.props[3]:getLoc()
   assert_equal(width * 2, x)
end