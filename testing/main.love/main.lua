platform = {}
player = {}

function newPlayer()
     -- This is the coordinates where the player character will be rendered.
	player.x = love.graphics.getWidth() / 2   -- This sets the player at the middle of the screen based on the width of the game window.
	player.y = love.graphics.getHeight() / 2  -- This sets the player at the middle of the screen based on the height of the game window.
        -- This calls the file named "player.png" and puts it in the variable called player.img.
  player.img = love.graphics.newImage('sprites/player.png')
  player.speed = 200
	player.ground = player.y     -- This makes the character land on the plaform.
	player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.
	player.jump_height = -300    -- Whenever the character jumps, he can reach this height.
	player.gravity = -500        -- Whenever the character falls, he will descend at this rate.
end

function love.load()
        -- This is the height and the width of the platform.
	platform.width = love.graphics.getWidth()    -- This makes the platform as wide as the whole game window.
	platform.height = love.graphics.getHeight()  -- This makes the platform as tall as the whole game window.

        -- This is the coordinates where the platform will be rendered.
	platform.x = 0                               -- This starts drawing the platform at the left edge of the game window.
	platform.y = platform.height / 2           -- This starts drawing the platform at the very middle of the game window
  newPlayer()
end

function love.update(dt)
	if love.keyboard.isDown('d') then
		-- This makes sure that the character doesn't go pass the game window's right edge.
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		-- This makes sure that the character doesn't go pass the game window's left edge.
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
  end
  -- This is in charge of player jumping.
	if love.keyboard.isDown('space') then                     -- Whenever the player presses or holds down the Spacebar:
    -- The game checks if the player is on the ground. Remember that when the player is on the ground, Y-Axis Velocity = 0.
    if player.y_velocity == 0 then
      player.y_velocity = player.jump_height    -- The player's Y-Axis Velocity is set to it's Jump Height.
    end
  end
  -- This is in charge of the jump physics.
  if player.y_velocity ~= 0 then  -- The game checks if player has "jumped" and left the ground.
    player.y = player.y + player.y_velocity * dt                -- This makes the character ascend/jump.
    -- this gets the takes the gravity times the key frame away from the jump, causing them to fall
		player.y_velocity = player.y_velocity - player.gravity * dt
	end

        -- This is in charge of collision, making sure that the character lands on the ground.
        if player.y > player.ground then    -- The game checks if the player has jumped.
		player.y_velocity = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
    		player.y = player.ground    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
	end
end

function love.draw()
  -- This sets the platform color to white.
	love.graphics.setColor(1, 1, 1)
        -- The platform will now be drawn as a white rectangle while taking in the variables we declared above.
  love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
  love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end
