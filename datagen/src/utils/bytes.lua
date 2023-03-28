function makeAsciiString(byteArray)
    restr = ""
    for i, v in ipairs(byteArray) do
        restr = restr .. string.char(v)
    end
    return restr
end
