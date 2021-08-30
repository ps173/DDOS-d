--[[
Drawing Logic Gates
--]]

local objects = {}

-- gates as drawables
objects.gates = {}
-- @params gate : name of the gate i.e, and ,or
function objects.gates.draw(gate,x,y) 
 local andimg = love.graphics.newImage("assets/and_gate.png")
 local orimg = love.graphics.newImage("assets/or_gate.png")

 if gate=="and" then
   love.graphics.setColor(1,0.68,0)
   love.graphics.draw(andimg,x,y)
 end

 if gate=="or" then
   love.graphics.setColor(0,1,0)
   love.graphics.draw(orimg,x,y)
 end
end

return objects
