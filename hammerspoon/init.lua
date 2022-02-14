hyper = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall
Install:andUse("WindowGrid",
               {
                 config = { gridGeometries = { { "5x4" } } },
                 hotkeys = {show_grid = {shift_hyper, "g"}},
                 start = true
               }
)

-- Get list of screens and refresh that list whenever screens are plugged or unplugged
-- then reload hammerspoon so grid is correct
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
  hs.reload()
end)

-- do stuff when screen is locked
function caffeinateEvents(eventType)
  local spotifyState = hs.spotify.getPlaybackState()
  local playing = hs.spotify.isPlaying()
  foo = hs.inspect(eventType)
  -- hs.notify.new({title="Hammerspoon", informativeText=foo}):send()
  -- change things when screen locks
  -- note, screen saver will lock screen and in this case puase spotify
  if (eventType == hs.caffeinate.watcher.screensDidLock) then
    if playing then
      hs.spotify.pause()
    end
  end
end
caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateEvents)
caffeinateWatcher:start()



-- caffeine

hs.loadSpoon("Caffeine")
--spoon.Caffeine:bindHotkeys({toggle = {hyper, "C"},})
spoon.Caffeine:start()

-- bind hotkey
hs.hotkey.bind(shift_hyper, '1', function()
  -- get the focused window
  local win = hs.window.focusedWindow()
  -- get the screen where the focused window is displayed, a.k.a. current screen
  local screen = win:screen()
  -- compute the unitRect of the focused window relative to the current screen -- and move the window to the next screen setting the same unitRect 
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

Install:andUse("KSheet", {
   hotkeys = {
     toggle = { hyper, "/" }
  }
})

-- ArrangeDesktop
Install:andUse('ArrangeDesktop')
arptoprangeDesktop = hs.loadSpoon('ArrangeDesktop')
arrangeDesktop.logger.setLogLevel('info')
menubar = hs.menubar.new()

if menubar then
    menubar:setIcon(hs.image.imageFromName("NSHandCursor"))
    local menuItems = {}
    menuItems = arrangeDesktop:addMenuItems(menuItems)
    menubar:setMenu(menuItems)
end
-- arrangeDesktop = hs.loadSpoon('ArrangeDesktop')
-- arrangeDesktop.logger.setLogLevel('info')
-- menubar = hs.menubar.new()
