require 'class'
require 'decks'
require 'sprite'

Player = class(Sprite)

function Player:init()
   local decks = Decks()
   local prop = MOAIProp2D.new()
   prop:setDeck( decks:enemyBullet() )
   prop:setLoc(160, 100)
   self.prop = prop
end

function Player:moveRight()
   local x, y = self:getLoc()
   self:setLoc(x + 2, y)
end

function Player:moveLeft()
   local x, y = self:getLoc()
   self:setLoc(x - 2, y)
end