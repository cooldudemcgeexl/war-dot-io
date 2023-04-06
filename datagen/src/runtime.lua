local outputDir = "\\\\wsl.localhost\\Ubuntu\\home\\nick\\repos\\war-dot-io\\resources\\testImages\\"
local fileName = 'image.png'
local outputPath = outputDir .. fileName
local frameInterval = 5


function printGameInfo()
    console:log(emu:getGameCode())
end

function writeFrame()
    local currFrame = emu:currentFrame()
    if currFrame % frameInterval == 0 then
        console:log('Writing frame\n')
        console:log(outputPath)
        emu:screenshot(outputDir .. fileName)
    end
end

callbacks:add('startup', printGameInfo)
callbacks:add('frame', writeFrame)
