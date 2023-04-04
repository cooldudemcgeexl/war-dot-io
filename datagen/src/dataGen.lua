local gameDetector = require("utils.detectGame")
local vram = require("utils.vram")
local frameDumper = require("utils.frameDumper")
local pathBuilder = require("utils.pathBuilder")

ObjVRAMStart = 'NONE'
-- HOLY F RICK FIGURED THIS OUT
DetectThisFrame = false
ActiveGame = "None"
Category = "Intro"

local function buildFilePathsAtStartup()
    pathBuilder.makeGameDirs()
end

local function gameCheckLoop()
    if ActiveGame ~= "None" then
        frameDumper.dumpFrame(Category, ActiveGame)
    end

    if DetectThisFrame then
        local currentGame = gameDetector.detectGame()
        if currentGame ~= "None" then
            DetectThisFrame = false
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


callbacks:add("frame", gameCheckLoop)
callbacks:add("start", buildFilePathsAtStartup)
