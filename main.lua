drawables = require"components/drawables"
LOGIC_GATES = require"utils/logic-gates"

function love.load()
 -- demo level
 level = require"levels"
end

function love.update(dt)
end

function love.draw()
 drawables.aimachines.draw(
    level.aimachines.name,
    level.aimachines.x,
    level.aimachines.y)
 drawables.gates.draw(level.gates.name,level.gates.x,level.gates.y)
 for y, row in ipairs(level.signator) do
  drawables.signator.draw(row.state,row.x,row.y)
 end
end
