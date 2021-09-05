Drawables = require"components/drawables"
utils = require"utils/general"

function love.load()
 -- Particles
 local img = love.graphics.newImage("/assets/particle.png")
 Psys = love.graphics.newParticleSystem(img, 100)
 Psys:setParticleLifetime(0,1)
 Psys:setLinearAcceleration(-40, -40, 20, 20)
 Psys:setRadialAcceleration(10,100)
 -- Font
 Font = love.graphics.setNewFont(14)
 -- Levels and level handler
 BgImg = love.graphics.newImage("/assets/bg.png")
 Rules = true
 Timer = 0
 GameCompleted = false
 EndingScreen = require"gameending"
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

 -- Particle emission
 Psys:update(dt)
 Psys:emit(32)

 -- Puzzles don't have lot to update
 TransitionCounter = TransitionCounter + 1 * dt
 if GameCompleted == true then
  Timer = Timer + 0
 end

 if GameCompleted == false then
  if love.keyboard.isDown("q") then
   love.event.quit(1)
  end

  if CurrentLevel <= #LevelsData then
   if Level.aimachines.state == false then
    Level.IsCompleted = true
   end
  end

  Timer = Timer + 1 * dt

 end

end

function love.draw()
 love.graphics.setFont(Font)

 love.graphics.setColor(1,1,1,0.4)
 love.graphics.draw(BgImg)

 if CurrentLevel > #LevelsData then
  Drawables.bigtext(EndingScreen.ending_text,150,250)
  Drawables.infotext(string.format("You Completed the game in %0.2f s",Timer))
  GameCompleted=true
 end

 if CurrentLevel <= #LevelsData then
  love.graphics.draw(Psys,love.mouse.getX(), love.mouse.getY())
  if Level.Complexity == "easy" then
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
        Level.aimachines.name, Level.aimachines.x,
        Level.aimachines.y
        )
   end
   if Level.IsCompleted == true then
     Drawables.transitionScreen(BgImg,"Great You did it! Loading Next Level",400,40)
     if TransitionCounter > 3 then
      LevelCompletehandler()
     end
   end

  end

  -- for complex levels
  if Level.Complexity == "complex" then
   -- wire between the connecting gates
   Drawables.wire( Level.connectingGate.x+16,
                   Level.connectingGate.y+16,
                   Level.aimachines.x+16,
                   Level.aimachines.y+16)

   if Level.IsCompleted == false then
     for _, gate in ipairs(Level.gates) do
      for _, row in ipairs(Level.signator) do
       if row.gatebt == gate.name then
        Drawables.wire(gate.x+16,gate.y+16,row.x+16,row.y+16)
       end
        Drawables.signator.draw(row.state,row.x,row.y)
      end
      Drawables.wire(gate.x+16,gate.y+16,Level.connectingGate.x+16,Level.connectingGate.y+16)
      Drawables.gates.draw(gate.name,gate.x,gate.y)
      Drawables.gates.draw(Level.connectingGate.name,
                          Level.connectingGate.x,
                          Level.connectingGate.y)
     end
     Drawables.aimachines.draw(
        Level.aimachines.state,
        Level.aimachines.name, Level.aimachines.x,
        Level.aimachines.y
        )
   end
   if Level.IsCompleted == true then
     Drawables.transitionScreen(BgImg,"Great You did it! Loading Next Level",400,40)
     if TransitionCounter > 3 then
      LevelCompletehandler()
     end
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
 -- if right button is clicked
 if button ==1 and CurrentLevel <= #LevelsData then

  -- changing the level state
   for _,table in ipairs(Level.signator) do
    -- calculating distances to make clickable wth?
    local xdist = utils.distanceBetween(table.x,x,table.y,y)
    local ydist = utils.distanceBetween(table.x,x,table.y,y)
    if (xdist >= 7 and ydist < 36) then
     table.state = not table.state
     IsInside = true
    end
   end

 -- Storing the mouse coordinates
  Mouse.x = x
  Mouse.y = y

  -- appending data to changing state array/table
  if Level.Complexity=="easy" then
   for _,t in ipairs(Level.signator) do
    if #SSA == #(Level.signator) then
     SSA = {}
    end
    table.insert(SSA,t.state)
   end

   -- Going through the data to determine the enemy's state
   for pos in ipairs(SSA) do
    if pos == 1 then
     if  Level.aimachines.gatebt == "and" then
      Level.aimachines.state = utils.AND(SSA[pos],SSA[pos+1])
     end
     if  Level.aimachines.gatebt == "or" then
      Level.aimachines.state = utils.OR(SSA[pos],SSA[pos+1])
     end
    end
   end


  end

  -- For complex levels
  if Level.Complexity == "complex" then
   SSA = {}
   -- Push the state into a table
   local given_signal = {}
   for _,t in ipairs(Level.signator) do
    if #SSA >= #(Level.signator) then
     SSA = {}
    end
    table.insert(SSA,{gatebt = t.gatebt, state=t.state})
   end

   for pos,t in ipairs(SSA) do
    if pos == 1 then
     if t.gatebt == "and" then
      table.insert(given_signal,utils.AND(t.state,SSA[pos+1].state))
     end
     if t.gatebt == "or" then
      table.insert(given_signal,utils.OR(t.state,SSA[pos+1].state))
     end
    end

    if pos == 3 then
     if t.gatebt == "and" then
      table.insert(given_signal,utils.AND(t.state,SSA[pos+1].state))
     end
     if t.gatebt == "or" then
      table.insert(given_signal,utils.OR(t.state,SSA[pos+1].state))
     end
    end

   end

   for pos in ipairs(given_signal) do
    if pos==1 then
     if Level.connectingGate.name == "and" then
      Level.aimachines.state = utils.AND(given_signal[pos],given_signal[pos+1])
     end
     if Level.connectingGate.name == "or" then
      Level.aimachines.state = utils.OR(given_signal[pos],given_signal[pos+1])
     end
    end
   end

  end

 end

end
