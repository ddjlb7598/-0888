game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "迪脚本",
  Text = "欢迎使用迪脚本",
  Duration = 1,
  Callback = bindable,
  Button1 = "脚本功能多多",
  Button2 = "感谢您的使用",
})
wait(1.5)
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "迪脚本",
  Text = "迪脚本更新日期12月6日修复问题 本来想搞成检测服务器ID的 后面还是因为麻烦 就不搞了",
  Icon = "rbxassetid://73219704811084",
  Duration = 1,
  Callback = bindable,
  Button2 = "请勿倒卖",
})
wait(1.5)
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "迪脚本",
  Text = "每周都会缝合",
  Duration = 2,
  Callback = bindable,
  Button1 = "祝您使用愉快",
  Button2 = "玩的开心",
})
wait(1.5)
local VirtualUserService = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
  
  VirtualUserService:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
  wait(1)
  VirtualUserService:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "迪脚本",
  Text = "未开启反挂机",
  Duration = 2,
  Callback = bindable,
  Button1 = "开启成功",
  Button2 = "谢谢使用",
})
local RevenantLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
RevenantLib.DefaultColor = Color3.fromRGB(255, 0, 0)
RevenantLib:Notification({
  Text = "迪脚本作者赠予: 自制\u{e000}",
  Duration = 20,
})
wait(1)
RevenantLib:Notification({
  Text = "迪脚本帮助者:😂 没有\u{e000}",
  Duration = 20,
})
wait(1)
RevenantLib:Notification({
  Text = "谢谢支持^ω^",
  Duration = 6,
})
local PlayerConfig = {
  playernamedied = "",
  dropdown = {},
  LoopTeleport = false,
  message = "",
  sayCount = 1,
  sayFast = false,
  autoSay = false,
}
local MovementConfig = {
  tpwalkslow = 0,
  tpwalkmobile = 0,
  tpwalkquick = 0,
  tpwalkslowenable = false,
  tpwalkmobileenable = false,
  tpwalkquickenable = false,
  spinspeed = 0,
  HitboxStatue = false,
  HitboxSize = 0,
  HitboxTransparency = 1,
  HitboxBrickColor = "Really red",
  DefaultFPS = 60,
  CurrentFPS = 60,
  FPSLocked = false,
  FPSVisible = false,
}
local ColorConfig = {
  ['红色']= Color3.fromRGB(255, 0, 0),
  ['蓝色'] = Color3.fromRGB(0, 0, 255),
  ['黄色'] = Color3.fromRGB(255, 255, 0),
  ['绿色'] = Color3.fromRGB(0, 255, 0),
  ['青色'] = Color3.fromRGB(0, 255, 255),
  ['橙色'] = Color3.fromRGB(255, 165, 0),
  ['紫色'] = Color3.fromRGB(128, 0, 128),
  ['白色'] = Color3.fromRGB(255, 255, 255),
  ['黑色'] = Color3.fromRGB(0, 0, 0),
}
local AimConfig = {
  fovsize = 50,
  fovlookAt = false,
  fovcolor = Color3.fromRGB(0, 255, 0),
  fovthickness = 2,
  Visible = false,
  distance = 200,
  ViewportSize = 2,
  Transparency = 5,
  Position = "Head",
  teamCheck = false,
  wallCheck = false,
  aliveCheck = false,
  prejudgingselfsighting = false,
  prejudgingselfsightingdistance = 100,
  smoothness = 5,
  aimSpeed = 5,
  targetLock = false,
  hitMarker = false,
  dynamicFOV = false,
  dynamicFOVScale = 1.5,
  priorityMode = "Smart",
  aimMode = "AI",
  autoFire = false,
  fireRate = 10,
  bulletDelay = 0.1,
  weaponSwitch = false,
  threatPriority = false,
  healthPriority = false,
}
local BodyPartMap = {
  ['头部'] = "Head",
  ['脖子'] = "HumanoidRootPart",
  ['躯干'] = "Torso",
  ['左臂'] = "Left Arm",
  ['右臂'] = "Right Arm",
  ['左腿'] = "Left Leg",
  ['右腿'] = "Right Leg",
  ['左手'] = "LeftHand",
  ['右手'] = "RightHand",
  ['左小臂'] = "LeftLowerArm",
  ['右小臂'] = "RightLowerArm",
  ['左大臂'] = "LeftUpperArm",
  ['右大臂'] = "RightUpperArm",
  ['左脚'] = "LeftFoot",
  ['左小腿'] = "LeftLowerLeg",
  ['上半身'] = "UpperTorso",
  ['左大腿'] = "LeftUpperLeg",
  ['右脚'] = "RightFoot",
  ['右小腿'] = "RightLowerLeg",
  ['下半身'] = "LowerTorso",
  ['右大腿'] = "RightUpperLeg",
}
function shuaxinlb(includeSelf)
  
  PlayerConfig.dropdown = {}
  if includeSelf == true then
    for _, player in pairs(game.Players:GetPlayers()) do
      table.insert(PlayerConfig.dropdown, player.Name)
    end
  else
    local localPlayer = game.Players.LocalPlayer
    for _, player in pairs(game.Players:GetPlayers()) do
      if player ~= localPlayer then
        table.insert(PlayerConfig.dropdown, player.Name)
      end
    end
  end
end
shuaxinlb(true)
function Notify(title, text, icon, duration)
  
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = title,
    Text = text,
    Icon = icon,
    Duration = duration,
  })
end
local function SafeCall(func, ...)
  
  local success, result = pcall(func, ...)
  if not success then
    return nil
  end
  return result
end
local FOVCircle = nil
local FOVLine1 = nil
local FOVLine2 = nil
local function InitFOV(radius, color, thickness, transparency)
  
  local RunService = game:GetService("RunService")
  local UserInputService = game:GetService("UserInputService")
  local Players = game:GetService("Players")
  local Camera = game.Workspace.CurrentCamera
  if FOVCircle then
    FOVCircle:Remove()
    FOVCircle = nil
  end
  FOVCircle = Drawing.new("Circle")
  FOVCircle.Visible = true
  FOVCircle.Thickness = thickness
  FOVCircle.Color = color
  FOVCircle.Filled = false
  FOVCircle.Radius = radius
  FOVCircle.Position = Camera.ViewportSize / 2
  FOVCircle.Transparency = transparency
  FOVLine1 = Drawing.new("Line")
  FOVLine1.Visible = false
  FOVLine1.Thickness = 2
  FOVLine1.Color = Color3.fromRGB(255, 0, 0)
  FOVLine1.Transparency = 1
  FOVLine2 = Drawing.new("Line")
  FOVLine2.Visible = true
  FOVLine2.Thickness = 1
  FOVLine2.Color = Color3.fromRGB(255, 255, 255)
  FOVLine2.Transparency = 1
  local function UpdateFOVDisplay()
    
    local viewportSize = Camera.ViewportSize
    FOVCircle.Position = viewportSize / 2
    if AimConfig.dynamicFOV then
      FOVCircle.Radius = AimConfig.fovsize * AimConfig.dynamicFOVScale
    else
      FOVCircle.Radius = AimConfig.fovsize
    end
    FOVLine2.From = Vector2.new(viewportSize.X / 2 - 5, viewportSize.Y / 2)
    FOVLine2.To = Vector2.new(viewportSize.X / 2 + 5, viewportSize.Y / 2)
    FOVLine2.From = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 - 5)
    FOVLine2.To = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 + 5)
  end
  UserInputService.InputBegan:Connect(function(input)
    
    if input.KeyCode == Enum.KeyCode.Delete then
      RunService:UnbindFromRenderStep("FOVUpdate")
      FOVCircle:Remove()
      FOVCircle = nil
      FOVLine1:Remove()
      FOVLine1 = nil
      FOVLine2:Remove()
      FOVLine2 = nil
    end
  end)
  RunService.RenderStepped:Connect(function()
    
    UpdateFOVDisplay()
  end)
end
local function CleanupFOV()
  
  if FOVCircle then
    FOVCircle:Remove()
    FOVCircle = nil
  end
  if FOVLine1 then
    FOVLine1:Remove()
    FOVLine1 = nil
  end
  if FOVLine2 then
    FOVLine2:Remove()
    FOVLine2 = nil
  end
end
local function UpdateFOVSettings()
  
  if FOVCircle then
    FOVCircle.Thickness = AimConfig.fovthickness
    FOVCircle.Radius = AimConfig.fovsize
    FOVCircle.Color = AimConfig.fovcolor
    FOVCircle.Transparency = AimConfig.Transparency / 10
  end
end
local function IsSameTeam(player)
  
  return player.Tea