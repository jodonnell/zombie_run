require 'class'
require 'player'
require 'wall'
require 'control'
require 'zombie'

MainGame = class()
control = Control()

function MainGame:init()
   self.frames = 0
   self.walls = {}
   self.zombies = {}
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

   if self.frames % 80 == 0 then
      self:createZombie()
   end

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

function MainGame:createWall()
   table.insert(self.walls, Wall(0, 12))
end

function MainGame:createZombie()
   table.insert(self.zombies, Zombie(100, 0))
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
