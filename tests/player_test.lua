module(..., package.seeall)

require "player"

function test_player()
   player = Player()
end


function test_player_loads_image()
   player = Player()
   assert_userdata(player:prop)
end
