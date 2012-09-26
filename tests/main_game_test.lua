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
   assert_gt(x, main_game.player:getX())
end

function test_can_stop_move_right()
   local x = main_game.player:getX()
   main_game.control.movingRight = true
   main_game:mainGameLoop()
   assert_gt(x, main_game.player:getX())
   
   local new_x = main_game.player:getX()
   main_game.control.movingRight = false
   main_game:mainGameLoop()
   assert_equal(new_x, main_game.player:getX())
end

function test_can_move_left()
   local x = main_game.player:getX()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   main_game:mainGameLoop()
   assert_lt(x, main_game.player:getX())
end

function test_can_stop_move_left()
   local x = main_game.player:getX()
   main_game.control.movingLeft = true
   main_game:mainGameLoop()
   assert_lt(x, main_game.player:getX())

   local new_x = main_game.player:getX()
   main_game.control.movingLeft = false
   main_game:mainGameLoop()
   assert_equal(new_x, main_game.player:getX())
end

function test_wall_is_created()
   main_game:createWall(20, 2)
   assert_table(main_game.walls[1])
end

function test_wall_moves_towards_you()
   main_game:createWall(20, 2)
   local y = main_game.walls[1].units[1]:getY()
   main_game:mainGameLoop()
   assert_gt(y, main_game.walls[1].units[1]:getY())
end

function test_wall_kills_you()
   main_game:createWall(120, 5)
   for x=1,100 do main_game:mainGameLoop() end
   assert_true(main_game.gameOver)
end

function test_zombie_moves_towards_you()
   main_game:createZombie(100, 0)
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

function test_carpets_show_up()
   assert_gt(100, #main_game.carpets)
end

function test_carpets_move()
   local old_y = main_game.carpets[1].y
   main_game:mainGameLoop()
   assert_gt(old_y, main_game.carpets[1].y)
end

function test_can_create_chair()
   main_game:createChair(10)
   assert_equal(10, main_game.obstacles[1]:getX())
end

function test_can_create_filing_cabinet()
   main_game:createFilingCabinet(10)
   assert_equal(10, main_game.obstacles[1]:getX())
end

function test_obstacles_move_down()
   main_game:createChair(10)
   local old_y = main_game.obstacles[1]:getY()
   main_game:mainGameLoop()

   assert_gt(old_y, main_game.obstacles[1]:getY())
end

function test_collides_with_obstacles()
   main_game:createChair(main_game.player:getX())
   main_game:mainGameLoop()

   for x=1,90 do main_game:mainGameLoop() end
   assert_true(main_game.gameOver)
end