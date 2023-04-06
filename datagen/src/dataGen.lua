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

CanDump = false


local function gameCheckLoop()
    if ActiveGame ~= "None" then
        CanDump = frameDumper.dumpCheck()
        if CanDump then
            frameDumper.dumpFrame(Category, ActiveGame)
        end
    end

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


callbacks:add("frame", gameCheckLoop)
callbacks:add("start", buildFilePathsAtStartup)
