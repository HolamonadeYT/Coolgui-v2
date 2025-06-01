-- // Executor GUI Script (LocalScript içinde StarterGui'ye yerleştirilmelidir)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CoolGUIExecutor"
screenGui.Parent = LocalPlayer.PlayerGui
screenGui.ResetOnSpawn = false

-- // Ana Pencere
local mainWindow = Instance.new("Frame")
mainWindow.Name = "MainWindow"
mainWindow.Size = UDim2.new(0.4, 0, 0.6, 0) -- Biraz daha uzun
mainWindow.Position = UDim2.new(0.3, 0, 0.2, 0)
mainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
mainWindow.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainWindow.BorderSizePixel = 1
mainWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainWindow.Draggable = true
mainWindow.Parent = screenGui

-- // Başlık Çubuğu
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0.08, 0) -- Biraz daha küçük
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 1
titleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Parent = mainWindow

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0.8, 0, 1, 0)
titleLabel.Text = "CoolGUI Executor"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Padding = UDim.new(0, 5)
titleLabel.Parent = titleBar

-- // Kapat Butonu
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0.1, 0, 1, 0)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
	screenGui.Enabled = false
end)

-- // Sekmeler için Çerçeve
local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabsFrame"
tabsFrame.Size = UDim2.new(0.2, 0, 0.92, 0) -- Daha uzun
tabsFrame.Position = UDim2.new(0, 0, 0.08, 0)
tabsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabsFrame.Parent = mainWindow

-- // Ana İçerik Çerçevesi (Sekmelerin içeriği burada gösterilecek)
local mainContentFrame = Instance.new("Frame")
mainContentFrame.Name = "MainContentFrame"
mainContentFrame.Size = UDim2.new(0.8, 0, 0.92, 0) -- Daha uzun
mainContentFrame.Position = UDim2.new(0.2, 0, 0.08, 0)
mainContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainContentFrame.ClipsDescendants = true -- İçeriğin taşmasını önler
mainContentFrame.Parent = mainWindow

-- // Fonksiyonlar

local function createTabButton(text, index)
	local button = Instance.new("TextButton")
	button.Name = text .. "TabButton"
	button.Size = UDim2.new(1, 0, 0.08, 0)
	button.Position = UDim2.new(0, 0, 0.08 * (index - 1), 0)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 16
	button.Parent = tabsFrame
	return button
end

local function createContentFrame(name)
	local frame = Instance.new("Frame")
	frame.Name = name .. "Content"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	frame.Visible = false
	frame.Parent = mainContentFrame
	return frame
end

-- // Sekmeler ve İçerikleri

-- // Decal Spam Sekmesi
local decalSpamTab = createTabButton("Decal Spam", 1)
local decalSpamContent = createContentFrame("DecalSpam")
decalSpamContent.Visible = true
local currentTabContent = decalSpamContent

local decalLabel = Instance.new("TextLabel")
decalLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
decalLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
decalLabel.Text = "Decal ID:"
decalLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
decalLabel.BackgroundTransparency = 1
decalLabel.Font = Enum.Font.SourceSansBold
decalLabel.TextSize = 16
decalLabel.Parent = decalSpamContent

local decalTextBox = Instance.new("TextBox")
decalTextBox.Size = UDim2.new(0.9, 0, 0.1, 0)
decalTextBox.Position = UDim2.new(0.05, 0, 0.15, 0)
decalTextBox.PlaceholderText = "rbxassetid://..."
decalTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
decalTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
decalTextBox.Font = Enum.Font.SourceSans
decalTextBox.TextSize = 16
decalTextBox.Parent = decalSpamContent

local decalButton = Instance.new("TextButton")
decalButton.Size = UDim2.new(0.4, 0, 0.1, 0)
decalButton.Position = UDim2.new(0.05, 0, 0.3, 0)
decalButton.Text = "Spam Decal"
decalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
decalButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
decalButton.Font = Enum.Font.SourceSansBold
decalButton.TextSize = 16
decalButton.Parent = decalSpamContent

decalButton.MouseButton1Click:Connect(function()
	local decalId = decalTextBox.Text
	if decalId ~= "" then
		local mouse = LocalPlayer:GetMouse()
		local target = mouse.Target
		if target and target:IsA("BasePart") then
			local decal = Instance.new("Decal")
			decal.Face = Enum.NormalId.Front
			decal.Texture = decalId
			decal.Parent = target
		end
	end
end)

-- // Player Ayarları Sekmesi
local playerSettingsTab = createTabButton("Player", 2)
local playerSettingsContent = createContentFrame("PlayerSettings")

-- WalkSpeed
local walkSpeedLabel = Instance.new("TextLabel")
walkSpeedLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
walkSpeedLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
walkSpeedLabel.Text = "Walk Speed:"
walkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedLabel.BackgroundTransparency = 1
walkSpeedLabel.Font = Enum.Font.SourceSansBold
walkSpeedLabel.TextSize = 16
walkSpeedLabel.Parent = playerSettingsContent

local walkSpeedTextBox = Instance.new("TextBox")
walkSpeedTextBox.Size = UDim2.new(0.4, 0, 0.1, 0)
walkSpeedTextBox.Position = UDim2.new(0.05, 0, 0.15, 0)
walkSpeedTextBox.Text = tostring(LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed)
walkSpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
walkSpeedTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
walkSpeedTextBox.Font = Enum.Font.SourceSans
walkSpeedTextBox.TextSize = 16
walkSpeedTextBox.Parent = playerSettingsContent

walkSpeedTextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local speed = tonumber(walkSpeedTextBox.Text)
		if speed then
			LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = speed
		end
	end
end)

-- JumpPower
local jumpPowerLabel = Instance.new("TextLabel")
jumpPowerLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
jumpPowerLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
jumpPowerLabel.Text = "Jump Power:"
jumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpPowerLabel.BackgroundTransparency = 1
jumpPowerLabel.Font = Enum.Font.SourceSansBold
jumpPowerLabel.TextSize = 16
jumpPowerLabel.Parent = playerSettingsContent

local jumpPowerTextBox = Instance.new("TextBox")
jumpPowerTextBox.Size = UDim2.new(0.4, 0, 0.1, 0)
jumpPowerTextBox.Position = UDim2.new(0.05, 0, 0.4, 0)
jumpPowerTextBox.Text = tostring(LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower)
jumpPowerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpPowerTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
jumpPowerTextBox.Font = Enum.Font.SourceSans
jumpPowerTextBox.TextSize = 16
jumpPowerTextBox.Parent = playerSettingsContent

jumpPowerTextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local power = tonumber(jumpPowerTextBox.Text)
		if power then
			LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = power
		end
	end
end)

-- // Hareket Sekmesi
local movementTab = createTabButton("Movement", 3)
local movementContent = createContentFrame("Movement")

-- Teleport to Mouse
local teleportToMouseButton = Instance.new("TextButton")
teleportToMouseButton.Size = UDim2.new(0.4, 0, 0.1, 0)
teleportToMouseButton.Position = UDim2.new(0.05, 0, 0.05, 0)
teleportToMouseButton.Text = "Teleport To Mouse"
teleportToMouseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportToMouseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
teleportToMouseButton.Font = Enum.Font.SourceSansBold
teleportToMouseButton.TextSize = 16
teleportToMouseButton.Parent = movementContent

teleportToMouseButton.MouseButton1Click:Connect(function()
	local mouse = LocalPlayer:GetMouse()
	local targetPosition = mouse.Hit.p + Vector3.new(0, 2, 0) -- Biraz yukarıda ışınlan
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		LocalPlayer.Character:MoveTo(targetPosition)
	end
end)

-- // Görsel Sekme
local visualsTab = createTabButton("Visuals", 4)
local visualsContent = createContentFrame("Visuals")

-- FOV Ayarı
local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
fovLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
fovLabel.Text = "FOV:"
fovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fovLabel.BackgroundTransparency = 1
fovLabel.Font = Enum.Font.SourceSansBold
fovLabel.TextSize = 16
fovLabel.Parent = visualsContent

local fovTextBox = Instance.new("TextBox")
fovTextBox.Size = UDim2.new(0.4, 0, 0.1, 0)
fovTextBox.Position = UDim2.new(0.05, 0, 0.15, 0)
fovTextBox.Text = tostring(game.Workspace.CurrentCamera.FieldOfView)
fovTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
fovTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
fovTextBox.Font = Enum.Font.SourceSans
fovTextBox.TextSize = 16
fovTextBox.Parent = visualsContent

fovTextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local fov = tonumber(fovTextBox.Text)
		if fov then
			game.Workspace.CurrentCamera.FieldOfView = fov
		end
	end
end)

-- // Sekme Geçiş Mantığı
local tabs = {
	{button = decalSpamTab, content = decalSpamContent},
	{button = playerSettingsTab, content = playerSettingsContent},
	{button = movementTab, content = movementContent},
	{button = visualsTab, content = visualsContent}
}

local function switchTab(selectedTabButton, selectedContentFrame)
	if currentTabContent then
		currentTabContent.Visible = false
	end
	selectedContentFrame.Visible = true
	currentTabContent = selectedContentFrame

	for _, tabInfo in ipairs(tabs) do
		if tabInfo.button == selectedTabButton then
			tabInfo.button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		else
			tabInfo.button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		end
	end
end

for _, tabInfo in ipairs(tabs) do
	tabInfo.button.MouseButton1Click:Connect(function()
		switchTab(tabInfo.button, tabInfo.content)
	end)
end

-- // GUI'yi açma/kapama tuşu
local toggleKey = Enum.KeyCode.LeftShift

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent and input.KeyCode == toggleKey then
		screenGui.Enabled = not screenGui.Enabled
	end
end)

screenGui.Enabled = true
