require 'class'

Sprite = class()

function Sprite:collidesWith(otherProp)
   local x1, y1 = otherProp:getLoc()
   local x2, y2 = self.prop:getLoc()
   local width = otherProp:getDims()
   return self:distance( x1, y1, x2, y2 ) <= width
end

function Sprite:distance ( x1, y1, x2, y2 )
   return math.sqrt((( x2 - x1 ) ^ 2 ) + (( y2 - y1 ) ^ 2 ))
end

function Sprite:getLoc()
   return self.prop:getLoc()
end

function Sprite:setLoc(x, y)
   self.prop:setLoc(x, y)
end

function Sprite:getDims()
   return self.prop:getDims()
end