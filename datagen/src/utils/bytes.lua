---Make an ASCII string out of a byte array
---@param byteArray table<any,number>
---@return string
function makeAsciiString(byteArray)
    local restr = ""
    for i, v in ipairs(byteArray) do
        restr = restr .. string.char(v)
    end
    return restr
end
