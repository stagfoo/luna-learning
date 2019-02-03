
function playerControls(playerObj, player, dt)
  local facingRight = 1
  local facingLeft = -1

local prevX, prevY = player.x, player.y
-- Apply Friction
player.xVelocity = player.xVelocity * (1 - math.min(dt * player.friction, 1))
player.yVelocity = player.yVelocity * (1 - math.min(dt * player.friction, 1))

-- Apply gravity
player.yVelocity = player.yVelocity + player.gravity * dt

if love.keyboard.isDown("left", "a") and player.xVelocity > -player.maxSpeed then
  player.direction = facingLeft

  player.xVelocity = player.xVelocity - player.acc * dt
elseif love.keyboard.isDown("right", "d") and player.xVelocity < player.maxSpeed then
  player.direction = facingRight
  player.xVelocity = player.xVelocity + player.acc * dt
end

-- The Jump code gets a lttle bit crazy.  Bare with me.
if love.keyboard.isDown("up", "w", "space") then
  if -player.yVelocity < player.jumpMaxSpeed and not player.hasReachedMax then
    player.yVelocity = player.yVelocity - player.jumpAcc * dt
  elseif math.abs(player.yVelocity) > player.jumpMaxSpeed then
    player.hasReachedMax = true
  end

  player.isGrounded = false -- we are no longer in contact with the ground
end

-- these store the location the player will arrive at should
local goalX = player.x + player.xVelocity
local goalY = player.y + player.yVelocity

-- This "filters" out certain types of collisions so we only process what we care about.
player.filter = function(item, other)
  local x, y, w, h = world:getRect(other)
  local px, py, pw, ph = world:getRect(item)
  local playerBottom = py + ph
  local otherBottom = y + h

  if playerBottom <= y then -- bottom of player collides with top of platform.
    return 'slide'
  end
end

-- Move the player while testing for collisions
player.x, player.y, collisions, len = world:move(player, goalX, goalY, player.filter)

-- Loop through those collisions to see if anything important is happening
for i, coll in ipairs(collisions) do
  if coll.touch.y > goalY then  -- We touched below (remember that higher locations have lower y values) our intended target.
    player.hasReachedMax = true -- this scenario does not occur in this demo
    player.isGrounded = false
  elseif coll.normal.y < 0 then
    player.hasReachedMax = false
    player.isGrounded = true
  end
end
end
