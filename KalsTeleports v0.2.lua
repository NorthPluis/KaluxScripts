-- Create the main GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "Player Teleport GUI"
mainGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Define the dark color scheme
local backgroundColor = Color3.fromRGB(34, 34, 34)
local buttonColor = Color3.fromRGB(65, 65, 65)
local textColor = Color3.fromRGB(255, 255, 255)

-- Create the teleport function
local function teleportToPlayer(player)
    local character = game.Players.LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local targetCharacter = player.Character
    local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and targetCharacter and targetHumanoidRootPart then
        humanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
    end
end

-- Create a function to update the player list
local function updatePlayerList()
    -- Clear the GUI
    mainGui:ClearAllChildren()

    -- Create a frame to hold the player buttons
    local frame = Instance.new("Frame")
    frame.Name = "PlayerListFrame"
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.Size = UDim2.new(0, 200, 0, 300)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = backgroundColor
    frame.BorderSizePixel = 0
    frame.Parent = mainGui

    -- Create a title label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Text = "Kal's Teleport"
    titleLabel.TextColor3 = textColor
    titleLabel.BackgroundColor3 = backgroundColor
    titleLabel.BorderSizePixel = 0
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.Parent = frame

    -- Create a minimize button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Position = UDim2.new(1, -30, 0, 0)
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = textColor
    minimizeButton.BackgroundColor3 = backgroundColor
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 18
    minimizeButton.Parent = frame

    -- Create a credits button
    local creditsButton = Instance.new("TextButton")
    creditsButton.Name = "CreditsButton"
    creditsButton.Position = UDim2.new(1, -60, 0, 0)
    creditsButton.Size = UDim2.new(0, 30, 0, 30)
    creditsButton.Text = "C"
    creditsButton.TextColor3 = textColor
    creditsButton.BackgroundColor3 = backgroundColor
    creditsButton.BorderSizePixel = 0
    creditsButton.Font = Enum.Font.SourceSansBold
    creditsButton.TextSize = 18
    creditsButton.Parent = frame

    -- Create a frame for the credits section
    local creditsFrame = Instance.new("Frame")
    creditsFrame.Name = "CreditsFrame"
    creditsFrame.Position = UDim2.new(1, 0, 0, 0)
    creditsFrame.Size = UDim2.new(0, 200, 0, 300)
    creditsFrame.BackgroundTransparency = 0.5
    creditsFrame.BackgroundColor3 = backgroundColor
    creditsFrame.BorderSizePixel = 0
    creditsFrame.Visible = false
    creditsFrame.Parent = frame

    -- Create a title label for the credits section
    local creditsTitleLabel = Instance.new("TextLabel")
    creditsTitleLabel.Name = "CreditsTitleLabel"
    creditsTitleLabel.Position = UDim2.new(0, 0, 0, 0)
    creditsTitleLabel.Size = UDim2.new(1, 0, 0, 30)
    creditsTitleLabel.Text = "Credits"
    creditsTitleLabel.TextColor3 = textColor
    creditsTitleLabel.BackgroundColor3 = backgroundColor
    creditsTitleLabel.BorderSizePixel = 0
    creditsTitleLabel.Font = Enum.Font.SourceSansBold
    creditsTitleLabel.TextSize = 18
    creditsTitleLabel.Parent = creditsFrame

    -- Create a developer label
    local developerLabel = Instance.new("TextLabel")
    developerLabel.Name = "DeveloperLabel"
    developerLabel.Position = UDim2.new(0, 10, 0, 40)
    developerLabel.Size = UDim2.new(1, -20, 0, 30)
    developerLabel.Text = "Dev: Kalux"
    developerLabel.TextColor3 = textColor
    developerLabel.BackgroundColor3 = backgroundColor
    developerLabel.BorderSizePixel = 0
    developerLabel.Font = Enum.Font.SourceSans
    developerLabel.TextSize = 14
    developerLabel.Parent = creditsFrame

    -- Create a scripter label
    local scripterLabel = Instance.new("TextLabel")
    scripterLabel.Name = "ScripterLabel"
    scripterLabel.Position = UDim2.new(0, 10, 0, 70)
    scripterLabel.Size = UDim2.new(1, -20, 0, 30)
    scripterLabel.Text = "Scripter: ChatGPT"
    scripterLabel.TextColor3 = textColor
    scripterLabel.BackgroundColor3 = backgroundColor
    scripterLabel.BorderSizePixel = 0
    scripterLabel.Font = Enum.Font.SourceSans
    scripterLabel.TextSize = 14
    scripterLabel.Parent = creditsFrame

    -- Create a scrollable frame for the player buttons
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "PlayerScrollFrame"
    scrollFrame.Position = UDim2.new(0, 5, 0, 35)
    scrollFrame.Size = UDim2.new(1, -10, 1, -40)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 10
    scrollFrame.Visible = false
    scrollFrame.Parent = frame

    -- Calculate the total height of the player buttons
    local playerCount = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            playerCount = playerCount + 1
        end
    end
    local buttonHeight = 30
    local totalHeight = playerCount * buttonHeight

    -- Adjust the frame size based on the player count
    frame.Size = UDim2.new(0, 200, 0, math.min(totalHeight + 40, 300))

    -- Update the position of the minimize button
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)
    creditsButton.Position = UDim2.new(1, -30, 0, 0)

    -- Create a UI list layout for the player buttons
    local listLayout = Instance.new("UIListLayout")
    listLayout.Name = "ListLayout"
    listLayout.Padding = UDim.new(0, 5)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scrollFrame

    -- Create a TweenService to handle animations
    local tweenService = game:GetService("TweenService")

    -- Function to handle GUI minimize and maximize animations
    local function animateMinimize(isMinimized)
        local targetSize = isMinimized and UDim2.new(0, 200, 0, 30) or UDim2.new(0, 200, 0, math.min(totalHeight + 40, 300))

        -- Create the TweenInfo for the animation
        local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

        -- Create the tween
        local tween = tweenService:Create(frame, tweenInfo, {Size = targetSize})

        -- Play the tween
        tween:Play()
    end

    -- Minimize button click event
    minimizeButton.MouseButton1Click:Connect(function()
        scrollFrame.Visible = not scrollFrame.Visible
        animateMinimize(not scrollFrame.Visible)
    end)

    -- Credits button click event
    creditsButton.MouseButton1Click:Connect(function()
        creditsFrame.Visible = not creditsFrame.Visible
    end)

    -- Create a button for each player
    local yOffset = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local button = Instance.new("TextButton")
            button.Name = "PlayerButton"
            button.Position = UDim2.new(0, 0, 0, yOffset)
            button.Size = UDim2.new(1, 0, 0, buttonHeight)
            button.Text = player.Name
            button.TextColor3 = textColor
            button.BackgroundColor3 = buttonColor
            button.BorderSizePixel = 0
            button.Font = Enum.Font.SourceSans
            button.TextSize = 14
            button.Parent = scrollFrame

            -- Teleport the local player to the selected player when the button is clicked
            button.MouseButton1Click:Connect(function()
                teleportToPlayer(player)
            end)

            yOffset = yOffset + buttonHeight
        end
    end
end

-- Update the player list initially
updatePlayerList()

-- Listen for player changes and update the list accordingly
game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)
