function playerControls(player, worldObject, dt)
  local facingRight = 1
  local facingLeft = -1

  if love.keyboard.isDown('right') then
    player.direction = facingRight
		-- This makes sure that the character doesn't go pass the game window's right edge.
		if player.x < (love.graphics.getWidth() - player.w) then
      player.x = player.x + (player.speed * dt)
    end
	elseif love.keyboard.isDown('left') then
		-- This makes sure that the character doesn't go pass the game window's left edge.
    player.direction = facingLeft
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

-- if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
--   objects.ball.body:applyForce(400, 0)
-- elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
--   objects.ball.body:applyForce(-400, 0)
-- elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
--   objects.ball.body:setPosition(650/2, 650/2)
--   objects.ball.body:setLinearVelocity(0, 0) --we must set the velocity to zero to prevent a potentially large velocity generated by the change in position
-- end