require "main_game"
require "levels.level_1"

scaleFactor = 1.5

if os.getenv("LUA_TEST") then
   require "lunatest.lunatest"

   lunatest.suite("tests.main_game_test")
   lunatest.suite("tests.player_test")
   lunatest.suite("tests.zombie_test")
   lunatest.suite("tests.wall_test")

   lunatest.run()
   os.exit()
end

display.setStatusBar( display.HiddenStatusBar )

local main_game = MainGame(Level1())

function loop()
   main_game:mainGameLoop()
end

Runtime:addEventListener( "enterFrame", loop )

-- local fps = require("fps")
-- local performance = fps.PerformanceOutput.new();
-- performance.group.x, performance.group.y = display.contentWidth/2,  0;
-- performance.alpha = 0.6;