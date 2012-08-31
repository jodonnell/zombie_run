require 'class'
require 'player'
require 'wall'
require 'control'
require 'zombie'

MainGame = class()
control = Control()

function MainGame:init(level)
   self.frames = 0
   self.walls = {}
   self.zombies = {}
   self.gameOver = false

   self.level = level

   color = display.newRect(0, 0, display.contentWidth, display.contentHeight)
   color:setFillColor(200,200,200)

   self.player = Player()
   self.control = control

   self.removeWallEvent = function(event) self:removeWall(event) end

   Runtime:addEventListener("wallOffscreen", self.removeWallEvent)
end

function MainGame:cleanup()
   Runtime:removeEventListener("wallOffscreen", self.removeWallEvent)
end

function MainGame:removeWall(event)
   wallToRemove = 0
   for i,wall in ipairs(self.walls) do
      if wall == event.target then
	 wallToRemove = i
      end
   end

   if wallToRemove ~= 0 then
      table.remove(self.walls, wallToRemove)
   end
end

function MainGame:createMainGameLoop()
   while not self.gameOver do
      self:mainGameLoop()
   end
end

function MainGame:mainGameLoop()
   if self.gameOver then return end

   self.frames = self.frames + 1

   self:levelEvents()
   
   if #self.walls > 0 then
      for i,wall in ipairs(self.walls) do
	 wall:moveDown()
      end
   end

   if #self.zombies > 0 then
      for i,zombie in ipairs(self.zombies) do
	 zombie:moveTowards(self.player.sprite)
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

function MainGame:levelEvents()
   self.level:newFrame(self.frames, self)
end

function MainGame:createWall(start, length)
   table.insert(self.walls, Wall(start, length))
end

function MainGame:createZombie(x, y)
   table.insert(self.zombies, Zombie(x, y))
end

function MainGame:checkForCollision()
   self:checkForCollisionWith(self.walls)
   self:checkForCollisionWith(self.zombies)
end

function MainGame:checkForCollisionWith(sprites)
   for i, sprite in ipairs(sprites) do
      if sprite:collidesWith(self.player.sprite) then
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
