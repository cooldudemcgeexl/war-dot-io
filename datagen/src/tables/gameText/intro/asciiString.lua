local ByteTable = require("tables.gameText.intro.bytes")
require "utils.bytes"

local dress = makeAsciiString(ByteTable.DRESS)

---@class StringTable
local StringTable = {
    DRESS = dress
}

function StringTable:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    local byteTable = ByteTable:new(nil)
    self.DRESS = byteTable.DRESS
    return o
end

return StringTable
