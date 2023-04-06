local function writeToTextFile(filePath, message)
    local file = io.open(filePath, 'w+')
    file:write(message)
    file:close()
end

local fileWriter = {
    writeToTextFile = writeToTextFile
}

return fileWriter
