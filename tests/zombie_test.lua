module(..., package.seeall)

require "zombie"

function setup()
   zombie = Zombie(100, 100)
end

function test_zombie_has_sprite()
   assert_table(zombie.sprite)
end

function test_has_correct_pos()
   local x, y = zombie:getPos()
   assert_equal(100, x)
   assert_equal(100, y)
end

function test_can_be_attracted_to_point()
   zombie:moveTowards({x=200, y=200})
   local x, y = zombie:getPos()
   assert_gt(100, x)
   assert_gt(100, y)
end

function test_can_be_attracted_to_point()
   zombie:moveTowards({x=200, y=200})
   local x, y = zombie:getPos()
   assert_gt(100, x)
   assert_gt(100, y)
end
