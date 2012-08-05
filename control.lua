require 'class'

Control = class()

function Control:init(layer)
   self.layer = layer
   self.movingRight = false
   self.movingLeft = false

   if MOAIInputMgr.device.touch then
      self:iPhoneControl()
   end

   if MOAIInputMgr.device.keyboard then
      self:keyboardControl()
   end
end

function Control:iPhoneControl()
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

function Control:keyboardControl()
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
