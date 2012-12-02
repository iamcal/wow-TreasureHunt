TreasureHunt = {};

-- ############################# Slash Commands #############################

SLASH_TREASUREHUNT1 = '/th';
SLASH_TREASUREHUNT2 = '/treasurehunt';

function SlashCmdList.TREASUREHUNT(msg, editBox)

	local map = {
		{ zone = "Jade Forest",			name = "Ancient Jinyu Staff",			flag_id = 31402 },
		{ zone = "Jade Forest",			name = "Ancient Pandaren Mining Pick",		flag_id = 31399 },
		{ zone = "Jade Forest",			name = "Hammer of Ten Thunders",		flag_id = 31403 },
		{ zone = "Jade Forest",			name = "Jade Infused Blade",			flag_id = 31307 },
		{ zone = "Jade Forest",			name = "Wodin's Mantid Shanker",		flag_id = 31397 },

		{ zone = "Valley of the Four Winds",	name = "Ancient Pandaren Fishing Charm",	flag_id = 31284 },
		{ zone = "Valley of the Four Winds",	name = "Ancient Pandaren Woodcutter",		flag_id = 31292 },
		{ zone = "Valley of the Four Winds",	name = "Cache of Pilfered Goods",		flag_id = 31406 },
		{ zone = "Valley of the Four Winds",	name = "Staff of the Hidden Master",		flag_id = 31407 },

		{ zone = "Krasarang Wilds",		name = "Equipment Locker",			flag_id = 31410 },
		{ zone = "Krasarang Wilds",		name = "Pandaren Fishing Spear",		flag_id = 31409 },
		{ zone = "Krasarang Wilds",		name = "Recipe: Banana Infused Rum",		flag_id = 31411 },

		{ zone = "Kun-Lai Summit",		name = "Hozen Warrior Spear",			flag_id = 31413 },
		{ zone = "Kun-Lai Summit",		name = "Kafa Press",				flag_id = 31304 },
		{ zone = "Kun-Lai Summit",		name = "Sprites Cloth Chest",			flag_id = 31412 },
		{ zone = "Kun-Lai Summit",		name = "Stash of Yaungol Weapons",		flag_id = 31421 },
		{ zone = "Kun-Lai Summit",		name = "Tablet of Ren Yu",			flag_id = 31417 },

		{ zone = "Townlong Steppes",		name = "Yaungol Fire Carrier",			flag_id = 31425 },

		{ zone = "Dread Wastes",		name = "Blade of the Poisoned Mind",		flag_id = 31438 },
		{ zone = "Dread Wastes",		name = "Blade of the Prime",			flag_id = 31433 },
		{ zone = "Dread Wastes",		name = "Bloodsoaked Chitin Fragment",		flag_id = 31436 },
		{ zone = "Dread Wastes",		name = "Dissector's Staff of Mutation",		flag_id = 31435 },
		{ zone = "Dread Wastes",		name = "Lucid Amulet of the Agile Mind",	flag_id = 31431 },
		{ zone = "Dread Wastes",		name = "Malik's Stalwart Spear",		flag_id = 31430 },
		{ zone = "Dread Wastes",		name = "Manipulator's Talisman",		flag_id = 31432 },
		{ zone = "Dread Wastes",		name = "Swarming Cleaver of Ka'roz",		flag_id = 31434 },
		{ zone = "Dread Wastes",		name = "Swarmkeeper's Medallion",		flag_id = 31437 },
		{ zone = "Dread Wastes",		name = "Wind-Reaver's Dagger of Quick Strikes",	flag_id = 31666 },
	};


	-- get state

	local i,v;

	for i,v in ipairs(map) do
		map[i].got = IsQuestFlaggedCompleted(v.flag_id);
	end


	-- get zone list

	local zone_nums = {};
	local zone_gots = {};

	for i,v in ipairs(map) do

		zone_nums[v.zone] = (zone_nums[v.zone] or 0) + 1;

		if (map[i].got) then

			zone_gots[v.zone] = (zone_gots[v.zone] or 0) + 1;
		end
	end


	-- output

	for i,v in pairs(zone_nums) do

		local num = zone_nums[i];
		local got = zone_gots[i] or 0;

		print(string.format("%s: %d/%d", i, got, num));

		local j,k

		for j,k in ipairs(map) do

			if (k.zone == i) then

				local color = 'FF0000';
				if (k.got) then
					color = '00FF00';
				end

				if ((not k.got) or (msg == 'all')) then
					print(string.format("|cFF%s    %s|r", color, k.name));
				end
			end
		end
	end
end
