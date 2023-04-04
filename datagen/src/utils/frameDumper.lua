local paths = require('constants.paths')
local currDate = os.date("%Y%m%d-%H%M%S")



---Builds an output path for screenshotting the game
---@param category string
---@param currentGame string
---@return string
local function buildOutputPath(category, currentGame)
    local frameNum = emu:currentFrame()
    local fileName = currDate .. "_" .. frameNum .. ".png"
    local outputDir = paths.screenshotDir .. "\\" .. category .. "\\" .. currentGame
    local outputPath = outputDir .. "\\" .. fileName
    console:log(outputPath)
    return outputPath
end

---Dump the current frame with the current game name annotated
---@param category string
---@param currentGame string
local function dumpFrame(category, currentGame)
    local outputPath = buildOutputPath(category, currentGame)
    emu:screenshot(outputPath)
end



local frameDumper = {
    dumpFrame = dumpFrame,
}

return frameDumper
