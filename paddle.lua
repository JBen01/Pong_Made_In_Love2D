
local paddles = {}

paddles.load = function(arg)
	paddles.red = love.graphics.newImage('Sprites/redpaddel.png')
	paddles.blue = love.graphics.newImage('Sprites/bluepaddel.png')
	
	bluePaddle = {x = 20, y = 250, spriteimg = paddle.blue, movementSpeed = 10} 
	table.insert(paddles, bluePaddle)
	
	redPaddle = {x = 760, y = 250, spriteimg = paddle.red, movementSpeed = 11} 
	table.insert(paddles, redPaddle)
	
end

paddles.control = function(dt)
	if love.keyboard.isDown('up','w') then
		if bluePaddle.y > 0 then
			bluePaddle.y = bluePaddle.y - 10
		end
	end
	if love.keyboard.isDown('down','s') then
		if bluePaddle.y < 472 then
			bluePaddle.y = bluePaddle.y + 10
		end
	end
	
end

paddles.enemyAI = function(dt)
	if redPaddle.y < ball.y - 50 then
		redPaddle.y = redPaddle.y + 6
	end
	if redPaddle.y > ball.y - 50 then
		redPaddle.y = redPaddle.y - 6
	end
end

paddles.draw = function(dt)
	for i, newPaddle in ipairs(paddle) do
		love.graphics.draw(newPaddle.spriteimg, newPaddle.x, newPaddle.y)
	end
end

return paddles