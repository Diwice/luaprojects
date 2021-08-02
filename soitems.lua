local clickdetitems = {'Mask','Ceasers'}

updateitems = function()
  itemstable = {}
  itemstable2 = {}
  for i,v in next,game.Workspace:GetChildren() do
     if tostring(tonumber(v.Name)) == v.Name or v:IsA("Tool") then
        local check = true
        for i1,v1 in next,v:GetDescendants() do
           if table.find(clickdetitems,v1.Name) then
                  for i2,v2 in next,v1:GetChildren() do
                     if v.Name == 'ClickDetector' then
                        table.insert(itemstable2,v2)
                     end
              	end
              break
           else
             pcall(function()
                if v1.CFrame ~= nil and (check) then
                   table.insert(itemstable,v1)
                   check = false
                end
             end)
           end
        end
    end
  end
  return itemstable,itemstable2;
end

gotoitem = function(tablec)
   for i,v in next,tablec do
      if getgenv().workoire and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
        local tween = game:GetService("TweenService")
        local plp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local trigger = false
        if v.Name == 'ClickDetector' then
          Pos = v.Parent.CFrame
          trigger = true
        else
          Pos = v.CFrame
        end
        local Info = TweenInfo.new((plp.CFrame.Position - Pos.Position).magnitude/300, Enum.EasingStyle.Linear);
        local cbt = tween:Create(plp,Info,{CFrame = Pos})
        cbt:Play()
        cbt.Completed:Wait()
        if trigger then
           Wait(.4)
           fireclickdetector(v)
        end
     end
  end
end

local charactoire = function()
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
     Wait(.5)
     local Pos1 =  plp.CFrame - Vector3.new(0,-20,0)
     local Info = TweenInfo.new((plp.CFrame.Position - Pos1.Position).magnitude/320, Enum.EasingStyle.Linear);
     local cbt = tween:Create(plp,Info,{CFrame = Pos1})
     cbt:Play()
end

game.RunService.Stepped:Connect(function()
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild('Humanoid');
    if Humanoid and getgenv().workoire then
        Humanoid:ChangeState(11);
    end;
end);

if getgenv().workoire then
 charactoire()
end

local bcam = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    bcam:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    Wait(2)
    bcam:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
   Wait(.5)
   charactoire()
end)

while getgenv().workoire do Wait(.1)
   local tbl,tblsec = updateitems()
   if #tblsec ~= 0 then
      gotoitem(tblsec)
   else
      gotoitem(tbl)
   end
end
