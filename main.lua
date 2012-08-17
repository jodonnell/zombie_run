require "main_game"

if os.getenv("LUA_TEST") then
   require "lunatest.lunatest"

   lunatest.suite("tests.main_game_test")
   lunatest.suite("tests.player_test")
   lunatest.suite("tests.wall_test")

   lunatest.run()
   os.exit()
end


local main_game = MainGame()

function loop()
   main_game:mainGameLoop()
end

Runtime:addEventListener( "enterFrame", loop )
