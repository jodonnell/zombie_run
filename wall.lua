require 'class'
require 'decks'

Wall = class()

function Wall:init(start, length)
   local decks = Decks()
   self.props = {}
   for i=1,length do
      self.props[i] = MOAIProp2D.new()
      self.props[i]:setDeck( decks:wall() )

      local width, height = self.props[i]:getDims()
      local x = start + width * (i - 1) + width / 2
      self.props[i]:setLoc(x, 470)
   end
end

function Wall:moveDown()
   for i,prop in ipairs(self.props) do
      local x, y = prop:getLoc()
      prop:setLoc(x, y - 3)
   end
end

function Wall:collidesWith(sprite)
   for i,prop in ipairs(self.props) do
      collides = self:collidesWithProp(prop, sprite.prop)
      if collides then
	 return true
      end
   end
   return false
end

function Wall:collidesWithProp(prop, prop2)
   local x1, y1 = prop2:getLoc()
   local x2, y2 = prop:getLoc()
   local width = prop2:getDims()
   return self:distance ( x1, y1, x2, y2 ) <= width
end

function Wall:distance ( x1, y1, x2, y2 )
   return math.sqrt ((( x2 - x1 ) ^ 2 ) + (( y2 - y1 ) ^ 2 ))
end