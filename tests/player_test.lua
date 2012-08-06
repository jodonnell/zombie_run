module(..., package.seeall)

require "player"

function test_player()
   player = Player()
end


function test_player_loads_image()
   player = Player()
   assert_userdata(player.prop)
end

function test_can_move_right()
   player = Player()
   player:moveRight()
   local x, y = player:getLoc()
   assert_gt(160, x)
end

function test_can_move_left()
   player = Player()
   player:moveLeft()
   local x, y = player:getLoc()
   assert_lt(160, x)
end
