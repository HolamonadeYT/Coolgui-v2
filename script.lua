-- Coolkid GUI Full Size by Baldiback

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local coolkidDecal = "rbxassetid://476620097"
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "CoolkidUltimateGUI"

-- Frame (Büyük boyutlu)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 400) -- büyüklük burda ayarlandı
Frame.Position = UDim2.new(1, -310, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.AnchorPoint = Vector2.new(0, 0)
Frame.Active = true
Frame.Draggable = true

local UIList = Instance.new("UIListLayout", Frame)
UIList.Padding = UDim.new(0, 10)
UIList.FillDirection = Enum.FillDirection.Vertical
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.VerticalAlignment = Enum.VerticalAlignment.Top

local function addButton(text, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0.9, 0, 0, 50)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 24
    btn.AutoButtonColor = true
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Variables for toggles
local decalsApplied = false
local logosApplied = false
local flooding = false

-- Duvarlara Coolkid Decal
local function applyWallDecals()
    if decalsApplied then return end
    decalsApplied = true
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local decal = Instance.new("Decal", part)
            decal.Texture = coolkidDecal
            decal.Face = Enum.NormalId.Front
        end
    end
end

-- Kafalara Logo
local function applyHeadLogos()
    if logosApplied then return end
    logosApplied = true
    for _, plr in pairs(Players:GetPlayers()) do
        local char = plr.Character
        if char and char:FindFirstChild("Head") then
            if not char.Head:FindFirstChild("CoolkidLogo") then
                local billboard = Instance.new("BillboardGui", char.Head)
                billboard.Name = "CoolkidLogo"
                billboard.Size = UDim2.new(5,0,5,0)
                billboard.AlwaysOnTop = true
                billboard.StudsOffset = Vector3.new(0,3,0)

                local imageLabel = Instance.new("ImageLabel", billboard)
                imageLabel.Size = UDim2.new(1,0,1,0)
                imageLabel.BackgroundTransparency = 1
                imageLabel.Image = coolkidDecal
            end
        end
    end
end

-- Chat Flood
local floodMessages = {
    "JOIN C00LKIDD!",
    "YOU HAVE BEEN INFECTED!",
    "COOLKID NEVER DIES!",
    "ROBLOX IS OURS 😈"
}

local floodThread
local function startChatFlood()
    if flooding then return end
    flooding = true
    floodThread = coroutine.create(function()
        while flooding do
            local msg = floodMessages[math.random(1, #floodMessages)]
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
            wait(2)
        end
    end)
    coroutine.resume(floodThread)
end

local function stopChatFlood()
    flooding = false
end

-- Butonlar
local decalBtn = addButton("🟥 Duvarlara Coolkid Bas", applyWallDecals)
local logoBtn = addButton("🔴 Kafalara Logo Koy", applyHeadLogos)
local floodStartBtn = addButton("💬 Chat Flood Başlat", startChatFlood)
local floodStopBtn = addButton("🛑 Chat Flood Durdur", stopChatFlood)

-- GUI Kapatma Butonu
local closeBtn = Instance.new("TextButton", Frame)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 28
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)

-- Kısayol: F2 ile aç/kapat
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F2 then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

print("Coolkid GUI full size loaded. F2 ile aç/kapat.")
