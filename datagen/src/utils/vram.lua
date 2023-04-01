local OBJVRAMADDR = 0x06014400

function getVRAMBytes(numBytes)
    bytes = emu:readRange(OBJVRAMADDR, 32 * (3 * numBytes))
end
