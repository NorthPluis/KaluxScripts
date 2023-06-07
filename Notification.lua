-- Create the main GUI
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "Notification GUI"
mainGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Define the colors
local backgroundColor = Color3.fromRGB(34, 34, 34)
local textColor = Color3.fromRGB(255, 255, 255)

-- Create the background frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(0, 300, 0, 200)
backgroundFrame.Position = UDim2.new(0.5, -150, 1, -200)
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

-- Create the credits section
local creditsSection = Instance.new("TextLabel")
creditsSection.Name = "CreditsSection"
creditsSection.Size = UDim2.new(1, 0, 0, 30)
creditsSection.Position = UDim2.new(0, 0, 0, 40)
creditsSection.Text = "Credits"
creditsSection.TextColor3 = textColor
creditsSection.BackgroundColor3 = backgroundColor
creditsSection.BorderSizePixel = 0
creditsSection.Font = Enum.Font.SourceSansBold
creditsSection.TextSize = 16
creditsSection.Parent = backgroundFrame

-- Create the dev text
local devText = Instance.new("TextLabel")
devText.Name = "DevText"
devText.Size = UDim2.new(1, 0, 0, 20)
devText.Position = UDim2.new(0, 0, 0, 70)
devText.Text = "Dev: Kalux"
devText.TextColor3 = textColor
devText.BackgroundColor3 = backgroundColor
devText.BorderSizePixel = 0
devText.Font = Enum.Font.SourceSans
devText.TextSize = 14
devText.Parent = backgroundFrame

-- Create the scripter text
local scripterText = Instance.new("TextLabel")
scripterText.Name = "ScripterText"
scripterText.Size = UDim2.new(1, 0, 0, 20)
scripterText.Position = UDim2.new(0, 0, 0, 90)
scripterText.Text = "Scripter: ChatGPT"
scripterText.TextColor3 = textColor
scripterText.BackgroundColor3 = backgroundColor
scripterText.BorderSizePixel = 0
scripterText.Font = Enum.Font.SourceSans
scripterText.TextSize = 14
scripterText.Parent = backgroundFrame

-- Create the load scripts button
local loadScriptsButton = Instance.new("TextButton")
loadScriptsButton.Name = "LoadScriptsButton"
loadScriptsButton.Size = UDim2.new(0.4, -15, 0, 30)
loadScriptsButton.Position = UDim2.new(0.1, 0, 0.7, -20)
loadScriptsButton.Text = "Load Scripts"
loadScriptsButton.TextColor3 = textColor
loadScriptsButton.BackgroundColor3 = backgroundColor
loadScriptsButton.BorderSizePixel = 0
loadScriptsButton.Font = Enum.Font.SourceSansBold
loadScriptsButton.TextSize = 16
loadScriptsButton.Parent = backgroundFrame

-- Create the don't load scripts button
local dontLoadScriptsButton = Instance.new("TextButton")
dontLoadScriptsButton.Name = "DontLoadScriptsButton"
dontLoadScriptsButton.Size = UDim2.new(0.4, -15, 0, 30)
dontLoadScriptsButton.Position = UDim2.new(0.5, 0, 0.7, -20)
dontLoadScriptsButton.Text = "Don't Load Scripts"
dontLoadScriptsButton.TextColor3 = textColor
dontLoadScriptsButton.BackgroundColor3 = backgroundColor
dontLoadScriptsButton.BorderSizePixel = 0
dontLoadScriptsButton.Font = Enum.Font.SourceSansBold
dontLoadScriptsButton.TextSize = 16
dontLoadScriptsButton.Parent = backgroundFrame

-- Function to animate the GUI
local function animateGui()
    -- Calculate the target position
    local targetPosition = UDim2.new(0.5, -150, 0.5, -100)

    -- Create the TweenInfo for the animation
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- Create the tween
    local tween = game:GetService("TweenService"):Create(backgroundFrame, tweenInfo, { Position = targetPosition })

    -- Play the tween
    tween:Play()
end

-- Function to handle the load scripts button click
local function loadScriptsButtonClicked()
    -- Calculate the target position
    local targetPosition = UDim2.new(0.5, -150, 1, -200)

    -- Create the TweenInfo for the animation
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- Create the tween
    local tween = game:GetService("TweenService"):Create(backgroundFrame, tweenInfo, { Position = targetPosition })

    -- Play the tween
    tween:Play()

    -- Wait for the tween to complete
    tween.Completed:Wait()

    -- Destroy the GUI
    mainGui:Destroy()
end

-- Function to handle the don't load scripts button click
local function dontLoadScriptsButtonClicked()
    -- Calculate the target position
    local targetPosition = UDim2.new(0.5, -150, 1, -200)

    -- Create the TweenInfo for the animation
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- Create the tween
    local tween = game:GetService("TweenService"):Create(backgroundFrame, tweenInfo, { Position = targetPosition })

    -- Play the tween
    tween:Play()

    -- Wait for the tween to complete
    tween.Completed:Wait()

    -- Destroy the GUI
    mainGui:Destroy()
end

-- Connect the button click events
loadScriptsButton.MouseButton1Click:Connect(loadScriptsButtonClicked)
dontLoadScriptsButton.MouseButton1Click:Connect(dontLoadScriptsButtonClicked)

-- Play the GUI animation
animateGui()
