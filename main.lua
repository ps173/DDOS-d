Drawables = require"components/drawables"
LOGIC_GATES = require"utils/logic-gates"

function love.load()
 -- demo level
 level = require"levels"
 mousex = 0
 mousey = 0
end

function love.update(dt)
 -- Change the state of level 
end

function love.draw()
 Drawables.aimachines.draw(
    level.aimachines.name,
    level.aimachines.x,
    level.aimachines.y)
 Drawables.gates.draw(level.gates.name,level.gates.x,level.gates.y)
 for y, row in ipairs(level.signator) do
  Drawables.signator.draw(row.state,row.x,row.y)
 end


 -- temp debug solutions
love.graphics.print(mousex,100,10)
love.graphics.print(mousey,300,10)

end

function love.mousepressed(x,y,button)
 if button ==1 then
  for y,table in ipairs(level.signator) do
   if table.x == x or table.x +25 >= x and table.y == y or table.y +25 >= y then 
    table.state = not table.state
   end
  end
  mousex = x
  mousey = y
 end
end
