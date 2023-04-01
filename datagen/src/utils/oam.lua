OAMObj = require("tables.oam.oamOBJ")

local function getOAMArray(slots)
    local oamArr = {}
    for i = 0, slots - 1, 1 do
        oamArr[#i + 1] = OAMObj:new(nil, i)
    end
    return oamArr
end


local function printOAMArray(oamArr)
    for i, oamObj in ipairs(oamArr) do
        oamObj:debugPrint()
    end
end

oam = {
    getOAMArray = getOAMArray,
    printOAMArray = printOAMArray
}
