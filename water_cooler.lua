require 'class'
require 'game_sprite'

WaterCooler = class(GameSprite)

function WaterCooler:init(x)
   self.sprite = display.newImage("images/obstacles/cooler.png")
   self:setX(x)
   self:setY(-self.sprite.height)
   self.sprite:scale(scaleFactor, scaleFactor)
end
