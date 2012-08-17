module(..., package.seeall)

require "player"

function test_player()
   player = Player()
end

function test_player_has_sprite()
   player = Player()
   assert_table(player.sprite)
end

function test_can_move_right()
   player = Player()
   player:moveRight()
   local x = player.sprite.x
   assert_gt(160, x)
end

function test_can_move_left()
   player = Player()
   player:moveLeft()
   local x = player.sprite.x
   assert_lt(160, x)
end
