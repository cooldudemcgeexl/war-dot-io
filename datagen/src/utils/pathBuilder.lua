local gameTable = require('tables.gameText.gameTable')
local paths = require('constants.paths')

---Build out directory tree for games
local function makeGameDirs()
    local cmdList = {}
    for category, gameList in pairs(gameTable) do
        for _, gameTitle in pairs(gameList) do
            local gamePath = paths.screenshotDir .. "\\" .. category .. "\\" .. gameTitle
            local command = 'mkdir ' .. gamePath
            cmdList[#cmdList + 1] = command
        end
    end
    local bigCmd = table.concat(cmdList, " && ")
    os.execute(bigCmd)
end


local pathBuilder = {
    makeGameDirs = makeGameDirs
}

return pathBuilder
