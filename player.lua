require 'class'
require 'decks'

Player = class()

function Player:init()
   local decks = Decks()
   local prop = MOAIProp2D.new()
   prop:setDeck( decks:enemyBullet() )
   prop:setLoc(math.random(320), 100)
   self.prop = prop
end

