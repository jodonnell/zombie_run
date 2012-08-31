module(..., package.seeall)

require "main_game"
require "levels.test_level"

function setup()
   main_game = MainGame(TestLevel())
   main_game.control.movingRight = false
   main_game.control.movingLeft = false
end

function teardown()
   main_game:cleanup()
   main_game = nil
end

function test_can_move_right()
   local x = main_game.player:getX()
   main_game.control.movingRight = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   assert_equal(x + 4, main_game.player:getX())
end

function test_can_stop_move_right()
   local x = main_game.player:getX()
   main_game.control.movingRight = true
   main_game:mainGameLoop()
   main_game.control.movingRight = false
   main_game:mainGameLoop()
   assert_equal(x + 2, main_game.player:getX())
end

function test_can_move_left()
   local x = main_game.player:getX()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   assert_equal(x - 4, main_game.player:getX())
end

function test_can_stop_move_right()
   local x = main_game.player:getX()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   main_game.control.movingLeft = false
   main_game:mainGameLoop()
   assert_equal(x - 2, main_game.player:getX())
end

function test_wall_is_created()
   for x=1,25 do main_game:mainGameLoop() end
   assert_table(main_game.walls[1])
end

function test_wall_moves_towards_you()
   for x=1,25 do main_game:mainGameLoop() end

   local y = main_game.walls[1].units[1]:getY()
   main_game:mainGameLoop()
   assert_gt(y, main_game.walls[1].units[1]:getY())
end

function test_wall_kills_you()
   for x=1,140 do main_game:mainGameLoop() end
   assert_true(main_game.gameOver)
end

function test_zombie_moves_towards_you()
   for x=1,85 do main_game:mainGameLoop() end

   local y = main_game.zombies[1]:getY()
   main_game:mainGameLoop()
   assert_gt(y, main_game.zombies[1]:getY())
end

function test_zombie_will_kill_the_player()
   main_game:createZombie(100, 0)

   for x=1,90 do main_game:mainGameLoop() end
   assert_true(main_game.gameOver)
end

function test_wall_is_removed_when_receiving_event()
   for x=1,25 do main_game:mainGameLoop() end
   Runtime:dispatchEvent({name = "wallOffscreen", target = main_game.walls[1]})
   assert_equal(0, #main_game.walls)
end
