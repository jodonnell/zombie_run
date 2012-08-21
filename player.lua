require 'class'
require 'game_sprite'

Player = class(GameSprite)

function Player:init()
   local spriteSheetData = require("enemy_bullet").getSpriteSheetData()
   local options = { spriteSheetFrames = spriteSheetData.frames }
   local imageSheet = graphics.newImageSheet( "enemy_bullet.png", options )

   self.sprite = display.newSprite(imageSheet, {start=1, count=4, time=1000})
   self.sprite:play()
   self:setPos(160, 380)
end

function Player:moveRight()
   self:setX(self:getX() + 2)
end

function Player:moveLeft()
   self:setX(self:getX() - 2)
end