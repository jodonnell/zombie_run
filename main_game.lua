require 'class'
require 'player'
require 'wall'
require 'control'

local numSprites = 700

SCREEN_WIDTH = 320
SCREEN_HEIGHT = 480

MainGame = class()

function MainGame:init()
   self.frames = 0
   MOAISim.openWindow ("Game!", 640, 960)
   self.viewport = self:createViewport()
   self.layer = self:createLayer()
   
   self.player = Player()
   self.layer:insertProp( self.player.prop )

   self.control = Control()
end

function MainGame:createViewport()
   local viewport = MOAIViewport.new()
   viewport:setSize ( 640, 960 )
   viewport:setScale ( SCREEN_WIDTH, SCREEN_HEIGHT )
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
   self.frames = self.frames + 1

   if self.frames == 20 then
      self.wall = Wall(0, 12)
      for i,prop in ipairs(self.wall.props) do
	 self.layer:insertProp( prop )
      end
   end

   if self.wall then
      self.wall:moveDown()
   end

   if self.control.movingRight then
      self.player:moveRight()
   end
   if self.control.movingLeft then
      self.player:moveLeft()
   end

end

function MainGame:getSprites()
   return self.sprites
end