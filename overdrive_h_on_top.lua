-- Overdrive H On Top
-- Version 1.0.1

local shared = odh_shared_plugins

if not shared then
    error("Overdrive H API is unavailable.")
end

local pluginEnabled = true
local selectedPlayerName = "No player selected"

local iconPath =
    "/bielatbolkafilip9-max/Overdrive-H-On-Top/refs/heads/main/icon"

local tab = shared.CreateTab(
    "Overdrive H On Top",
    iconPath
)

local section = tab:AddSection(
    "Utility Panel",
    "OVERDRIVE H ON TOP | V1.0.1"
)

section:AddLabel("Credits: Fobbi")

section:AddParagraph(
    "Welcome",
    "Overdrive H On Top has loaded."
)

section:AddToggle("Enable Plugin", function(state)
    pluginEnabled = state

    shared.Notify(
        state and "Plugin enabled." or "Plugin disabled.",
        2
    )
end)

section:AddSlider("Notification Duration", 1, 10, 3, function(value)
    if pluginEnabled then
        shared.Notify("Notification duration: " .. value, value)
    end
end)

section:AddDropdown(
    "Quick Message",
    {"Hello!", "Plugin loaded!", "Overdrive H"},
    function(selected)
        if pluginEnabled then
            shared.Notify(selected, 3)
        end
    end
)

section:AddTextBox("Custom Notification", function(text)
    if pluginEnabled and text ~= "" then
        shared.Notify(text, 3)
    end
end)

section:AddPlayerDropdown("Select Player", function(player)
    if player and player.Name then
        selectedPlayerName = player.Name
        shared.Notify("Selected: " .. selectedPlayerName, 2)
    end
end)

section:AddButton("Show Selected Player", function()
    if pluginEnabled then
        shared.Notify("Selected player: " .. selectedPlayerName, 3)
    end
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

