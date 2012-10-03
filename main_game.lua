require 'class'
require 'player'
require 'wall'
require 'chair'
require 'water_cooler'
require 'control'
require 'zombie'
require 'filing_cabinet'

MainGame = class()
control = Control()

function MainGame:init(level)
   self.frames = 0
   self.walls = {}
   self.zombies = {}
   self.obstacles = {}
   self.carpets = MainGame:createCarpets()
   self.gameOver = false

   self.level = level

   self.player = Player()
   self.control = control

   self.removeWallEvent = function(event) self:removeWall(event) end

   Runtime:addEventListener("wallOffscreen", self.removeWallEvent)
end

function MainGame:cleanup()
   Runtime:removeEventListener("wallOffscreen", self.removeWallEvent)
end

function MainGame:createCarpets()
   local carpets = {}
   for x=0,10 do
      for y=0,18 do
	 local carpet = nil
	 if (x + y) % 2 == 0 then
	    carpet = display.newImage("images/floor_tiles/carpet_1.png")
	    carpet:scale(scaleFactor, scaleFactor)
	 else
	    carpet = display.newImage("images/floor_tiles/carpet_2.png")
	    carpet:scale(scaleFactor, scaleFactor)
	 end
	 table.insert(carpets, carpet)
	 carpet.y = y * carpet.height
	 carpet.x = x * carpet.width
      end
   end
   return carpets
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

   self:moveCarpets()

   self:moveObstacles()

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

function MainGame:createZombie(x)
   table.insert(self.zombies, Zombie(x))
end

function MainGame:createChair(x)
   table.insert(self.obstacles, Chair(x))
end

function MainGame:createFilingCabinet(x)
   table.insert(self.obstacles, FilingCabinet(x))
end

function MainGame:createWaterCooler(x)
   table.insert(self.obstacles, WaterCooler(x))
end

function MainGame:checkForCollision()
   self:checkForCollisionWith(self.walls)
   self:checkForCollisionWith(self.zombies)
   self:checkForCollisionWith(self.obstacles)
end

function MainGame:checkForCollisionWith(sprites)
   for i, sprite in ipairs(sprites) do
      if sprite:collidesWith(self.player.sprite) then
	 self.gameOver = true
      end
   end
end

function MainGame:moveObstacles()
   for i, obstacle in ipairs(self.obstacles) do
      obstacle:moveDown()
   end
end


function MainGame:moveCarpets()
   minCarpet = 1000
   for i, carpet in ipairs(self.carpets) do
      if carpet.y < minCarpet then
	 minCarpet = carpet.y
      end
   end

   for i, carpet in ipairs(self.carpets) do
      carpet.y = carpet.y + 4


      if carpet.y > (480 / carpet.height + 1) * carpet.height then
	 carpet.y = minCarpet - carpet.height + 4
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
