require 'class'
require 'player'
require 'wall'
require 'control'

local numSprites = 700

SCREEN_WIDTH = 320
SCREEN_HEIGHT = 480

MainGame = class()

control = Control()

function MainGame:init()
   self.frames = 0
   self.walls = {}
   self.gameOver = false

   self.player = Player()
   self.control = control
end

function MainGame:createMainGameLoop()
   while not self.gameOver do
      self:mainGameLoop()
   end
end

function MainGame:mainGameLoop()
   if self.gameOver then return end

   self.frames = self.frames + 1

   if self.frames == 20 then
      self:createWall()
   end

   if #self.walls > 0 then
      for i,wall in ipairs(self.walls) do
	 wall:moveDown()
      end
   end

   self:checkForCollision()

   if control.movingRight then
      self.player:moveRight()
   end

   if control.movingLeft then
      self.player:moveLeft()
   end

end

function MainGame:createWall()
   table.insert(self.walls, Wall(0, 12))
end

function MainGame:checkForCollision()
   for i, wall in ipairs(self.walls) do
      if wall:collidesWith(self.player.sprite) then
	 self.gameOver = true
      end
   end
end

local function onScreenTouch( event )
  if event.phase == "began" then
     if event.x > 160 then
	control.movingRight = true
     else
	control.movingLeft = true
     end
  elseif event.phase == "moved" then
  elseif event.phase == "ended" or event.phase == "cancelled" then
     control.movingRight = false
     control.movingLeft = false
  end

  return true
end

Runtime:addEventListener( "touch", onScreenTouch )
