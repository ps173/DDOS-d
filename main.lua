Drawables = require"components/drawables"
LOGIC_GATES = require"utils/logic-gates"

function love.load()
 -- demo Level
 Level = require"levels"
 Mousex = 0
 Mousey = 0
end

function love.update(dt)
 -- Change the state of Level
end

function love.draw()
 Drawables.aimachines.draw(
    Level.aimachines.name,
    Level.aimachines.x,
    Level.aimachines.y)
 Drawables.gates.draw(Level.gates.name,Level.gates.x,Level.gates.y)
 for _, row in ipairs(Level.signator) do
  Drawables.signator.draw(row.state,row.x,row.y)
 end


 -- temp debug solutions
love.graphics.print(Mousex,100,10)
love.graphics.print(Mousey,300,10)

end

function love.Mousepressed(x,y,button)
 if button ==1 then
  for _,table in ipairs(Level.signator) do
   if table.x == x or table.x +25 >= x and table.y == y or table.y +25 >= y then
    table.state = not table.state
   end
  end
  Mousex = x
  Mousey = y
 end
end
