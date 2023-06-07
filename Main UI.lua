-- Create the main GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "Notification GUI"
mainGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Define the colors
local backgroundColor = Color3.fromRGB(36, 37, 42)
local textColor = Color3.fromRGB(255, 255, 255)
local buttonColor = Color3.fromRGB(30, 30, 30)

-- Create the background frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(0, 300, 0, 400)
backgroundFrame.Position = UDim2.new(0.5, -150, 1, -400)
backgroundFrame.BackgroundColor3 = backgroundColor
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = mainGui

-- Create the title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Kal's Scripts"
titleLabel.TextColor3 = textColor
titleLabel.BackgroundColor3 = backgroundColor
titleLabel.BorderSizePixel = 0
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.Parent = backgroundFrame

-- Create the section frame
local sectionFrame = Instance.new("Frame")
sectionFrame.Name = "SectionFrame"
sectionFrame.Size = UDim2.new(1, 0, 1, -30)
sectionFrame.Position = UDim2.new(0, 0, 0, 30)
sectionFrame.BackgroundTransparency = 1
sectionFrame.Parent = backgroundFrame

-- Create the teleports button
local teleportsButton = Instance.new("TextButton")
teleportsButton.Name = "TeleportsButton"
teleportsButton.Size = UDim2.new(0.8, 0, 0, 40)
teleportsButton.Position = UDim2.new(0.1, 0, 0.1, 0)
teleportsButton.Text = "Teleports"
teleportsButton.TextColor3 = textColor
teleportsButton.BackgroundColor3 = buttonColor
teleportsButton.BorderSizePixel = 0
teleportsButton.Font = Enum.Font.SourceSansBold
teleportsButton.TextSize = 16
teleportsButton.Parent = sectionFrame

-- Create the walk + jump button
local walkJumpButton = Instance.new("TextButton")
walkJumpButton.Name = "WalkJumpButton"
walkJumpButton.Size = UDim2.new(0.8, 0, 0, 40)
walkJumpButton.Position = UDim2.new(0.1, 0, 0.3, 0)
walkJumpButton.Text = "Walk + Jump"
walkJumpButton.TextColor3 = textColor
walkJumpButton.BackgroundColor3 = buttonColor
walkJumpButton.BorderSizePixel = 0
walkJumpButton.Font = Enum.Font.SourceSansBold
walkJumpButton.TextSize = 16
walkJumpButton.Parent = sectionFrame

-- Create the co-ords button
local coordsButton = Instance.new("TextButton")
coordsButton.Name = "CoordsButton"
coordsButton.Size = UDim2.new(0.8, 0, 0, 40)
coordsButton.Position = UDim2.new(0.1, 0, 0.5, 0)
coordsButton.Text = "Co-ords"
coordsButton.TextColor3 = textColor
coordsButton.BackgroundColor3 = buttonColor
coordsButton.BorderSizePixel = 0
coordsButton.Font = Enum.Font.SourceSansBold
coordsButton.TextSize = 16
coordsButton.Parent = sectionFrame

-- Create the extra button
local extraButton = Instance.new("TextButton")
extraButton.Name = "ExtraButton"
extraButton.Size = UDim2.new(0.8, 0, 0, 40)
extraButton.Position = UDim2.new(0.1, 0, 0.7, 0)
extraButton.Text = "Extra"
extraButton.TextColor3 = textColor
extraButton.BackgroundColor3 = buttonColor
extraButton.BorderSizePixel = 0
extraButton.Font = Enum.Font.SourceSansBold
extraButton.TextSize = 16
extraButton.Parent = sectionFrame

-- Create the minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -35, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = textColor
minimizeButton.BackgroundColor3 = buttonColor
minimizeButton.BorderSizePixel = 0
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 18
minimizeButton.Parent = titleLabel

-- Function to animate the GUI
local function animateGui(targetPosition)
    -- Create the TweenInfo for the animation
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- Create the tween
    local tween = game:GetService("TweenService"):Create(backgroundFrame, tweenInfo, { Position = targetPosition })

    -- Play the tween
    tween:Play()
end

-- Connect the button click events (you can add your desired functionality)
teleportsButton.MouseButton1Click:Connect(function()
    print("Teleports button clicked!")
end)

walkJumpButton.MouseButton1Click:Connect(function()
    print("Walk + Jump button clicked!")
end)

coordsButton.MouseButton1Click:Connect(function()
    print("Co-ords button clicked!")
end)

extraButton.MouseButton1Click:Connect(function()
    print("Extra button clicked!")
end)

-- Connect the minimize button click event
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        -- Maximize the GUI
        animateGui(UDim2.new(0.5, -150, 1, -400))
        minimizeButton.Text = "-"
    else
        -- Minimize the GUI
        animateGui(UDim2.new(0.5, -150, 1, -30))
        minimizeButton.Text = "+"
    end

    isMinimized = not isMinimized
end)

-- Play the GUI animation
animateGui(UDim2.new(0.5, -150, 0.5, -200))
