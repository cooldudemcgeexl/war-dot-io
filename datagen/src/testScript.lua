local oam = require("utils.oam")
local vram = require("utils.vram")
local gameTable = require("tables.gameText.intro.gameTable")

function gameCheckLoop()
    local oamArr = oam.getOAMArray(10)
    local oamLen = oam.getTileStringLength(oamArr)
    local strTiles = vram.getVRAMSlots(oamLen)
    local gameTitle = gameTable[strTiles]
    if gameTitle == nil then
        gameTitle = "None"
    end
    console:log("Game detected: " .. gameTitle)
    return gameTitle
end

callbacks:add("frame", gameCheckLoop)
