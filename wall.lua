require 'class'
require 'decks'

Wall = class()

function Wall:init(start, length)
   local decks = Decks()
   self.props = {}
   for i=1,length do
      self.props[i] = MOAIProp2D.new()
      self.props[i]:setDeck( decks:wall() )

      local width, height = self.props[i]:getDims()
      local x = start + width * (i - 1)
      self.props[i]:setLoc(x, 100)
   end
end
