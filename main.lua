--main file for pong

paddle = require("paddle")
ball = require("ball")

function love.load(arg)
	paddle.load(arg)
	blueCounter = 0
	redCounter = 0
	love.graphics.setNewFont(30)
	ball.spriteimg = love.graphics.newImage('Sprites/ball.png')
	line = love.graphics.newImage('Sprites/line.png')
	runGame = true
	maxScore = 10
end

function love.update(dt)
	if runGame then
		-- Ball
		ball.move(dt)
		ball.respawn(dt)
		ball.collision(dt)
		blueCounter = ball.blueCounter
		redCounter = ball.redCounter
		--Paddle
		paddle.control(dt)
		paddle.enemyAI(dt)
	end
	if (blueCounter >= maxScore) or (redCounter >= maxScore) then
		runGame = false
	end
end

function love.draw(dt)
	paddle.draw(dt)
	love.graphics.draw(line, 390, -20)
	love.graphics.print("Blue: ", 150, 20)
	love.graphics.print(blueCounter, 235, 20)
	love.graphics.print("Red: ", 550, 20)
	love.graphics.print(redCounter, 618, 20)
	if runGame then
		love.graphics.draw(ball.spriteimg, ball.x, ball.y)
	end
	if blueCounter >= maxScore then
		love.graphics.print("Blue Wins!", 125, 280)
	end
	if redCounter >= maxScore then
		love.graphics.print("Red Wins!", 525, 280)
	end
end