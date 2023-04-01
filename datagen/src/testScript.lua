require "tables.oam.oamOBJ"
require "utils.oam"
require "utils.vram"
local gameTable = require("tables.gameText.intro.gameTable")

function gameCheckLoop()
    local oamArr = getOAMArray(10)
    local oamLen = getTileStringLength(oamArr)
    local strTiles = getVRAMSlots(oamLen)
    local gameTitle = gameTable[strTiles]
    if gameTitle == nil then
        gameTitle = "None"
    end
    console:log("Game detected: " .. gameTitle)
end

callbacks:add("frame", gameCheckLoop)
