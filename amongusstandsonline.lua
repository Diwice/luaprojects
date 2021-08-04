getgenv().isenabled = false
getgenv().invischeck = false
local manoire = game:GetService("UserInputService")

local invis = function()
     getgenv().invischeck = true
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

     if (getgenv().hidestand) and game.Players.LocalPlayer.Character:FindFirstChild("Stand") then
        if game.Players.LocalPlayer.Character.Stand:FindFirstChild('LowerTorso') then
           local cock = game.Players.LocalPlayer.Character.Stand.LowerTorso.Root:Clone()
           game.Players.LocalPlayer.Character.Stand.LowerTorso.Root:Destroy()
           cock.Parent = game.Players.LocalPlayer.Character.Stand.LowerTorso
        end
     end

     if (getgenv().hidestandname) and game.Players.LocalPlayer.Character:FindFirstChild("Stand") and game.Players.LocalPlayer.Character.Stand.Head:FindFirstChild("Name2") then
        local cock = game.Players.LocalPlayer.Character.Stand.Head.Name2.T:Clone()
        game.Players.LocalPlayer.Character.Stand.Head.Name2.T:Destroy()
        cock.Parent = game.Players.LocalPlayer.Character.Stand.Head.Name2
     end

     local Pos1 = plp.CFrame - Vector3.new(0,-20,0)
     local Info = TweenInfo.new((plp.CFrame.Position - Pos1.Position).magnitude/320, Enum.EasingStyle.Linear);
     local cbt = tween:Create(plp,Info,{CFrame = Pos1})
     cbt:Play()
     Wait(.5)
     getgenv().invischeck = false
end

game.RunService.Stepped:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild('Humanoid');
    if Humanoid and getgenv().invischeck then
        Humanoid:ChangeState(11)
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
   getgenv().isenabled = false
end)

manoire.InputBegan:Connect(function(Key)
   if Key.KeyCode == Enum.KeyCode.F6 and not(getgenv().isenabled) then
      invis()
      getgenv().isenabled = true
   elseif getgenv().isenabled and Key.KeyCode == Enum.KeyCode.F6 then
      game.StarterGui:SetCore("SendNotification", {
      Title = "   Invisibility";
      Text = "Is already enabled";
      Icon = "rbxassetid://000000"; 
      Duration = 5;
      })
   end
end)
