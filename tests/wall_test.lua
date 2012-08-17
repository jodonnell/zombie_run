module(..., package.seeall)

require "wall"

function setup()
   wall = Wall(0, 6)
end

function test_has_sprite()
   assert_table(wall.units[1].sprite)
end

function test_contains_the_right_length_of_props()
   assert_equal(6, table.getn(wall.units))
end

function test_the_wall_is_spread_out_correctly()
   local width = wall.units[1].sprite.width
   local height = wall.units[1].sprite.height

   local x = wall.units[1].sprite.x
   assert_equal(width / 2, x)

   local x = wall.units[2].sprite.x
   assert_equal(width + width / 2 , x)

   local x = wall.units[3].sprite.x
   assert_equal(width * 2 + width / 2, x)
end

function test_wall_can_move_down()
   wall:moveDown()

   for i, unit in ipairs(wall.units) do
      assert_lt(470, unit.sprite.y)
   end
end

function test_collision_detection()
   player = Player()
   player.sprite.x = 1
   player.sprite.y = 471
   assert_true(wall:collidesWith(player.sprite))
end