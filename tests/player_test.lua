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
   assert_gt(160, player:getX())
   assert_equal(1, player.sprite.xScale)
end

function test_can_move_left()
   player:moveLeft()
   assert_lt(160, player:getX())
   assert_equal(-1, player.sprite.xScale)
end
