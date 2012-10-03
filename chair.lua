require 'class'
require 'game_sprite'

Chair = class(GameSprite)

function Chair:init(x)
   self.sprite = display.newImage("images/obstacles/chair.png")
   self:setX(x)
   self:setY(-self.sprite.height)
   self.sprite:scale(scaleFactor, scaleFactor)
end
