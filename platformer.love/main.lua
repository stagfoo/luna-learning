love.window.setMode(650, 650) --set the window dimensions to 650 by

bump = require 'lib/bump'
require 'lib/debug'
require "world/create"
require "actors/player/controls"
require "actors/player/player"
require "logic/animation"
player = {
  xVelocity = 0, -- current velocity on x, y axes
  yVelocity = 0,
  acc = 100, -- the acceleration of our player
  maxSpeed = 600, -- the top speed
  friction = 20, -- slow our player down - we could toggle this situationally to create icy or slick platforms
  gravity = 80, -- we will accelerate towards the bottom

  -- These are values applying specifically to jumping
  isJumping = false, -- are we in the process of jumping?
  isGrounded = false, -- are we on the ground?
  hasReachedMax = false,  -- is this as high as we can go?
  jumpAcc = 400, -- how fast do we accelerate towards the top
  jumpMaxSpeed = 20, -- our speed limit while jumping
}
stage= {}
function love.load()
  createPlatforms()
  newPlayer()
  world:add(player, player.x,player.y,player.w, player.h)
  animation = newAnimation(player.idle,player.w,player.h,1)
end

function love.update(dt)
  -- World:update(dt)
  playerControls(player,player, dt)
  updateAnimation(animation, dt)
end

function love.draw()
  love.graphics.origin()
  love.graphics.setBackgroundColor(0.32,0.32,0.52)

  drawPlatforms()
  love.graphics.setColor(1,1,1)

  love.graphics.draw(
    animation.spriteSheet,
    spriteQuad(animation),
    player.x,
    player.y,
    0,
    player.direction,
    1,
    player.w/2,
    player.h)
end
