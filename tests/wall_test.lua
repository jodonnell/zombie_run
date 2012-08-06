module(..., package.seeall)

require "wall"

function setup()
   wall = Wall(0, 6)
end

function test_has_prop()
   assert_userdata(wall.units[1].prop)
end

function test_contains_the_right_length_of_props()
   assert_equal(6, table.getn(wall.units))
end

function test_the_wall_is_spread_out_correctly()
   local width, height = wall.units[1]:getDims()

   local x, y = wall.units[1]:getLoc()
   assert_equal(width / 2, x)

   local x, y = wall.units[2]:getLoc()
   assert_equal(width + width / 2 , x)

   local x, y = wall.units[3]:getLoc()
   assert_equal(width * 2 + width / 2, x)
end

function test_wall_can_move_down()
   wall:moveDown()

   for i, unit in ipairs(wall.units) do
      local x, y = unit:getLoc()
      assert_lt(470, y)
   end
end

function test_collision_detection()
   player = Player()
   player.prop:setLoc(1, 471)
   assert_true(wall:collidesWith(player))
end