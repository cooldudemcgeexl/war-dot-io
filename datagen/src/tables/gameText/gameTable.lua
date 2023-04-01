local introTable = require("tables.gameText.intro.asciiString")

--TODO: Change this to dynamically merge the indivdiual tables together

local gameTable = {
    [introTable.ATTACK] = "Repellion",
    [introTable.DRESS] = "Wario Wear",
    [introTable.DODGE] = "Crazy Cars"
}

return gameTable
