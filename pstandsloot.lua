local waitcr = function()
    return game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Selection:FindFirstChild('ItemTemplate')
end

local showitems = function()
    if waitcr() ~= nil then
    	local desc = game.Players.LocalPlayer.PlayerGui.Lootcrate.Frame.Selection
    	for i, v in pairs(desc:GetDescendants()) do
    		if v.Name == 'Id' or v.Name == 'Quantity' or v.Name == 'ItemRank' then
    			v.Visible = true
    		elseif v.Name == 'Locked' then
    			v.Visible = false
    		end
    	end
    end
end

while _G.vkl do 
    showitems()
    wait(3)
end
