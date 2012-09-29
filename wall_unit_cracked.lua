require 'class'
require 'game_sprite'

WallUnitCracked = class(GameSprite)

function WallUnitCracked:init()
   self.sprite = display.newImage("images/wall/wall_middle_crack.png")
   self.sprite:scale(scaleFactor, scaleFactor)
end
