local paths = require('constants.paths')
local currDate = os.date("%Y%m%d-%H%M%S")
local oam = require('tables.oam.oamOBJ')
local junk = require('tables.oam.junkOamTiles')


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

---Check if the current OAM Object has a tile considered "junk"
---@param oamObj OAMObj
---@return boolean
local function objectHasJunk(oamObj)
    local hasJunk = junk.hasJunk(oamObj:getTileIndex())
    return hasJunk
end

---Check if
---@param canDump any
---@return any
local function dumpCheck(canDump)
    local oamSlot0 = oam:new(nil, 0)
    if oamSlot0.attribute0.color_mode == 1 then
        return canDump
    end
    return not objectHasJunk(oamSlot0)
end



local frameDumper = {
    dumpFrame = dumpFrame,
    dumpCheck = dumpCheck
}

return frameDumper
