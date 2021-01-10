local waitcr = function()
    return game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Selection:FindFirstChild('ItemTemplate')
end

prioritytab = string.split(itemp,',')
priority = 1

local crtuse = function(...)
    local inventory = game.Players.LocalPlayer.PlayerGui.MainGui.Inventory.ScrollingFrame
    for i,v in next,inventory:GetChildren() do
        if v.Name == choosencrate then
            local kapusta = {
                ["Id"] = choosencrate;
                ["Quantity"] = tonumber(v.ViewportFrame.Quantity.Text:match('%d+'));
            }
            local Target = game:GetService("ReplicatedStorage").Rex.RemoteFunctions["InventoryHandler.Use"]
            Target:InvokeServer(kapusta)
        end 
    end
end

local maxqu = function()
    local desc = game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Selection
    local maxquan = 0
    for i, v in pairs(desc:GetChildren()) do
        if v:IsA("Frame") and v.Name == 'ItemTemplate' then
            for i1,v1 in pairs(v:GetChildren()) do 
                if v1.Name == 'Id' and v1.Text == prioritytab[priority] then
                    currentquan = tonumber(v1.Parent.Quantity.Text:match('%d+'))
                    if currentquan > maxquan then 
                        maxquan = currentquan
                    end
                end 
            end
        end
    end
    return maxquan
end
    	
local opener = function()
    if waitcr() ~= nil then
    	local desc = game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Selection
    	local sobl = 0
        local sobl2 = 0
    	for i, v in pairs(desc:GetChildren()) do
            if v:IsA("Frame") and v.Name == 'ItemTemplate' then
                for i1,v1 in next,v:GetChildren() do
                    if v1.Name == "Id" and tonumber(v1.Parent.Quantity.Text:match('%d+')) == maxqu() and v1.Text == prioritytab[priority] then
                        firesignal(v.TextButton.Activated)
                    end
                    if v1.Name == "Id" then
                        sobl = sobl + 1
                    end
                end
                for i2,v2 in next,v:GetChildren() do
                    if v2.Name == "Id" and tonumber(v2.Parent.Quantity.Text:match('%d+')) ~= maxqu() and v2.Text == prioritytab[priority] then
                        firesignal(v.TextButton.Activated)
                    end
                    if v2.Name == "Id" then
                        sobl2 = sobl2 + 1
                    end
                end
            end
    	end
    	priority = priority + 1
    end
end

local waitforcloser = function()
    local closed = game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Close
    while closed.Parent.Visible == true and closed.Visible == false do 
        wait(.3)
    end
end

local closer = function()
    local desc = game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame
    for i, v in pairs(desc:GetChildren()) do
        if v.Name == 'Close' then
            firesignal(v.Activated)
        end 
    end 
end 

while _G.pooproller do wait()
    crtuse()
    for i = 1,#prioritytab do 
        opener()
        wait(.1)
    end
    priority = 1
    waitforcloser()
    closer()
    wait(.3)
end
