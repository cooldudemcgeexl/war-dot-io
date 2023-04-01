local OAMAttr0 = {
    shape = 0,
    color_mode = 0,
    mosaic = 0,
    effect = 0,
    affine = 0,
    y = 0
}

function OAMAttr0:new(o, oamAttr)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.shape = (0xC000 & oamAttr) >> 14
    o.color_mode = (0x2000 & oamAttr) >> 13
    o.mosiac = (0x1000 & oamAttr) >> 12
    o.effect = (0xC00 & oamAttr) >> 10
    o.affine = (0x300 & oamAttr) >> 8
    o.y = 0xFF & oamAttr
    return o
end

function OAMAttr0:debugPrint()
    console:log("Attribute 0 expanded:")
    console:log("Shape: " .. self.shape)
    console:log("Color Mode: " .. self.color_mode)
    console:log("Mosaic: " .. self.mosaic)
    console:log("Effect: " .. self.effect)
    console:log("Affine: " .. self.affine)
    console:log("Y: " .. self.y)
end

return OAMAttr0
