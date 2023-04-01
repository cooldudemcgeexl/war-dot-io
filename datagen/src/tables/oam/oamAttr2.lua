local OAMAttr2 = {
    palette_bank = 0,
    priority = 0,
    tile_idx = 0
}

function OAMAttr2:new(o, oamAttr)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.palette_bank = (0xF000 & oamAttr) >> 10
    o.priority = (0xC00 & oamAttr) >> 10
    o.tile_idx = 0x3FF & oamAttr
    return o
end

function OAMAttr2:debugPrint()
    console:log("Attribute 2 expanded:")
    console:log("Palette Bank: " .. self.palette_bank)
    console:log("Priority: " .. self.priority)
    console:log("Tile Index: " .. self.tile_idx)
end

return OAMAttr2
