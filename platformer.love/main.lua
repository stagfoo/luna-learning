love.window.setMode(650, 1050) --set the window dimensions to 650 by
bump = require 'lib/bump'
require 'lib/debug'
require 'lib/color'
require "lib/paddy"
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
  paddy.update(dt)
  playerControls(player,player, dt)
  updateAnimation(animation, dt)
end

function love.draw()
  paddy.draw()
  love.graphics.origin()
  local r,g,b = genColor(255,254,223)
  love.graphics.setBackgroundColor(r,g,b)

  drawPlatforms()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(
    love.graphics.newImage('assets/key.png'),
    100,
    150,
    0,
    1,
    1,
    16,
    16)
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
