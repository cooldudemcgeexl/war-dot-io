local OBJVRAMADDR = 0x06014400

---Get the number of bytes from VRAM
---@param numSlots integer
---@return string
local function getVRAMSlots(numSlots)
    local bytes = emu:readRange(OBJVRAMADDR, 32 * (3 * numSlots))
    return bytes
end

---Check the first tile in VRAM. If it is different, return the new value. Otherwise, return nil.
---@param currOBJVramStart string
---@return string|nil
local function hasOBJVRAMChanged(currOBJVramStart)
    local newOBJVramStart = getVRAMSlots(1)
    if newOBJVramStart ~= currOBJVramStart then
        return newOBJVramStart
    end
    return nil
end

local vram = {
    getVRAMSlots = getVRAMSlots,
    hasOBJVRAMChanged = hasOBJVRAMChanged,
    OBJVRAMADDR = OBJVRAMADDR
}

return vram
