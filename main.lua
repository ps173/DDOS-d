Drawables = require"components/drawables"
utils = require"utils/general"

-- TODO: Completing the level and shifting to something new

function love.load()
 -- demo Level
 BgImg = love.graphics.newImage("/assets/bg.png")
 LevelsData = require"levels"
 CurrentLevel = 1
 Level = LevelsData[CurrentLevel]
 Mouse = {
  x = 0,
  y = 0,
 }
 IsInside = false
 SSA = {} -- What is this SystemStateAss ? huh

 function LevelCompletehandler()
  CurrentLevel = CurrentLevel + 1
  Level = LevelsData[CurrentLevel]
 end

end

function love.update()

 -- Change the state of Level
 if love.keyboard.isDown("q") then
  love.event.quit(1)
 end

 if CurrentLevel <= #LevelsData then
  if Level.aimachines.state == false then
   Level.IsCompleted = true
  end
 end

end

function love.draw()

 love.graphics.setColor(1,1,1,0.4)
 love.graphics.draw(BgImg)

 if CurrentLevel > #LevelsData then
  Drawables.splashscreen("You Did It!")
 end

 if CurrentLevel <= #LevelsData then
  -- Drawing the wires
   Drawables.wire(Level.gates.x+16,
                  Level.gates.y+16,
                  Level.aimachines.x+16,
                  Level.aimachines.y+16)

   if Level.IsCompleted == false then
     for _, row in ipairs(Level.signator) do
      Drawables.wire(row.x+16,row.y+16,Level.gates.x+16,Level.gates.y+16)
      Drawables.signator.draw(row.state,row.x,row.y)
     end
     Drawables.gates.draw(Level.aimachines.gatebt,Level.gates.x,Level.gates.y)
     Drawables.aimachines.draw(
        Level.aimachines.state,
        Level.aimachines.name,
        Level.aimachines.x,
        Level.aimachines.y
        )
    end
    if Level.IsCompleted == true then
      LevelCompletehandler()
    end
 end
 -- temp debugger
 -- utils.drawVisualDebugger(Level,Mouse)

end

function love.mousepressed(x,y,button)
 IsInside = false
 if button ==1 and CurrentLevel <= #LevelsData then
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

  for _,t in ipairs(Level.signator) do
   if #SSA == #(Level.signator) then
    SSA = {}
   end
   table.insert(SSA,t.state)
  end

  for pos in ipairs(SSA) do
   if pos == 1 then
    if  Level.aimachines.gatebt == "and" then
     Level.aimachines.state = utils.AND(SSA[pos],SSA[pos+1])
    end
    if  Level.aimachines.gatebt == "or" then
     Level.aimachines.state = utils.OR(SSA[pos],SSA[pos+1])
    end
    if  Level.aimachines.gatebt == "nand" then
     Level.aimachines.state = utils.NAND(SSA[pos],SSA[pos+1])
    end
    if  Level.aimachines.gatebt == "nor" then
     Level.aimachines.state = utils.NOR(SSA[pos],SSA[pos+1])
    end
   end
  end
 end



end
