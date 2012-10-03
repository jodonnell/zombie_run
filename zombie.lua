require 'class'
require 'game_sprite'

Zombie = class(GameSprite)

function Zombie:init(x, y)
   local spriteSheetData = require("images.zombies.zombie").getSpriteSheetData()
   local options = { spriteSheetFrames = spriteSheetData.frames }
   local imageSheet = graphics.newImageSheet( "images/zombies/zombie.png", options )

   self.sprite = display.newSprite(imageSheet, {start=1, count=6, time=1000})
   self.sprite:play()

   self:setPos(x, -self.sprite.height)
   self.sprite:scale(scaleFactor, scaleFactor)
end

function Zombie:moveTowards(point)
   if point.y > self:getY() then
      self:setY(self:getY() + 4)
   elseif point.y + 80 < self:getY() then
      --self:setY(self:getY() + 1)
   else
      self:setY(self:getY() + 1)
   end

   if point.x > self:getX() then
      self:setX(self:getX() + 1)
   elseif point.x < self:getX() then
      self:setX(self:getX() - 1)
   end
end
