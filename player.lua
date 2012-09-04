require 'class'
require 'game_sprite'

Player = class(GameSprite)

function Player:init()
   local spriteSheetData = require("images.player.player").getSpriteSheetData()
   local options = { spriteSheetFrames = spriteSheetData.frames }
   local imageSheet = graphics.newImageSheet( "images/player/player.png", options )

   self.sprite = display.newSprite(imageSheet, {start=1, count=8, time=1000})
   self.sprite:play()
   self:setPos(160, 380)
end

function Player:moveRight()
   self:setX(self:getX() + 3)
   self.sprite.xScale = 1
end

function Player:moveLeft()
   self:setX(self:getX() - 3)
   self.sprite.xScale = -1
end