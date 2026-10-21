
-- Overdrive H On Top
-- Version 1.0.0

local shared = odh_shared_plugins

if not shared then
    error("Overdrive H API is unavailable.")
end

local pluginEnabled = true
local selectedPlayerName = "No player selected"

local iconPath = "/bielatbolkafilip9-max/Overdrive-H-On-Top/refs/heads/main/icon.png.PNG"

local tab = shared.CreateTab(
    "Overdrive H On Top",
    iconPath
)

local section = tab:AddSection(
    "Utility Panel",
    "OVERDRIVE H ON TOP | V1.0.0"
)

section:AddLabel("Created by: YOUR_NAME")

section:AddParagraph(
    "Welcome",
    "Your utility plugin is loaded."
)

section:AddToggle("Enable Plugin", function(state)
    pluginEnabled = state

    if state then
        shared.Notify("Plugin enabled.", 2)
    else
        shared.Notify("Plugin disabled.", 2)
    end
end)

section:AddPlayerDropdown("Select Player", function(player)
    if type(player) == "string" then
        selectedPlayerName = player
    elseif player and player.Name then
        selectedPlayerName = player.Name
    else
        selectedPlayerName = "No player selected"
    end

    shared.Notify("Selected: " .. selectedPlayerName, 2)
end)

section:AddButton("Show Selected Player", function()
    if not pluginEnabled then
        shared.Notify("Enable the plugin first.", 2)
        return
    end

    shared.Notify("Selected player: " .. selectedPlayerName, 3)
end)

section:AddButton("Check Plugin Status", function()
    shared.Notify(
        pluginEnabled and "Status: Enabled" or "Status: Disabled",
        2
    )
end)

section:AddButton("Test Notification", function()
    shared.Notify("Overdrive H On Top is working!", 3)
end)
