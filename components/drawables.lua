--[[
Drawing Logic Gates
TODO : ADD PARTICLE ANIMATIONS TO THESE
--]]
HugeFont = love.graphics.setNewFont(18)

local objects = {}

-- gate drawables
objects.gates = {}
-- @params gate(string) : name of the gate i.e, and/or
function objects.gates.draw(gate,x,y)
 local andimg = love.graphics.newImage("assets/and_gate.png")
 local orimg = love.graphics.newImage("assets/or_gate.png")

 if gate=="and" then
   love.graphics.setColor(1,1,1,1)
   love.graphics.draw(andimg,x,y)
 end

 if gate=="or" then
   love.graphics.setColor(1,1,1,1)
   love.graphics.draw(orimg,x,y)
 end
end

-- enemy drawables
objects.aimachines = {}
-- @params name(string) : name of the aimachines i.e, executive,admiral,president
-- @params state(bool)  : wether machine is on or not
function objects.aimachines.draw(state,name,x,y)
 local execimg = love.graphics.newImage("assets/exec_ai.png")
 local admimg = love.graphics.newImage("assets/admir_ai.png")

 if state==false then
  love.graphics.setColor(1,0,0,1)
 end

 if state==true then
  love.graphics.setColor(1,1,1,1)
 end

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

function objects.infotext(text,x,y)
 love.graphics.setColor(252/255,3/255,202/255)
 love.graphics.print(text,x,y)
end

function objects.wire(x1,y1,x2,y2)
 love.graphics.setColor(66/255,245/255,227/255)
 love.graphics.line(x1,y1,x2,y2)
end

function objects.tutorialscreen()
 love.graphics.clear()
end

function objects.bigtext(text,x,y)
 love.graphics.setFont(HugeFont)
 love.graphics.setColor(3/255,252/255,186/255)
 love.graphics.print(text,x,y)
end

function objects.transitionScreen(background,text,x,y)
      love.graphics.setColor(1,1,1,1)
      love.graphics.draw(background)
      Drawables.bigtext(text,x,y)
end

return objects
