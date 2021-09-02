local M = {}

-- @parameters x2,x1,y2,y1 : int
function M.distanceBetween(x2,x1,y2,y1)
 return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

function M.drawVisualDebugger(state,mouse)
love.graphics.print(mouse.x,100,10)
love.graphics.print(mouse.y,300,10)

if IsInside == true then
 love.graphics.print("mouse Is Inside",400,10)
end

for _, row in ipairs(state.signator) do
 love.graphics.setColor(1,1,1,1)
 love.graphics.print(string.format("%d",utils.distanceBetween(row.x,mouse.x,row.y,mouse.y))
                     ,row.x,row.y+100)

 if row.state == true then
  love.graphics.print("true",row.x,row.y)
  love.graphics.print(string.format(">> %d %d <<",row.x,row.y),row.x+20,row.y)
 end
 if row.state == false then
  love.graphics.print("false",row.x,row.y)
  love.graphics.print(string.format(">> %d %d <<",row.x,row.y),row.x+40,row.y)
 end
end

end

return M
