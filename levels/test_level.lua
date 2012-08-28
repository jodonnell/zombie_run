require 'class'

TestLevel = class()

function TestLevel:init()

end

function TestLevel:newFrame(frameNum, mainGame)
   if frameNum == 20 then
      mainGame:createWall(0, 12)
   end

   if frameNum % 80 == 0 then
      mainGame:createZombie(100, 0)
   end
end