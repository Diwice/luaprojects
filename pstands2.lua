local npcs = {
    ["Boxing Lesson"] = "Boxer",
    ["Thug Patrol"] = "Thug",
    ["Anti Cop"] = "Cop",
    ["Monkey Slaying"] = "Monkey"
}

local Target1 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["Quests.Accept"]
local Target2 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["ControlsHandler.Ability 3"]
local Target3 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["ControlsHandler.Summon"]
local Target4 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["ControlsHandler.Ability 2"]
local Target5 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["ControlsHandler.Ability 4"]
local Target6 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["ControlsHandler.Combat"]
local Target7 = game:GetService("ReplicatedStorage").Rex.RemoteFunctions['Quests.Abandon']

local skillt = {
  ['F'] = 3;
  ['R'] = 2;
  ['T'] = 4;
  ['Click'] = 6;
}
local usktu = {}
local skill2 = false
local skill3 = false
local skill4 = false
local skill6 = false
local cd2 = false
local cd3 = false
local cd4 = false

local uskt = string.split(usks,',')
for i,v in pairs(skillt) do 
    for i1,v1 in ipairs(uskt) do 
        if i == v1 then
            table.insert(usktu,v)
        end 
    end 
end 

for i,v in pairs(usktu) do 
    if v == 2 then
        skill2 = true 
    elseif v == 3 then
        skill3 = true 
    elseif v == 4 then
        skill4 = true 
    elseif v == 6 then
        skill6 = true
    end
end

local ugol = 0
if heigh1 < 0 then
    ugol = math.rad(90)
elseif heigh1 > 0 then
    ugol = math.rad(-90)
elseif heigh1 == 0 then
    ugol = 0
end

if questab == true then
    for i = 1,questoq do
        Target7:InvokeServer(i)
    end 
end 

game:GetService("RunService").Heartbeat:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end)

local bcam = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   bcam:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(2)
   bcam:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

while _G.poop do wait()
    
    if game.Players.LocalPlayer.Character:FindFirstChild("Stand") == nil then
        Target3:InvokeServer(CFrame.new(0,0,0))
    elseif game.Players.LocalPlayer.PlayerGui.MainGui.Quests.QuestList:FindFirstChild("1") == nil then
        for i = 1, questoq do
                Target1:InvokeServer(questshit)
        end 
    end
    
    local npch = game.Workspace.Entities[npcs[questshit]].Humanoid.Health
    if game.Workspace.Entities:FindFirstChild(npcs[questshit]) ~= nil then
        while npch > 0 and _G.poop do wait(.2)
            local npccfr = game.Workspace.Entities[npcs[questshit]].HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npccfr * CFrame.new(0, heigh1, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(ugol,0,0)
            if skill6 == true then
                Target6:InvokeServer(CFrame.new(0,0,0))
            end
            if skill3 == true and not cd3 then
                Target2:InvokeServer(CFrame.new(0,0,0))
                cd3 = true
                spawn(function()
                    wait(5)
                    cd3 = false
                end)
            end
            if skill2 == true and not cd2 then
                Target4:InvokeServer(CFrame.new(0,0,0))
                cd2 = true
                spawn(function()
                    wait(5)
                    cd2 = false
                end)
            end
            if skill4 == true and not cd4 then
                Target5:InvokeServer(CFrame.new(0,0,0))
                cd4 = true
                spawn(function()
                    wait(5)
                    cd4 = false
                end)
            end
        end
    end
end
