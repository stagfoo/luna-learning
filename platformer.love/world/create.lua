local meterScale = 64
gravity = 9.81 -- earth?
love.physics.setMeter(meterScale)
-- x gravity | y gravity
World = love.physics.newWorld(0, gravity*meterScale, true);
ObjectRegistry = {}

function addObject(name, x,y,w,h, bodyType, bounce)
ObjectRegistry[name] = {}
-- Creating box
ObjectRegistry[name].x = x
ObjectRegistry[name].y = y
ObjectRegistry[name].w = w
ObjectRegistry[name].h = h
-- dynamic can move, static can't move
-- body is object for registery
ObjectRegistry[name].body = love.physics.newBody(
  World,
  ObjectRegistry[name].x,
  ObjectRegistry[name].y,
  bodyType
)
-- shape is collusion
ObjectRegistry[name].shape = love.physics.newRectangleShape(
  ObjectRegistry[name].x,
  ObjectRegistry[name].y,
  ObjectRegistry[name].w,
  ObjectRegistry[name].h,
  0)
-- phyical props, 1 is density
ObjectRegistry[name].fixture = love.physics.newFixture(
  ObjectRegistry[name].body,
  ObjectRegistry[name].shape, 1 )
-- elasiticy
ObjectRegistry[name].fixture:setRestitution(bounce)
return ObjectRegistry[name]
end
