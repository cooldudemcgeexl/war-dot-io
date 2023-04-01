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
    console:log("Size: " .. self.size)
    console:log("Color Mode: " .. self.color_mode)
    console:log("Mosaic: " .. self.mosaic)
    console:log("Effect: " .. self.effect)
    console:log("Affine: " .. self.affine)
    console:log("Y: " .. self.y)
end

return OAMAttr1
