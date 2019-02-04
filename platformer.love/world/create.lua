world = bump.newWorld(50)

function drawPlatform(box)
  local r,g,b = genColor(248,202,139)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("fill", box.x, box.y - box.h, box.w, box.h)
end


local function addBlock(x,y,w,h)
  local block = {x=x,y=y,w=w,h=h}
  stage[#stage+1] = block
  world:add(block, x,y,w,h)
end

function createPlatforms()
    addBlock(0, 650,650, 50)
    addBlock(0, 500, 250, 50)
    addBlock(300, 400, 200, 50)
    addBlock(500, 300, 200, 50)
    addBlock(0, 200, 300, 50)
    addBlock(400, 250, 50, 50)
    world:add({x=150,y=100,w=16,h=16}, 150,100,16,16)
end
-- remove?
function drawPlatforms()
  -- check what this means
  for _,block in ipairs(stage) do
    drawPlatform(block)
  end
end
