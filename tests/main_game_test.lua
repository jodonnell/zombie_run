module(..., package.seeall)

require "main_game"

function setup()
   main_game = MainGame()
end

function test_can_move_right()
   local x = main_game.player.prop:getLoc()
   main_game.control.movingRight = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   local after_x = main_game.player.prop:getLoc()
   assert_equal(x + 4, after_x)
end

function test_can_stop_move_right()
   local x = main_game.player.prop:getLoc()
   main_game.control.movingRight = true
   main_game:mainGameLoop()
   main_game.movingRight = false
   main_game:mainGameLoop()
   local after_x = main_game.player.prop:getLoc()
   assert_equal(x + 2, after_x)
end

function test_can_move_left()
   local x = main_game.player.prop:getLoc()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   local after_x = main_game.player.prop:getLoc()
   assert_equal(x - 4, after_x)
end

function test_can_stop_move_right()
   local x = main_game.player.prop:getLoc()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   main_game.control.movingLeft = false
   main_game:mainGameLoop()
   local after_x = main_game.player.prop:getLoc()
   assert_equal(x - 2, after_x)
end

function test_wall_is_created()
   for x=1,25 do
      main_game:mainGameLoop()
   end
   assert_table(main_game.walls[1])
end

function test_wall_moves_towards_you()
   for x=1,25 do
      main_game:mainGameLoop()
   end

   local x, y = main_game.walls[1].props[1]:getLoc()
   main_game:mainGameLoop()
   local new_x, new_y = main_game.walls[1].props[1]:getLoc()
   assert_lt(y, new_y)
end