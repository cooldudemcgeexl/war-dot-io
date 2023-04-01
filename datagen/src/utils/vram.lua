local OBJVRAMADDR = 0x06014400

---Get the number of bytes from VRAM
---@param numSlots integer
---@return string
local function getVRAMSlots(numSlots)
    bytes = emu:readRange(OBJVRAMADDR, 32 * (3 * numSlots))
    return bytes
end

local vram = {
    getVRAMSlots = getVRAMSlots
}

return vram
