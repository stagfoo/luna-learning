love.window.setMode(650, 650) --set the window dimensions to 650 by
bump = require 'lib/bump'
require 'lib/debug'
require "world/create"
require "actors/player/player"
require "actors/player/controls"
require "logic/animation"

stage= {}
function love.load()
  createPlatforms()
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
  love.graphics.setBackgroundColor(0.251,0.180,0.158)

  drawPlatforms()
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
