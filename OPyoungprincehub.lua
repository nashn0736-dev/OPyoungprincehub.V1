--[[
    OPYOUNGPRINCEHUB V1 - BAHAY KUBO GARDEN (ANTI-BAN PREMIUM)
    Theme: Obsidian & Neon Cyan
--]]

if game.CoreGui:FindFirstChild("OPyoungprincehub") then
    game.CoreGui.OPyoungprincehub:Destroy()
end

-- =============================================================================
-- 🔥 ULTRA ANTI-BAN & DETECT BYPASS ARCHITECTURE
-- =============================================================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hooking the Metatable to bypass Client Anti-Cheat Detection Vectors
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- Block known Ban/Kick and Report Remotes from the Roblox Server
    if tostring(self) == "BanRemote" or tostring(self) == "KickRemote" or string.find(string.lower(tostring(self)), "cheat") or string.find(string.lower(tostring(self)), "report") then
        return nil -- Drop the game's remote execution request to prevent bans
    end
    
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- =============================================================================
-- GAME SCRIPTS & CORE LOOPS
-- =============================================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Network") or ReplicatedStorage

_G.AutoHarvest = false
_G.AutoSell = false

local OPyoungprincehub = Instance.new("ScreenGui")
local MainPanel = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TogglePanelBtn = Instance.new("TextButton")
local Content = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

OPyoungprincehub.Name = "OPyoungprincehub"
OPyoungprincehub.Parent = game.CoreGui
OPyoungprincehub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainPanel.Name = "MainPanel"
MainPanel.Parent = OPyoungprincehub
MainPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainPanel.Position = UDim2.new(0.5, -175, 0.5, -125)
MainPanel.Size = UDim2.new(0, 350, 0, 250)
MainPanel.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainPanel

UIStroke.Parent = MainPanel
UIStroke.Color = Color3.fromRGB(0, 255, 230)
UIStroke.Thickness = 2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

Header.Name = "Header"
Header.Parent = MainPanel
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Size = UDim2.new(1, 0, 0, 45)

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 250, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "OPyoungprincehub.V1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

TogglePanelBtn.Name = "TogglePanelBtn"
TogglePanelBtn.Parent = Header
TogglePanelBtn.BackgroundTransparency = 1
TogglePanelBtn.Position = UDim2.new(1, -45, 0, 0)
TogglePanelBtn.Size = UDim2.new(0, 45, 1, 0)
TogglePanelBtn.Font = Enum.Font.GothamBold
TogglePanelBtn.Text = "—"
TogglePanelBtn.TextColor3 = Color3.fromRGB(0, 255, 230)
TogglePanelBtn.TextSize = 20

local isMinimized = false
TogglePanelBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and UDim2.new(0, 350, 0, 45) or UDim2.new(0, 350, 0, 250)
    TogglePanelBtn.Text = isMinimized and "+" or "—"
    game:GetService("TweenService"):Create(MainPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

Content.Name = "Content"
Content.Parent = MainPanel
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 15, 0, 60)
Content.Size = UDim2.new(1, -30, 1, -75)

UIListLayout.Parent = Content
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 12)

local function CreatePremiumToggle(name, callback)
    local ToggleBg = Instance.new("Frame")
    local ToggleCorner = Instance.new("UICorner")
    local ToggleLabel = Instance.new("TextLabel")
    local CheckBox = Instance.new("TextButton")
    local CheckBoxCorner = Instance.new("UICorner")
    local Indicator = Instance.new("Frame")
    local IndicatorCorner = Instance.new("UICorner")
    
    ToggleBg.Name = name.."_Toggle"
    ToggleBg.Parent = Content
    ToggleBg.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    ToggleBg.Size = UDim2.new(1, 0, 0, 45)
    
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = ToggleBg
    
    ToggleLabel.Parent = ToggleBg
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
    ToggleLabel.Size = UDim2.new(0, 200, 1, 0)
    ToggleLabel.Font = Enum.Font.GothamMedium
    ToggleLabel.Text = name
    ToggleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    ToggleLabel.TextSize = 14
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    CheckBox.Parent = ToggleBg
    CheckBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CheckBox.Position = UDim2.new(1, -55, 0, 10)
    CheckBox.Size = UDim2.new(0, 45, 0, 25)
    CheckBox.Text = ""
    
    CheckBoxCorner.CornerRadius = UDim.new(1, 0)
    CheckBoxCorner.Parent = CheckBox
    
    Indicator.Parent = CheckBox
    Indicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Indicator.Position = UDim2.new(0, 3, 0, 3)
    Indicator.Size = UDim2.new(0, 19, 0, 19)
    
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator
    
    local active = false
    CheckBox.MouseButton1Click:Connect(function()
        active = not active
        callback(active)
        
        local targetPos = active and UDim2.new(0, 23, 0, 3) or UDim2.new(0, 3, 0, 3)
        local targetColor = active and Color3.fromRGB(0, 255, 230) or Color3.fromRGB(100, 100, 100)
        local labelColor = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
        
        game:GetService("TweenService"):Create(Indicator, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos, BackgroundColor3 = targetColor}):Play()
        game:GetService("TweenService"):Create(ToggleLabel, TweenInfo.new(0.2), {TextColor3 = labelColor}):Play()
    end)
end

-- ANTI-BAN SAFE LOOPS
local function runAutoHarvest()
    while _G.AutoHarvest do
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and (string.find(string.lower(v.ObjectText), "crop") or string.find(string.lower(v.ActionText), "harvest")) then
                    fireproximityprompt(v)
                end
            end
            
            local harvestRemote = Remotes:FindFirstChild("HarvestAll") or Remotes:FindFirstChild("Harvest")
            if harvestRemote then
                harvestRemote:FireServer()
            end
        end)
        task.wait(0.3) -- Slightly increased interval to bypass server-side anti-cheat tickers
    end
end

local function runAutoSell()
    while _G.AutoSell do
        pcall(function()
            local sellRemote = Remotes:FindFirstChild("SellAll") or Remotes:FindFirstChild("SellInventory") or Remotes:FindFirstChild("Sell")
            if sellRemote then
                sellRemote:FireServer(true) 
            end
        end)
        task.wait(1.5) -- Safe interval between sales to prevent instant rate-limit bans
    end
end

CreatePremiumToggle("Auto Harvest All Crops", function(state)
    _G.AutoHarvest = state
    if state then task.spawn(runAutoHarvest) end
end)

CreatePremiumToggle("Auto Sell Inventory", function(state)
    _G.AutoSell = state
    if state then task.spawn(runAutoSell) end
end)

-- GUI Dragging System
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainPanel.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainPanel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
