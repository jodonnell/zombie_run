module(..., package.seeall)

require "player"

function setup()
   player = Player()
end

function test_player_has_sprite()
   assert_table(player.sprite)
end

function test_can_move_right()
   player:moveRight()
   local x = player.sprite.x
   assert_gt(160, x)
end

function test_can_move_left()
   player:moveLeft()
   local x = player.sprite.x
   assert_lt(160, x)
end
