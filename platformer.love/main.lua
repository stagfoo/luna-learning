require "world/create"
require "actors/player/controls"
require "actors/player/player"
require "logic/animation"
local groundHeight = 50


player = {}
function love.load()
  newPlayer(600)
  addObject("ground",
    love.graphics.getHeight()/4, --why 1/4 of width
    600,
    650,
    50,
    "static",
    0)
    addObject("platform",
    70, --why 1/4 of width
    500,
    250,
    50,
    "static",
    0)
  addObject("player", player.x, love.graphics.getHeight() - 50, player.w, player.h,  "dynamic", 0)
  animation = newAnimation(player.idle,player.w,player.h,1)
  love.window.setMode(650, 650) --set the window dimensions to 650 by 650

end

function love.update(dt)
  World:update(dt)
  playerControls(player, ObjectRegistry.player, dt)
  updateAnimation(animation, dt)
end

function love.draw()
  love.graphics.origin()
  love.graphics.setBackgroundColor(0.32,0.32,0.52)
  love.graphics.rectangle(
    'fill',
    0,
    ObjectRegistry.ground.body:getY(),
    ObjectRegistry.ground.w,
    ObjectRegistry.ground.h
  )
  love.graphics.rectangle(
    'fill',
    0,
    400,
    ObjectRegistry.platform.w,
    ObjectRegistry.platform.h
  )

  --                                                                                   r  xS  yS  ?  height
  love.graphics.draw(
    animation.spriteSheet,
    spriteQuad(animation),
    ObjectRegistry.player.body:getX(),
    ObjectRegistry.player.body:getY(),
    0,
    player.direction,
    1,
    player.w/2,
    player.h)
end
