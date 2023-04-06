local gameDetector  = require('utils.detectGame')
local vram          = require('utils.vram')
local fileWriter    = require('utils.writeFile')
local paths         = require('constants.paths')
local imageFile     = '\\image.png'
local textFile      = '\\game.txt'
local imagePath     = paths.demoDir .. imageFile
local textPath      = paths.demoDir .. textFile
local frameInterval = 5


local function printGameInfo()
    console:log(emu:getGameCode())
end

local function writeFrame()
    local currFrame = emu:currentFrame()
    if currFrame % frameInterval == 0 then
        console:log('Writing frame\n')
        console:log(imagePath)
        emu:screenshot(imagePath)
    end
end

DetectThisFrame = false
ActiveGame = 'None'
ObjVRAMStart = 'NONE'

local function detectCurrentGame()
    if DetectThisFrame then
        local currentGame = gameDetector.detectGame()
        if currentGame ~= "None" then
            DetectThisFrame = false
            FramesThisGame = 1
        end
        ActiveGame = currentGame
    else
        local newObjVRAM = vram.hasOBJVRAMChanged(ObjVRAMStart)
        if newObjVRAM ~= nil then
            console:log("CHANGED")
            ObjVRAMStart = newObjVRAM
            DetectThisFrame = true
        end
    end
end

local function writeCurrentGame()
    local currFrame = emu:currentFrame()
    if currFrame % frameInterval == 0 then
        console:log("Current game: " .. ActiveGame)
        fileWriter.writeToTextFile(textPath, ActiveGame)
    end
end

callbacks:add('startup', printGameInfo)
callbacks:add('frame', writeFrame)
callbacks:add('frame', detectCurrentGame)
callbacks:add('frame', writeCurrentGame)
