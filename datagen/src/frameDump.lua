function dumpFrame()
    frameNum = emu:currentFrame()

    --if frameNum % 1000 == 0 then
    emu:screenshot("C:\\Users\\asill\\OneDrive\\Documents\\repos\\wardotio\\resources\\dumps\\"..frameNum..".png")
    --end
end

function testPrint()
    console:log("Current frame " .. emu:currentFrame() .. "\n")
end

function dumpGameInfo()
    gameCode = emu:getGameCode()
    gameTitle = emu:getGameTitle()

    console:log("Game name: " .. gameTitle)
    console:log("Game code: " .. gameCode)
end



callbacks:add("start", dumpGameInfo)
callbacks:add("frame", testPrint)
callbacks:add("frame", dumpFrame)