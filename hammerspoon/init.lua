local scrollModifier = "alt"
local scrollMult = 4 -- negate to invert scroll direction; increase in magnitude to increase sensitivity

watchCtrl = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
    local modifiers = e:getFlags()
    if (modifiers[scrollModifier]) then
        -- print(scrollModifier .. " pressed")
        watchMouseMove:start()
    else
        -- print(scrollModifier .. " lifted")
        watchMouseMove:stop()
    end
end)

local oldMousePos = {}
watchMouseMove = hs.eventtap.new({hs.eventtap.event.types.mouseMoved}, function(e)
    -- print("mouse moved")
    oldMousePos = hs.mouse.absolutePosition()
    local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
    local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
    local scroll = hs.eventtap.event.newScrollEvent({dx * scrollMult, dy * scrollMult},{},'pixel')
    -- put the mouse back
    hs.mouse.absolutePosition(oldMousePos)
    return true, {scroll}
end)

watchCtrl:start()
