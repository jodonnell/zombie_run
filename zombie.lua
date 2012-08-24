require 'class'
require 'game_sprite'

Zombie = class(GameSprite)

function Zombie:init(x, y)
   self.sprite = display.newImage("images/wall/wall.png")
   self:setPos(x, y)
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
