function love.load()
  x = 0
  y = 0
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + 10
  end
  if love.keyboard.isDown("left") then
    x = x - 10
  end
  if love.keyboard.isDown("up") then
    y = y - 10
  end
  if love.keyboard.isDown("down") then
    y = y + 10
  end
end

function love.draw()
  --                     r g b
  love.graphics.setColor(0,0,255);
  love.graphics.rectangle("fill", x, y, 20, 20)
end
