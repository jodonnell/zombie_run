require 'class'
require 'sprite'

WallUnit = class(Sprite)

function WallUnit:init()
   self.sprite = display.newImage("wall.png")
end

function WallUnit:moveDown()
   self.sprite.y = self.sprite.y - 3
end


function WallUnit:collidesWith(sprite)
    local left = self.sprite.contentBounds.xMin <= sprite.contentBounds.xMin and self.sprite.contentBounds.xMax >= sprite.contentBounds.xMin
    local right = self.sprite.contentBounds.xMin >= sprite.contentBounds.xMin and self.sprite.contentBounds.xMin <= sprite.contentBounds.xMax
    local up = self.sprite.contentBounds.yMin <= sprite.contentBounds.yMin and self.sprite.contentBounds.yMax >= sprite.contentBounds.yMin
    local down = self.sprite.contentBounds.yMin >= sprite.contentBounds.yMin and self.sprite.contentBounds.yMin <= sprite.contentBounds.yMax

    return (left or right) and (up or down)
end