currDate = os.date("%Y%m%d-%H%M%S")
outputDir = "C:\\Users\\asill\\OneDrive\\Documents\\repos\\wardotio\\resources\\dumps\\"

function dumpFrame()
    frameNum = emu:currentFrame()
    fileName = currDate .. "_" .. frameNum .. ".png"
    outputPath = outputDir .. fileName
    console:log(outputPath)
    emu:screenshot(outputPath)
end

function testPrint()
    console:log("Current frame " .. emu:currentFrame() .. "\n")
    console:log("Current date: " .. currDate)
end

function dumpGameInfo()
    gameCode = emu:getGameCode()
    gameTitle = emu:getGameTitle()

    console:log("Game name: " .. gameTitle)
    console:log("Game code: " .. gameCode)
end

function bufferTest()
    buffer:clear()
    buffer:print("Test")
end

callbacks:add("start", dumpGameInfo)
callbacks:add("frame", testPrint)
callbacks:add("frame", bufferTest)
callbacks:add("frame", dumpFrame)
