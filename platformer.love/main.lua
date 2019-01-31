love.window.setMode(650, 650) --set the window dimensions to 650 by

bump = require 'lib/bump'
require 'lib/debug'
require "world/create"
require "actors/player/controls"
require "actors/player/player"
require "logic/animation"
player = {}
stage= {}
function love.load()
  createPlatforms()
  newPlayer()
  playerBox = addPlayer(player.x, player.y, player.w, player.h)
  animation = newAnimation(player.idle,player.w,player.h,1)
end

function love.update(dt)
  -- World:update(dt)
  playerControls(player, playerBox, dt)
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
    playerBox.x,
    playerBox.y,
    0,
    player.direction,
    1,
    player.w/2,
    player.h)
end
