OAMObj = require("tables.oam.oamOBJ")

---Get an array of n OAM objects
---@param slots number
---@return table<number,OAMObj>
function getOAMArray(slots)
    local oamArr = {}
    local slotNum = slots - 1
    for i = 0, slotNum, 1 do
        oamArr[#oamArr + 1] = OAMObj:new(nil, i)
    end
    return oamArr
end

---Print debugPrint from each OAM object
---@param oamArr table<number,OAMObj>
function printOAMArray(oamArr)
    for _, oamObj in ipairs(oamArr) do
        console:log(tostring(oamObj:getTileIndex()))
    end
end

---Return the length of a string of tiles
---@param oamArr table<number, OAMObj>
---@return integer
function getTileStringLength(oamArr)
    local oamStrLen = 0
    for i, oamObj in ipairs(oamArr) do
        if oamObj:getTileIndex() > 600 then
            oamStrLen = i - 1
            break
        end
    end
    return oamStrLen
end
