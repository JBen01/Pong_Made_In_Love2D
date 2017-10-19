
paddle = require("paddle")

ball = {x = 400, y = 300, spriteimg = nil, direction = 0, side = "left", speed = 3, 
	upSpeed = 1, blueCounter = 0, redCounter = 0;

	move = function(dt)
		if ball.direction == 0 then
			--ball.x = ball.x - 4
			ball.y = ball.y - ball.upSpeed
		end
		if ball.direction == 1 then
			--ball.x = ball.x + 4
			ball.y = ball.y + ball.upSpeed
		end
		if ball.side == "left" then
			ball.x = ball.x - ball.speed
		end
		if ball.side == "right" then
			ball.x = ball.x + ball.speed
		end
	end,
	
	collision = function(dt)
		if ball.y < 0 then 
			ball.direction = 1 
		end
		if ball.y > 590 then 
			ball.direction = 0 
		end
		if (ball.x < bluePaddle.x + 20) and ((ball.y > bluePaddle.y - 10) and (ball.y < bluePaddle.y + 130)) then
			ball.side = "right"
			ball.direction = love.math.random(0,1)
			ball.upSpeed = love.math.random(1,8)
			if ball.speed <= 13 then
				ball.speed = ball.speed + 1
			end
		end
		if (ball.x > redPaddle.x - 20) and ((ball.y > redPaddle.y - 10) and (ball.y < redPaddle.y + 130)) then
			ball.side = "left"
			ball.direction = love.math.random(0,1)
			ball.upSpeed = love.math.random(1,8)
			if ball.speed <= 13 then
				ball.speed = ball.speed + 1
			end
		end
	end,
	
	respawn = function(dt)
		if ball.x < - 20 then	
			ball.redCounter = ball.redCounter + 1			
			ball.x = 400 
			ball.y = 300
			ball.speed = 3
			ball.upSpeed = 1
			ball.side = "right"
		end
		if ball.x > 780 then
			ball.blueCounter = ball.blueCounter + 1		
			ball.x = 400 
			ball.y = 300
			ball.speed = 3
			ball.upSpeed = 1
			ball.side = "left"
		end
	end
	
}

return ball