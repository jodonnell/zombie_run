module(..., package.seeall)

require "decks"

function test_enemyBulletDeckNotNil()
   local decks = Decks()
   assert_userdata(decks:enemyBullet())
end

function test_enemyBulletDeckCaches()
   local decks = Decks()
   local enemyBulletDeck = decks:enemyBullet()
   assert_equal(enemyBulletDeck, decks:enemyBullet())
end
