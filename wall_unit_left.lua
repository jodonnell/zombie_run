require 'class'
require 'game_sprite'

WallUnitLeft = class(GameSprite)

function WallUnitLeft:init()
   self.sprite = display.newImage("images/wall/wall_end_L.png")
   self.sprite:scale(scaleFactor, scaleFactor)
end
