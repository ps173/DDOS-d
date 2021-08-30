--[[
Drawing Logic Gates
--]]

local objects = {}

objects.gates = {}

-- @params gate : string, name of the gate
function objects.gates.draw(gate) 
 if gate=="and" then
  -- Here in polygon parameters are mode 
  -- And then u can provide verticies :
  -- as x1,y1, x2,y2, x3,y3
   love.graphics.polygon("fill", 100,100, 200,100, 150,200)
 elseif gate=="or" then
   love.graphics.polygon("fill", 100,100, 200,100, 400,100, 150,200)
 else
   love.graphics.rect("fill", 100,100, 100 ,100)
 end
end

return objects
