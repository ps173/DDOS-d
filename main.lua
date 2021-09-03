Drawables = require"components/drawables"
LOGIC_GATES = require"utils/logic-gates"
utils = require"utils/general"

function love.load()
 -- demo Level
 Level = require"levels"
 Mouse = {
  x = 0,
  y = 0,
 }
 IsInside = false
 SSA = {} -- What is this SystemStateAss ? huh

end

function love.update()
 -- Change the state of Level
 if love.keyboard.isDown("q") then
  love.event.quit(1)
 end
end

function love.draw()

 for _, row in ipairs(Level.signator) do
  Drawables.signator.draw(row.state,row.x,row.y)
 end
 Drawables.gates.draw(Level.gates.name,Level.gates.x,Level.gates.y)
 Drawables.aimachines.draw(
    Level.aimachines.state,
    Level.aimachines.name,
    Level.aimachines.x,
    Level.aimachines.y
    )


 -- temp debugger
 -- utils.drawVisualDebugger(Level,Mouse)

end

function love.mousepressed(x,y,button)
 IsInside = false
 if button ==1 then
  for _,table in ipairs(Level.signator) do
   if (utils.distanceBetween(table.x,x,table.y,y) >= 7
    and
    utils.distanceBetween(table.x,x,table.y,y) < 36)
    then
    table.state = not table.state
    IsInside = true
   end

  end
  Mouse.x = x
  Mouse.y = y
 end


 for _,t in ipairs(Level.signator) do
  if #SSA == 2 then
   SSA = {}
  end
  table.insert(SSA,t.state)
 end

 for pos in ipairs(SSA) do
  if pos == 1 then
   Level.aimachines.state = LOGIC_GATES.AND(SSA[pos],SSA[pos+1])
  end
 end


end
