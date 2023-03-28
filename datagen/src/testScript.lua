matchbytes = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x88, 0x0, 0x0, 0x88, 0xBB, 0x0, 0x80, 0xB8, 0xBB, 0x0, 0x88, 0xBB,
              0x8B, 0x80, 0xB8, 0xBB, 0x88, 0x80, 0xBB, 0x8B, 0x8, 0x88, 0xBB, 0x88, 0x0}

function makeAsciiString(byteArray)
    restr = ""
    for i, v in ipairs(byteArray) do
        restr = restr .. string.char(v)
    end
    return restr
end

matchstr = makeAsciiString(matchbytes)

function testRead()
    bytes = emu:readRange(0x06014420, 32)
    console:log(tostring(string.byte(bytes, 7)))
    console:log(tostring(string.byte(matchstr, 7)))
    match = bytes == matchstr
    console:log(tostring(match))
    if match then
        console:log("MATCH FOUND")
    end

end

callbacks:add("frame", testRead)
