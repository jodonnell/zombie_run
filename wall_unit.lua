require 'class'
require 'game_sprite'

WallUnit = class(GameSprite)

function WallUnit:init()
   self.sprite = display.newImage("wall.png")
end

function WallUnit:moveDown()
   self.sprite.y = self.sprite.y + 3
end
