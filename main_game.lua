require 'class'
require 'player'

local numSprites = 700

MainGame = class()

function MainGame:init()
   MOAISim.openWindow ("Game!", 640, 960)
   self.viewport = self:createViewport()
   self.layer = self:createLayer()
   
   self.player = Player()
   self.layer:insertProp( self.player.prop )
end

function MainGame:createViewport()
   local viewport = MOAIViewport.new()
   viewport:setSize ( 640, 960 )
   viewport:setScale ( 320, 480 )
   viewport:setOffset ( -1, -1 )
   return viewport
end

function MainGame:createLayer()
   local layer = MOAILayer2D.new()
   layer:setViewport( self.viewport )
   MOAISim.pushRenderPass( layer )
   return layer
end

function MainGame:createMainGameLoop()
   local gameOver = false

   local mainThread = MOAICoroutine.new()
   mainThread:run(function()
		     while not gameOver do
			coroutine.yield()
			self:mainGameLoop()
		     end
		  end)
end

function MainGame:mainGameLoop()
   local frames = 0
   frames = frames + 1

   -- for i=1,numSprites do
   --    local x, y = self.sprites[i]:getLoc()

   --    if y > 490 then
   -- 	 self.sprites[i]:setLoc(x, 0)
   --    else
   -- 	 self.sprites[i]:setLoc(x, y + 10)
   --    end
   -- end
end

function MainGame:getSprites()
   return self.sprites
end