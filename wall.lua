require 'class'
require 'decks'

Wall = class()

function Wall:init(start, length)
   local decks = Decks()
   self.props = {}
   for i=1,length do
      self.props[i] = MOAIProp2D.new()
      self.props[i]:setDeck( decks:wall() )
      self.props[i]:setLoc(start, 100)
   end
end

function Wall:holeAt(pos)
end