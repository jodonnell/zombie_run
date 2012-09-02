require 'class'
require 'game_sprite'

WaterCooler = class(GameSprite)

function WaterCooler:init()
   self.sprite = display.newImage("images/obstacles/cooler.png")
end
