require 'class'

Decks = class()

function Decks:init()
   self.enemyBulletDeck = nil
end

function Decks:enemyBullet()
   if self.enemyBulletDeck then return self.enemyBulletDeck end
   local gfxQuad = MOAIGfxQuad2D.new ()
   gfxQuad:setTexture ( "enemy_bullet.png" )
   gfxQuad:setRect ( -8, -16, 8, 16 )

   self.enemyBulletDeck = gfxQuad
   return self.enemyBulletDeck
end


