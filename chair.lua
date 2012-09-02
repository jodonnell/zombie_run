require 'class'
require 'game_sprite'

Chair = class(GameSprite)

function Chair:init(x)
   self.sprite = display.newImage("images/obstacles/chair.png")
   self:setX(x)
   self:setY(0)
end
