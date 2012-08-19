require 'class'
require 'game_sprite'

Player = class(GameSprite)

function Player:init()
   self.sprite = display.newImage("enemy_bullet.png")
   self.sprite.x = 160
   self.sprite.y = 380
end

function Player:moveRight()
   local x = self.sprite.x
   self:setX(self:getX() + 2)
end

function Player:moveLeft()
   local x = self.sprite.x
   self:setX(self:getX() - 2)
end