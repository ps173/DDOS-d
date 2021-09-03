--[[
 Logic Gates for the game

 @params sig1, sig2 == boolean
 @returns boolean
--]]
local LOGIC_GATES = {}

function LOGIC_GATES.AND(sig1,sig2)
 return sig1 and sig2
end

function LOGIC_GATES.NAND(sig1,sig2)
 return not(sig1 and sig2)
end

function LOGIC_GATES.OR(sig1,sig2)
 return (sig1 or sig2)
end

function LOGIC_GATES.NOR(sig1,sig2)
 return not(sig1 or sig2)
end

return LOGIC_GATES
