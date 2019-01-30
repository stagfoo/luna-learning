
function newPlayer()
player.x = 33
player.w = 33
player.h = 48
player.y = 50

player.direction = 1 -- x scale
     -- This calls the file named "player.png" and puts it in the variable called player.img.
player.idle = love.graphics.newImage('assets/player-idle-66-48.png')
-- player.walk = love.graphics.newImage('assets/player-walk.png')
player.speed = 200
player.ground = player.y     -- This makes the character land on the plaform.
player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.
player.jump_height = -250   -- Whenever the character jumps, he can reach this height.
player.gravity = -100        -- Whenever the character falls, he will descend at this rate.
end
