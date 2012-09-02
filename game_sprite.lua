require 'class'

GameSprite = class()

function GameSprite:collidesWith(sprite)
   local left = self.sprite.contentBounds.xMin <= sprite.contentBounds.xMin and self.sprite.contentBounds.xMax >= sprite.contentBounds.xMin
   local right = self.sprite.contentBounds.xMin >= sprite.contentBounds.xMin and self.sprite.contentBounds.xMin <= sprite.contentBounds.xMax
   local up = self.sprite.contentBounds.yMin <= sprite.contentBounds.yMin and self.sprite.contentBounds.yMax >= sprite.contentBounds.yMin
   local down = self.sprite.contentBounds.yMin >= sprite.contentBounds.yMin and self.sprite.contentBounds.yMin <= sprite.contentBounds.yMax

   return (left or right) and (up or down)
end

function GameSprite:getX()
   return self.sprite.x
end

function GameSprite:getY()
   return self.sprite.y
end

function GameSprite:setX(x)
   self.sprite.x = x
end

function GameSprite:setY(y)
   self.sprite.y = y
end

function GameSprite:getPos()
   return self.sprite.x, self.sprite.y
end

function GameSprite:setPos(x, y)
   self.sprite.x = x
   self.sprite.y = y
end

function GameSprite:moveDown()
   self.sprite.y = self.sprite.y + 4
end
