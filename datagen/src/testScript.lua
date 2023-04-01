--require "tables.oam.oamOBJ"
--require "utils.oam"
local StringTable = require("tables.gameText.intro.asciiString")

-- matchbytes = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x88, 0x0, 0x0, 0x88, 0xBB, 0x0, 0x80, 0xB8, 0xBB, 0x0, 0x88, 0xBB,
--              0x8B, 0x80, 0xB8, 0xBB, 0x88, 0x80, 0xBB, 0x8B, 0x8, 0x88, 0xBB, 0x88, 0x0}

-- matchstr = makeAsciiString(matchbytes)

--[[ function testRead()
    testFuncFromTables()
    local oamArr = getOAMArray(10)
    console:log("Tile string length: " .. getTileStringLength(oamArr))
    bytes = emu:readRange(0x06014420, 32)
    console:log(tostring(string.byte(bytes, 7)))
    console:log(tostring(string.byte(matchstr, 7)))
    match = bytes == matchstr
    console:log(tostring(match))
    if match then
        console:log("MATCH FOUND")
    end
end ]]
function testFunc2()
    local stringTable = StringTable:new(nil)
    console:log("String length " .. #(stringTable.DRESS))
end

callbacks:add("frame", testFunc2)
