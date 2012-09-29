require 'class'
require 'game_sprite'

WallUnit = class(GameSprite)

function WallUnit:init()
   self.sprite = display.newImage("images/wall/wall_middle.png")
   self.sprite:scale(scaleFactor, scaleFactor)
end
