local gameDetector = require("utils.detectGame")

function gameCheckLoop()
    local currentGame = gameDetector.detectGame()
end

callbacks:add("frame", gameCheckLoop)
