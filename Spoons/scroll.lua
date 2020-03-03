-- Scroll screen using mouse position
-- when pressing ctrl + cmd
-- made by https://github.com/jeffmikels

local oldmousepos = {}
local scrollmult = -4   -- negative multiplier makes mouse work like traditional scrollwheel

mousetap = hs.eventtap.new({5}, function(e)
    oldmousepos = hs.mouse.getAbsolutePosition()
    
    local mods = hs.eventtap.checkKeyboardModifiers()
    if mods['ctrl'] and mods['cmd'] then

        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
        scroll:post()

        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)

        return true
    else
        return false, {}
    end

end)
mousetap:start()