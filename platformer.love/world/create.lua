world = bump.newWorld(50)
playerBox = {name="platform"}


function drawPlatform(box, r,g,b)
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
end

local function addBlock(x,y,w,h)
  local block = {x=x,y=y,w=w,h=h}
  stage[#stage+1] = block
  world:add(block, x,y,w,h)
end

function createPlatforms()
    addBlock(0, 600,650, 50)
    addBlock(0, 300, 250, 50)
end

function drawPlatforms()
  for _,block in ipairs(stage) do
    drawPlatform(block, 255,0,0)
  end
end
