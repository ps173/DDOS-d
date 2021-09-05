Drawables = require"components/drawables"
utils = require"utils/general"

function love.load()
 -- Levels and level handler
 BgImg = love.graphics.newImage("/assets/bg.png")
 Rules = true
 Tutorial = require"tutorial"
 LevelsData = require"levels"
 CurrentLevel = 1
 Level = LevelsData[CurrentLevel]
 Mouse = {
  x = 0,
  y = 0,
 }
 TransitionCounter = 0
 IsInside = false
 SSA = {} -- What is this SystemStateAss ? huh

 function LevelCompletehandler()
  TransitionCounter = 0
  CurrentLevel = CurrentLevel + 1
  Level = LevelsData[CurrentLevel]
 end

end

function love.update(dt)

 TransitionCounter = TransitionCounter + 1 * dt

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
     Drawables.transitionScreen(BgImg,"Great You did it! Loading Next Level",500,40)
     if TransitionCounter > 3 then
      LevelCompletehandler()
     end
    end


 end

 if Rules == true then
  TransitionCounter=0
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(BgImg)
  Drawables.gates.draw("and",Tutorial.and_gate.x,Tutorial.and_gate.y-50)
  Drawables.gates.draw("or",Tutorial.or_gate.x,Tutorial.or_gate.y-50)
  Drawables.aimachines.draw(true,"executive",Tutorial.aimachines.x,Tutorial.aimachines.y-50)
  Drawables.signator.draw(true,Tutorial.signator.x,Tutorial.signator.y-50)
  Drawables.infotext(Tutorial.story_text, 100,100)
  Drawables.infotext(Tutorial.or_gate.text, Tutorial.or_gate.x-50, Tutorial.or_gate.y)
  Drawables.infotext(Tutorial.and_gate.text, Tutorial.and_gate.x-50, Tutorial.and_gate.y)
  Drawables.infotext(Tutorial.signator.text, Tutorial.signator.x-50, Tutorial.signator.y)
  Drawables.infotext(Tutorial.aimachines.text, Tutorial.aimachines.x-50, Tutorial.aimachines.y)
  Drawables.infotext("Press t toggle this menu", 600 , 600)
 end

 -- temp debugger
 -- utils.drawVisualDebugger(Level,Mouse)
end

function love.keypressed(key)
 if key == "t" then
  Rules = not Rules
 end
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
