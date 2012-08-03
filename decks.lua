require 'class'

Decks = class()

function Decks:init()
   self.enemyBulletDeck = nil
   self.wallDeck = nil
end

function Decks:enemyBullet()
   if self.enemyBulletDeck then return self.enemyBulletDeck end
   self.enemyBulletDeck = MOAIGfxQuad2D.new()
   self.enemyBulletDeck:setTexture ( "enemy_bullet.png" )
   self.enemyBulletDeck:setRect ( -8, -16, 8, 16 )
   return self.enemyBulletDeck
end


function Decks:wall()
   if self.wallDeck then return self.wallDeck end
   self.wallDeck = MOAIGfxQuad2D.new()
   self.wallDeck:setTexture ( "wall.png" )
   self.wallDeck:setRect ( -8, -8, 8, 8 )
   return self.wallDeck
end


