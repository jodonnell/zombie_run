require 'class'

GameSprite = class()

function GameSprite:collidesWith(sprite)
   local left = self.sprite.contentBounds.xMin <= sprite.contentBounds.xMin and self.sprite.contentBounds.xMax >= sprite.contentBounds.xMin
   local right = self.sprite.contentBounds.xMin >= sprite.contentBounds.xMin and self.sprite.contentBounds.xMin <= sprite.contentBounds.xMax
   local up = self.sprite.contentBounds.yMin <= sprite.contentBounds.yMin and self.sprite.contentBounds.yMax >= sprite.contentBounds.yMin
   local down = self.sprite.contentBounds.yMin >= sprite.contentBounds.yMin and self.sprite.contentBounds.yMin <= sprite.contentBounds.yMax

   return (left or right) and (up or down)
end


function GameSprite:getLoc()
   return self.prop:getLoc()
end

function GameSprite:setLoc(x, y)
   self.prop:setLoc(x, y)
end

function GameSprite:getDims()
   return self.sprite.width
end