--[[get items function (creates 2 separate tables for click detector items and non cd items)]]

updateitems = function()
  itemstable = {}
  itemstable2 = {}
  for i,v in next,game.Workspace:GetChildren() do
     if tostring(tonumber(v.Name)) == v.Name or v:IsA("Tool") then
        for i1,v1 in next,v:GetChildren() do
           if table.find(clickdetitems,v1.Name) and not(v1:IsA("Tool")) then
                  for i2,v2 in next,v1:GetDescendants() do
                     if v2.Name == 'ClickDetector' then
                        table.insert(itemstable2,v2)
                        print("NIGGA")
                     end
              	end
           else
             pcall(function()
                   for fat,bastard in next,v1:GetChildren() do
                      if bastard.CFrame ~= nil then
                         table.insert(itemstable,bastard)
                         break
                      end
                  end
              end)
           end
        end
     end
  end
  return itemstable,itemstable2;
end

--[[tween tp functions]]

local function ChangePosition(Pos)
    local Tween = game:GetService("TweenService");
    local HumanoidRoot = game.Players.LocalPlayer.Character.HumanoidRootPart;
    local Info = TweenInfo.new((HumanoidRoot.CFrame.Position - Pos.Position).magnitude/300, Enum.EasingStyle.Linear);    
    local Main = Tween:Create(HumanoidRoot,Info,{CFrame = Pos})    
    Main:Play()  
    return Main
end

local gotoitem = function(tablec)
   for i4,v4 in next,tablec do
      game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
      if game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 and getgenv().workoire then
         if v4.Name == 'ClickDetector' then
            ChangePosition(v4.Parent.CFrame).Completed:Wait()
            Wait(.5)
            fireclickdetector(v4)
         else
            ChangePosition(v4.CFrame).Completed:Wait()
         end
      end
   end
end

--[[invis function]]

local charactoire = function()
     game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
     local tween = game:GetService("TweenService")
     local plp = game.Players.LocalPlayer.Character.HumanoidRootPart
     local Pos1 = plp.CFrame - Vector3.new(0,20,0)
     local Info = TweenInfo.new((plp.CFrame.Position - Pos1.Position).magnitude/320, Enum.EasingStyle.Linear);
     local cbt = tween:Create(plp,Info,{CFrame = Pos1})
     cbt:Play()
     cbt.Completed:Wait()
     Wait(.5)
     if game.Players.LocalPlayer.Character:FindFirstChild('LowerTorso') then
         local cock = game.Players.LocalPlayer.Character.LowerTorso.Root:Clone()
         game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
         cock.Parent = game.Players.LocalPlayer.Character.LowerTorso
     end
end

--[[noclip]]

game.RunService.Stepped:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild('Humanoid');
    if Humanoid and getgenv().workoire then
        Humanoid:ChangeState(11);
    end;
end);

--[[invis on execute]]

if getgenv().workoire then
 charactoire()
end

--[[anti-afk]]

local bcam = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    bcam:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    Wait(2)
    bcam:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

--[[invis on respawn]]

game.Players.LocalPlayer.CharacterAdded:Connect(function()
   if getgenv().workoire then
      Wait(.5)
      charactoire()
   end
end)

--[[main loop]]

while getgenv().workoire do Wait(.1)
   local tbl,tblsec = updateitems()
   if #tblsec ~= 0 then
      gotoitem(tblsec)
   else
      gotoitem(tbl)
   end
end
