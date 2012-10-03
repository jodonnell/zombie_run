require 'class'
require 'wall_unit'
require 'wall_unit_cracked'
require 'wall_unit_left'
require 'wall_unit_right'

Wall = class()

function Wall:init(start, length)
   self.units = {}
   for i=1,length do
      if i == 1 then
	 self.units[i] = WallUnitLeft()
      elseif i == length then
	 self.units[i] = WallUnitRight()
      elseif i % 4 == 0 then
	 self.units[i] = WallUnitCracked()
      else
	 self.units[i] = WallUnit()
      end

      local width = self.units[i].sprite.width
      local x = start + width * (i - 1) + width / 2
      self.units[i]:setX(x)
      self.units[i]:setY(-self.units[i].sprite.height)
   end
end

function Wall:moveDown()
   for i, unit in ipairs(self.units) do
      unit:moveDown()
   end

   if self.units[1]:getY() > 480 then
      Runtime:dispatchEvent({name = "wallOffscreen", target = self})

      for i, unit in ipairs(self.units) do
	 unit.sprite:removeSelf()
      end
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
