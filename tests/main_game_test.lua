module(..., package.seeall)

require "main_game"

function setup()
   main_game = MainGame()
end

function test_can_move_right()
   local x, y = main_game.player.prop:getLoc()
   main_game.movingRight = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   local after_x, after_y = main_game.player.prop:getLoc()
   assert_equal(x + 2, after_x)
end

function test_can_stop_move_right()
   local x, y = main_game.player.prop:getLoc()
   main_game.movingRight = true
   main_game:mainGameLoop()
   main_game.movingRight = false
   main_game:mainGameLoop()
   local after_x, after_y = main_game.player.prop:getLoc()
   assert_equal(x + 1, after_x)
end

function test_can_move_left()
   local x, y = main_game.player.prop:getLoc()
   main_game.movingLeft = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   local after_x, after_y = main_game.player.prop:getLoc()
   assert_equal(x - 2, after_x)
end

function test_can_stop_move_right()
   local x, y = main_game.player.prop:getLoc()
   main_game.movingLeft = true
   main_game:mainGameLoop()
   main_game.movingLeft = false
   main_game:mainGameLoop()
   local after_x, after_y = main_game.player.prop:getLoc()
   assert_equal(x - 1, after_x)
end

function test_wall_is_created()
   for x=1,25 do
      main_game:mainGameLoop()
   end
   assert_table(main_game.wall)
end

function test_wall_moves_towards_you()
   for x=1,25 do
      main_game:mainGameLoop()
   end

   local x, y = main_game.wall.props[1]:getLoc()
   main_game:mainGameLoop()
   local new_x, new_y = main_game.wall.props[1]:getLoc()
   assert_lt(y, new_y)
end