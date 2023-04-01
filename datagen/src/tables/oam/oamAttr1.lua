local OAMAttr1 = {
    size = 0,
    vflip = 0,
    hflip = 0,
    x = 0
}

function OAMAttr1:new(o, oamAttr)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.size = (0xC000 & oamAttr) >> 14
    o.vflip = (0x2000 & oamAttr) >> 13
    o.hflip = (0x1000 & oamAttr) >> 12
    o.x = 0xFF & oamAttr
    return o
end

function OAMAttr1:debugPrint()
    console:log("Attribute 1 expanded:")
    console:log("Size: " .. self.size)
    console:log("VFlip: " .. self.vflip)
    console:log("HFlip: " .. self.hflip)
    console:log("X: " .. self.x)
end

return OAMAttr1
