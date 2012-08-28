require 'class'

Level1 = class()

function Level1:newFrame(frameNum, mainGame)
   if frameNum % 60 == 0 then
      mainGame:createWall(math.random(300), math.random(12))
   end

   if frameNum % 140 == 0 then
      mainGame:createZombie(math.random(300), 0)
   end
end