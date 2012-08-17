require 'class'
require 'wall_unit'

Wall = class()

function Wall:init(start, length)
   self.units = {}
   for i=1,length do
      self.units[i] = WallUnit()
      local width = self.units[i].sprite.width
      local x = start + width * (i - 1) + width / 2
      self.units[i].sprite.x = x
      self.units[i].sprite.y = 470
   end
end

function Wall:moveDown()
   for i, unit in ipairs(self.units) do
      unit:moveDown()
   end
end

function Wall:collidesWith(sprite)
   for i, unit in ipairs(self.units) do
      collides = unit:collidesWith(sprite)
      if collides then
   	 return true
      end
   end
   return false
end
