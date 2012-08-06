require 'class'
require 'decks'
require 'sprite'

WallUnit = class(Sprite)

function WallUnit:init(start, length)
   local decks = Decks()
   self.prop = MOAIProp2D.new()
   self.prop:setDeck( decks:wall() )
end

function WallUnit:moveDown()
   local x, y = self:getLoc()
   self:setLoc(x, y - 3)
end
