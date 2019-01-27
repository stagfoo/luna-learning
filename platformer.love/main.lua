require "actors/player/controls"
require "actors/player/player"
require "logic/animation"
require "world/create"
local winH = love.graphics.getHeight()
local winW = love.graphics.getWidth()
local groundHeight = 50


player = {}
animation = {}
function love.load()
  newPlayer( winH - groundHeight)
  addObject("box", 40, 40, 32, 32,  "dynamic", 0)
  addObject("platform", 0, winH - groundHeight, winW, groundHeight,  "static", 0)
  addObject("player", player.x, groundHeight, player.w, player.h,  "dynamic", 0)
  animation = newAnimation(player.idle,player.w,player.h,1)
end

function love.update(dt)
  World:update(dt)
  playerControls(player, ObjectRegistry.player, dt)
  updateAnimation(animation, dt)
end

function love.draw()
  love.graphics.scale(1,1)
  love.graphics.setBackgroundColor(0.32,0.32,0.52)
  love.graphics.rectangle('fill', ObjectRegistry.box.body:getX(), ObjectRegistry.box.body:getY(), ObjectRegistry.box.w, ObjectRegistry.box.h)
  love.graphics.rectangle(
    'fill',
    ObjectRegistry.platform.body:getX(),
    ObjectRegistry.platform.body:getY(),
    ObjectRegistry.platform.w,
    ObjectRegistry.platform.h
  )
  --                                                                                   r  xS  yS  ?  height
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
