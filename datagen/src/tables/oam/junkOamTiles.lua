local tiles = {
    913, 860, 900, 16, 990, 510
}

---comment
---@param value any
---@return boolean
local function hasJunk(value)
    for i, v in ipairs(tiles) do
        if v == value then
            return true
        end
    end
    return false
end

local junk = {
    tiles = tiles,
    hasJunk = hasJunk
}
return junk
