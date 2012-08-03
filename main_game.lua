require 'class'
require 'player'
require 'wall'

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

   self:setupTouch()
end

function MainGame:setupTouch()
   self.movingRight = false
   self.movingLeft = false

   if MOAIInputMgr.device.touch then
      MOAIInputMgr.device.touch:setCallback ( 
	 
	 function ( eventType, id, x, y, tapCount )
	    local adjustedX, adjustedY = self.layer:wndToWorld( x, y )

	    local left = adjustedX < SCREEN_WIDTH / 2

	    if left then
	       if ( eventType == MOAITouchSensor.TOUCH_DOWN ) then
		  self.movingLeft = true
	       end

	       if ( eventType == MOAITouchSensor.TOUCH_UP ) then
		  self.movingLeft = false
		  self.movingRight = false
	       end
	    else
	       if ( eventType == MOAITouchSensor.TOUCH_DOWN ) then
		  self.movingRight = true
	       end

	       if ( eventType == MOAITouchSensor.TOUCH_UP ) then
		  self.movingRight = false
		  self.movingLeft = false
	       end
	    end
	 end)
   end

   if MOAIInputMgr.device.keyboard then
      MOAIInputMgr.device.keyboard:setCallback ( 
	 function ( key, down )

	    if down == true and key == 101 then
	       self.movingRight = true
	    elseif down == false and key == 101 then
	       self.movingRight = false
	    end

	    if down == true and key == 97 then
	       self.movingLeft = true
	    elseif down == false and key == 97 then
	       self.movingLeft = false
	    end

	 end)
   end

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
      self.wall = Wall(0, 6)
      self.layer:insertProp( self.wall.props[1] )
      self.wall:holeAt(5)
      self.wall:holeAt(6)
   end

   if self.movingRight then
      self.player:moveRight()
   end
   if self.movingLeft then
      self.player:moveLeft()
   end

end

function MainGame:getSprites()
   return self.sprites
end