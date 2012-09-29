require 'class'
require 'game_sprite'

WallUnitRight = class(GameSprite)

function WallUnitRight:init()
   self.sprite = display.newImage("images/wall/wall_end_R.png")
   self.sprite:scale(scaleFactor, scaleFactor)
end
