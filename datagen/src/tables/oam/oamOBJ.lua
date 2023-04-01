local OAMAttr0 = require("tables.oam.oamAttr0")
local OAMAttr1 = require("tables.oam.oamAttr1")
local OAMAttr2 = require("tables.oam.oamAttr2")

---@class OAMObj
---@field oamSlot number
---@field address number
---@field attr0 number
---@field attribute0 OAMAttr0
---@field attr1 number
---@field attribute1 OAMAttr1
---@field attr2 number
---@field attribute2 OAMAttr2
---@field attr3 number
local OAMObj = {
    oamSlot = 0
}

function OAMObj:new(o, oamSlot)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.oamSlot = oamSlot or 0
    o.address = 0x07000000 + oamSlot * 8
    o.attr0 = emu:read16(o.address)
    o.attribute0 = OAMAttr0:new(nil, o.attr0)
    o.attr1 = emu:read16(o.address + 2)
    o.attribute1 = OAMAttr1:new(nil, o.attr1)
    o.attr2 = emu:read16(o.address + 4)
    o.attribute2 = OAMAttr2:new(nil, o.attr2)
    o.attr3 = emu:read16(o.address + 6)
    return o
end

function OAMObj:debugPrint()
    console:log("Reading from OAM Slot " .. self.oamSlot)
    console:log("Attribute 0: " .. self.attr0)
    self.attribute0:debugPrint()
    console:log("Attribute 1: " .. self.attr1)
    self.attribute1:debugPrint()
    console:log("Attribute 2: " .. self.attr2)
    self.attribute2:debugPrint()
    console:log("Attribute 3: " .. self.attr3)
end

--- Get the tile index of the current object
--- @return number
function OAMObj:getTileIndex()
    return self.attribute2.tile_idx
end

function testFuncFromTables()
    testObj1 = OAMObj:new(nil, 0)
    testObj2 = OAMObj:new(nil, 1)
    console:log("Printing OAM Attributes")
    console:log(tostring(testObj1:getTileIndex()))

end

return OAMObj
