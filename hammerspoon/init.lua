hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.repos.zzspoons = {
  url = "https://github.com/zzamboni/zzSpoons",
  desc = "zzamboni's spoon repository",
}
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

hs.loadSpoon("MouseCircle")
spoon.MouseCircle:bindHotkeys({
  show = { { "ctrl", "cmd", "alt" }, "d" }
})

hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool:start()
spoon.ClipboardTool:bindHotkeys({
  show_clipboard = { { "cmd", "alt" }, "c" }
})

hs.loadSpoon("BrewInfo")
spoon.BrewInfo:bindHotkeys({
  show_brew_info = { { "cmd", "alt" }, "b" },
  open_brew_url = { { "cmd", "alt" }, "n" }
})

hs.loadSpoon("FnMate")

Install:andUse("Seal",
               {
                 hotkeys = { toggle = { {"cmd"}, "space" } },
                 fn = function(s)
                   s:loadPlugins({"apps", "calc", "safari_bookmarks", "screencapture", "useractions"})
                   s.plugins.safari_bookmarks.always_open_with_safari = false
                   s:refreshAllCommands()
                 end,
                 start = true,
               }
)

hs.loadSpoon("TimeFlow")

require("ime")
require("window")
