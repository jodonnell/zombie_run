require 'class'
require 'game_sprite'

FilingCabinet = class(GameSprite)

function FilingCabinet:init(x)
   self.sprite = display.newImage("images/obstacles/filecabinet.png")
   self:setX(x)
   self:setY(0)
end
