local function disable_all_cheats()
	cheatlist = {}
	for category_name, category in pairs(minetest.cheats) do
		for cheat_name, cheat in pairs(category) do
			local to_disable = minetest.cheats[category_name][cheat_name]
			if type(to_disable) == "string" then core.settings:set(to_disable, "false") end
		end
	end
end

minetest.register_chatcommand("panic", {
	description = "Disable all active cheats",
	
	func = function()
		disable_all_cheats()
	end,
})
