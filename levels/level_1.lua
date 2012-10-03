require 'class'

Level1 = class()

function Level1:newFrame(frameNum, mainGame)
   if frameNum % 60 == 0 then
      mainGame:createWall(math.random(300), math.random(2, 12))
   end

   if frameNum % 140 == 0 then
      mainGame:createZombie(math.random(300))
   end

   if frameNum % 180 == 0 then
      mainGame:createWaterCooler(math.random(300))
   end

   if frameNum % 280 == 0 then
      mainGame:createChair(math.random(300))
   end

   if frameNum % 300 == 0 then
      mainGame:createFilingCabinet(math.random(300))
   end

end