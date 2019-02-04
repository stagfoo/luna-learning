player = {

     xVelocity = 0, -- current velocity on x, y axes
     yVelocity = 0,
     acc = 100, -- the acceleration of our player
     maxSpeed = 600, -- the top speed
     friction = 20, -- slow our player down - we could toggle this situationally to create icy or slick platforms
     gravity = 130, -- we will accelerate towards the bottom
     -- These are values applying specifically to jumping
     isJumping = false, -- are we in the process of jumping?
     isGrounded = false, -- are we on the ground?
     hasReachedMax = false,  -- is this as high as we can go?
     jumpAcc = 400, -- how fast do we accelerate towards the top
     jumpMaxSpeed = 20, -- our speed limit while jumping
     x = 0,
     y = 600,
     w = 33,
     h = 48,
     direction = 1, -- x scale
     idle = love.graphics.newImage('assets/player-idle-66-48.png'),
}
