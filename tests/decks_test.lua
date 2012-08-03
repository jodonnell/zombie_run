module(..., package.seeall)

require "decks"

function setup()
   decks = Decks()
end

function test_enemy_bullet_deck_not_nil()
   assert_userdata(decks:enemyBullet())
end

function test_enemy_bullet_deck_caches()
   local enemyBulletDeck = decks:enemyBullet()
   assert_equal(enemyBulletDeck, decks:enemyBullet())
end

function test_wall()
   assert_userdata(decks:wall())
end
