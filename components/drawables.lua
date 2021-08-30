--[[
Drawing Logic Gates
TODO : ADD PARTICLE ANIMATIONS TO THESE
--]]

local objects = {}

-- gate drawables
objects.gates = {}
-- @params gate(string) : name of the gate i.e, and/or
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

-- enemy drawables
objects.aimachines = {}
-- @params name(string) : name of the aimachines i.e, executive,admiral,president
function objects.aimachines.draw(name,x,y) 
 local execimg = love.graphics.newImage("assets/exec_ai.png")
 local admimg = love.graphics.newImage("assets/admir_ai.png")

 if name=="admiral" then
   love.graphics.draw(admimg,x,y)
 end

 if name=="executive" then
   love.graphics.draw(execimg,x,y)
 end
end

-- signator drawable
objects.signator = {}
-- @params state(boolean) : state of the signator signal
function objects.signator.draw(state,x,y)
 local sigimg = love.graphics.newImage("assets/signator.png")
 if state==true then 
  love.graphics.setColor(0,1,0)
  love.graphics.draw(sigimg,x,y)
 end

 if state==false then 
  love.graphics.setColor(1,0,0)
  love.graphics.draw(sigimg,x,y)
 end

end

return objects
