local OAMAttr0 = require("tables.oam.oamAttr0")

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
    o.attr2 = emu:read16(o.address + 4)
    o.attr3 = emu:read16(o.address + 6)
    return o
end

function OAMObj:debugPrint()
    console:log("Reading from OAM Slot " .. self.oamSlot)
    console:log("Attribute 0 " .. self.attr0)
    console:log("Attribute 0 expanded:")
    self.attribute0:debugPrint()
    console:log("Attribute 1 " .. self.attr1)
    console:log("Attribute 2 " .. self.attr2)
    console:log("Attribute 3 " .. self.attr3)
end

function testFuncFromTables()
    testObj1 = OAMObj:new(nil, 0)
    -- testObj2 = OAMObj:new(nil, 1)
    console:log("Printing OAM Attributes")
    testObj1:debugPrint()
    -- testObj2:debugPrint()

end
