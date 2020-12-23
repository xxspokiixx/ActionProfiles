TellMeWhenDB = {
	["global"] = {
		["TextLayouts"] = {
			["bar2"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
			["TMW:textlayout:1TMvg5InaYOw"] = {
				{
					["Anchors"] = {
						{
							["y"] = -1.5,
							["x"] = 1.5,
							["point"] = "TOPLEFT",
							["relativePoint"] = "TOPLEFT",
						}, -- [1]
					},
					["DefaultText"] = "[ActionBurst]",
					["Size"] = 6,
				}, -- [1]
				{
					["Anchors"] = {
						{
							["y"] = 1,
							["x"] = 0.5,
							["point"] = "BOTTOMRIGHT",
							["relativePoint"] = "BOTTOMRIGHT",
						}, -- [1]
					},
					["Name"] = "Morpheus",
					["DefaultText"] = "[ActionAoE]",
					["Size"] = 6,
				}, -- [2]
				{
					["Anchors"] = {
						{
							["y"] = 1,
							["x"] = 1.5,
							["point"] = "BOTTOMLEFT",
							["relativePoint"] = "BOTTOMLEFT",
						}, -- [1]
					},
					["Name"] = "Morpheus",
					["DefaultText"] = "[ActionMode]",
					["Size"] = 6,
				}, -- [3]
				["GUID"] = "TMW:textlayout:1TMvg5InaYOw",
				["Name"] = "ActionLayout",
				["n"] = 3,
			},
			["TMW:textlayout:1RkGJEN4L5o_"] = {
				{
					["SkinAs"] = "HotKey",
					["Anchors"] = {
						{
							["y"] = -2,
							["x"] = -2,
							["point"] = "TOPLEFT",
							["relativePoint"] = "TOPLEFT",
						}, -- [1]
						{
							["y"] = -2,
							["x"] = -2,
							["point"] = "TOPRIGHT",
							["relativePoint"] = "TOPRIGHT",
						}, -- [2]
						["n"] = 2,
					},
					["StringName"] = "Привязка/Ярлык",
					["Height"] = 1,
				}, -- [1]
				{
					["SkinAs"] = "Count",
					["Anchors"] = {
						{
							["y"] = 2,
							["x"] = 50.7,
							["point"] = "RIGHT",
							["relativePoint"] = "RIGHT",
						}, -- [1]
					},
					["StringName"] = "Стаки",
					["DefaultText"] = "[Stacks:Hide(0)]",
				}, -- [2]
				["GUID"] = "TMW:textlayout:1RkGJEN4L5o_",
				["Name"] = "UserInterface_DefaultText_RightSide",
				["n"] = 2,
			},
			["icon1"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
			["TMW:textlayout:1RFt2HZe_Cbk"] = {
				{
					["Outline"] = "OUTLINE",
					["Shadow"] = 0.9,
					["Anchors"] = {
						{
							["point"] = "BOTTOM",
							["relativePoint"] = "BOTTOM",
						}, -- [1]
					},
					["Size"] = 8,
				}, -- [1]
				["GUID"] = "TMW:textlayout:1RFt2HZe_Cbk",
				["Name"] = "UserInterface_Text",
			},
			["TMW:textlayout:1S6ieoFev4r0"] = {
				{
					["Outline"] = "OUTLINE",
					["Shadow"] = 0.9,
					["Anchors"] = {
						{
							["y"] = 2,
							["point"] = "BOTTOM",
							["relativePoint"] = "BOTTOM",
						}, -- [1]
					},
					["Name"] = "AR ZhongkaiGBK Medium",
					["Size"] = 6,
				}, -- [1]
				["GUID"] = "TMW:textlayout:1S6ieoFev4r0",
				["Name"] = "UserInterface_SmallerText",
			},
			["TMW:textlayout:1Rh4g1a9S6Uf"] = {
				{
					["Outline"] = "OUTLINE",
					["Shadow"] = 0.9,
					["Anchors"] = {
						{
							["y"] = 58,
							["x"] = 12.2,
							["relativePoint"] = "RIGHT",
							["relativeTo"] = "IconModule_CooldownSweepCooldown",
						}, -- [1]
					},
					["Name"] = "Morpheus",
					["Rotate"] = 90,
					["Size"] = 35,
				}, -- [1]
				["GUID"] = "TMW:textlayout:1Rh4g1a9S6Uf",
				["Name"] = "UserInterface_TextVertical",
			},
		},
		["ShowGUIDs"] = true,
		["NumGroups"] = 5,
		["CodeSnippets"] = {
			{
				["Order"] = 0.6,
				["Name"] = "Custom stuff",
				["Code"] = "---------------------------------------------------\n-------------- CUSTOM STUFF FUNCTIONS -------------\n---------------------------------------------------\nlocal TMW                                   = TMW\nlocal _G, type, error, time                 = _G, type, error, time\nlocal A                                     = _G.Action\nlocal TeamCache                                = Action.TeamCache\nlocal EnemyTeam                                = Action.EnemyTeam\nlocal FriendlyTeam                            = Action.FriendlyTeam\nlocal LoC                                    = Action.LossOfControl\nlocal Player                                = Action.Player \nlocal MultiUnits                            = Action.MultiUnits\nlocal UnitCooldown                            = Action.UnitCooldown\nlocal ActiveUnitPlates                        = MultiUnits:GetActiveUnitPlates()\nlocal toStr                                 = A.toStr\nlocal toNum                                 = A.toNum\nlocal next, pairs, type, print              = next, pairs, type, print\nlocal IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo = IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo\nlocal UnitLevel, UnitPower, UnitPowerMax, UnitStagger, UnitAttackSpeed, UnitRangedDamage, UnitDamage, UnitAura = UnitLevel, UnitPower, UnitPowerMax, UnitStagger, UnitAttackSpeed, UnitRangedDamage, UnitDamage, UnitAura\nlocal UnitIsPlayer, UnitExists, UnitGUID    = UnitIsPlayer, UnitExists, UnitGUID\n--local Pet                                 = LibStub(\"PetLibrary\") Don't work. Too fast loading snippets ?\nlocal Unit                                  = Action.Unit \nlocal huge                                  = math.huge\nlocal UnitBuff                              = _G.UnitBuff\nlocal EventFrame                            = CreateFrame(\"Frame\", \"Taste_EventFrame\", UIParent)\nlocal UnitIsUnit                            = UnitIsUnit\nlocal StdUi                                 = Action.StdUi -- Custom StdUI with Action shared settings\n-- Lua methods\nlocal error                                 = error\nlocal setmetatable                             = setmetatable\nlocal stringformat                             = string.format\nlocal stringfind                            = string.find\nlocal stringsub                             = string.sub\nlocal tableinsert                             = table.insert\nlocal tableremove                            = table.remove \n-- Local Tables\nlocal Events = {} -- All Events\nlocal CombatEvents = {} -- Combat Log Unfiltered\nlocal SelfCombatEvents = {} -- Combat Log Unfiltered with SourceGUID == PlayerGUID filter\nlocal PetCombatEvents = {} -- Combat Log Unfiltered with SourceGUID == PetGUID filter\nlocal PrefixCombatEvents = {}\nlocal SuffixCombatEvents = {}\nlocal CombatLogPrefixes = {\n    \"ENVIRONMENTAL\",\n    \"RANGE\",\n    \"SPELL_BUILDING\",\n    \"SPELL_PERIODIC\",\n    \"SPELL\",\n    \"SWING\"\n}\nlocal CombatLogPrefixesCount = #CombatLogPrefixes\nlocal restoreDB = {}\nlocal overrideDB = {}\n-- Global TasteRotation Table\nAction.TasteRotation = {}\nlocal TR                                    = Action.TasteRotation\n-- Global Tables\nTR.Enum = {}\nTR.Lists = {}\nTR.storedTables = {}\n\n\n------------------------------------\n-- UI Toggles\n------------------------------------\n-- AoE Status on Main Icon\nfunction Action.AoEToggleMode()\n    Action.UseAoE = Action.GetToggle(2, \"AoE\")    \n    if Action.UseAoE == false then \n        Action.UseAoE = true\n    else\n        Action.UseAoE = false\n    end\n    Action.SetToggle({2, \"AoE\"})        \n    Action.Print(Action.UseAoE and \"Mode AoE: On\" or not Action.UseAoE and \"Mode AoE: Off\")\n    TMW:Fire(\"TMW_ACTION_AOE_MODE_CHANGED\")\nend \n\n------------------------------------\n--- Area Time To Die\n------------------------------------\n--@return current average AoE time to die \nfunction Player:AreaTTD(range)\n    local ttdtotal = 0\n    local totalunits = 0\n    local r = range\n    \n    for _, unitID in pairs(ActiveUnitPlates) do \n        if Unit(unitID):GetRange() <= r then \n            local ttd = Unit(unitID):TimeToDie()\n            totalunits = totalunits + 1\n            ttdtotal = ttd + ttdtotal\n        end\n    end\n    \n    if totalunits == 0 then\n        return 0\n    end\n    \n    return ttdtotal / totalunits\nend\n\n-----------------------------------\n-- Trinkets\n-----------------------------------\n-- List all BlackListed Trinkets we dont want to use on cooldown but with some specific APLs.\nlocal BlackListedTrinkets = {\n    \n    [1] = 168905, -- Shiver Venom Relic\n    [2] = 169314, -- Azsharas Font of Power\n    [3] = 169311, -- AshvanesRazorCoral\n    [4] = 174044, -- Humming Black Dragonscale\n    [5] = 158367, -- MerekthasFang\n    \n}\n\nfunction TR:TrinketIsAllowed()\n    local Trinket1IsAllowed = true\n    local Trinket2IsAllowed = true\n    \n    for i = 1, #BlackListedTrinkets do\n        if Action.Trinket1.ID == BlackListedTrinkets[i] then\n            Trinket1IsAllowed = false                \n        end\n        if Action.Trinket2.ID == BlackListedTrinkets[i] then\n            Trinket2IsAllowed = false                    \n        end\n    end\n    return Trinket1IsAllowed, Trinket2IsAllowed\nend\n\n-- Trinkets checker\nfunction TR:TrinketON()\n    return ( (Action.GetToggle(1, \"Trinkets\")[1]) or (Action.GetToggle(1, \"Trinkets\")[2]) )\nend\n\n------------------------------------\n--- RegisterDamage simc reference\n------------------------------------\n-- Register the spell damage formula.\nfunction A:RegisterDamage(Function)\n    self.DamageFormula = Function\nend\n\n-- Get the spell damage formula if it exists.\nfunction A:Damage()\n    return self.DamageFormula and self.DamageFormula() or 0\nend\n\n-- attack_power\nfunction A.Player:AttackPower()\n    return UnitAttackPower(\"player\")\nend\n\n-- AttackPowerDamageMod\nfunction A.Player:AttackPowerDamageMod(offHand)\n    local useOH = offHand or false\n    local wdpsCoeff = 6\n    local ap = Player:AttackPower()\n    local minDamage, maxDamage, minOffHandDamage, maxOffHandDamage, physicalBonusPos, physicalBonusNeg, percent = UnitDamage(self.UnitID)\n    local speed, offhandSpeed = UnitAttackSpeed(self.UnitID)\n    if useOH and offhandSpeed then\n        local wSpeed = offhandSpeed * (1 + Player:HastePct() / 100)\n        local wdps = (minOffHandDamage + maxOffHandDamage) / wSpeed / percent - ap / wdpsCoeff\n        return (ap + wdps * wdpsCoeff) * 0.5\n    else\n        local wSpeed = speed * (1 + Player:HastePct() / 100)\n        local wdps = (minDamage + maxDamage) / 2 / wSpeed / percent - ap / wdpsCoeff\n        return ap + wdps * wdpsCoeff\n    end\nend\n\n------------------------------------\n--- HasHeroism simc reference\n------------------------------------\nlocal HeroismBuff = { \n    [2825] =  true, -- Bloodlust Horde \n    [32182] =  true, -- Heroism Ally          \n    [90355] =  true, -- Ancient Hysteria\n    [160452] =  true, -- Netherwinds\n    [80353] =  true, -- Time Warp\n    [178207] =  true, -- Drums of Fury\n    [35475] =  true, -- Drums of War\n    [230935] =  true, -- Drums of Montain\n    [256740] =  true, -- Drums of Maelstrom\n    --[974] =  true, -- Test Earth Shield\n}\n\nfunction Unit:HasHeroism()\n    local unitID = self.UnitID\n    -- @return boolean \n    local spellId \n    for i = 1, huge do \n        name,_,_,_,_,_,_,_,_,spellId = UnitBuff(unitID, i, \"HELPFUL\")\n        if not spellId  then \n            break \n        elseif HeroismBuff[spellId] then \n            return true \n        end \n    end \n    return false\nend \n\n------------------------------------\n--- Corruption API patch 8.3\n------------------------------------\n-- Return current Corruption amount (Total - Resistance)\nfunction Player:GetCurrentCorruption()\n    local TotalCorruption = GetCorruption()\n    local CorruptionResistance = GetCorruptionResistance()\n    return TotalCorruption - CorruptionResistance\nend\n\n------------------------------------\n--- HasDeBuffsDown simc reference\n------------------------------------\nfunction Unit:HasDeBuffsDown(spell, byID)\n    local unitID = self.UnitID\n    \n    return self(unitID):HasDeBuffs(spell, byID) == 0\nend\n\n------------------------------------\n--- HasBuffsDown simc reference\n------------------------------------\nfunction Unit:HasBuffsDown(spell, byID)\n    local unitID = self.UnitID\n    \n    return self(unitID):HasBuffs(spell, byID) == 0\nend\n\n------------------------------------\n--- HasDeBuffsRefreshable simc reference\n------------------------------------\nfunction Unit:HasDeBuffsRefreshable(spell, byID)\n    local unitID = self.UnitID\n    \n    return self(unitID):HasDeBuffs(spell, byID) < 5\nend\n\n-------------------------------------------------------------------------------\n-- Multiunits\n-------------------------------------------------------------------------------\nfunction Action.MultiUnits.GetByRangeDoTsToRefresh(self, range, count, deBuffs, refreshTime, upTTD)\n    -- @return number\n    -- @usage A.MultiUnits:GetByRangeDoTsToRefresh(@number, @number, @table or @number, @number, @number)\n    -- deBuffs is required, refreshTime too, rest options are optimal\n    local total = 0\n    local nameplates = self:GetActiveUnitPlates()\n    \n    if nameplates then \n        for unitID in pairs(nameplates) do \n            if Unit(unitID):CombatTime() > 0 and (not range or Unit(unitID):CanInterract(range)) and (not upTTD or Unit(unitID):TimeToDie() >= upTTD) and Unit(unitID):HasDeBuffs(deBuffs, true) <= refreshTime then \n                total = total + 1\n            end \n            \n            if count and total >= count then \n                break \n            end \n        end \n    end \n    \n    return total \nend \nAction.MultiUnits.GetByRangeDoTsToRefresh = Action.MakeFunctionCachedDynamic(Action.MultiUnits.GetByRangeDoTsToRefresh)\n\n-------------------------------------------------------------------------------\n-- Event register\n-------------------------------------------------------------------------------\n-- Register a handler for an event.\n-- @param Handler The handler function.\n-- @param Events The events name.\nfunction Action:RegisterForEvent(Handler, ...)\n    local EventsTable = { ... }\n    for i = 1, #EventsTable do\n        local Event = EventsTable[i]\n        if not Events[Event] then\n            Events[Event] = { Handler }\n            EventFrame:RegisterEvent(Event)\n        else\n            tableinsert(Events[Event], Handler)\n        end\n    end\nend\n\n-- Register a handler for a combat event.\n-- @param Handler The handler function.\n-- @param Events The events name.\nfunction Action:RegisterForCombatEvent(Handler, ...)\n    local EventsTable = { ... }\n    for i = 1, #EventsTable do\n        local Event = EventsTable[i]\n        if not CombatEvents[Event] then\n            CombatEvents[Event] = { Handler }\n        else\n            tableinsert(CombatEvents[Event], Handler)\n        end\n    end\nend\n\n-- Register a handler for a self combat event.\n-- @param Handler The handler function.\n-- @param Events The events name.\nfunction Action:RegisterForSelfCombatEvent(Handler, ...)\n    local EventsTable = { ... }\n    for i = 1, #EventsTable do\n        local Event = EventsTable[i]\n        if not SelfCombatEvents[Event] then\n            SelfCombatEvents[Event] = { Handler }\n        else\n            tableinsert(SelfCombatEvents[Event], Handler)\n        end\n    end\nend\n\n-- Register a handler for a pet combat event.\n-- @param Handler The handler function.\n-- @param Events The events name.\nfunction Action:RegisterForPetCombatEvent(Handler, ...)\n    local EventsTable = { ... }\n    for i = 1, #EventsTable do\n        local Event = EventsTable[i]\n        if not PetCombatEvents[Event] then\n            PetCombatEvents[Event] = { Handler }\n        else\n            tableinsert(PetCombatEvents[Event], Handler)\n        end\n    end\nend\n\n-- OnEvent Frame Listener\nEventFrame:SetScript(\"OnEvent\",\n    function(self, Event, ...)\n        for _, Handler in pairs(Events[Event]) do\n            Handler(Event, ...)\n        end\nend)\n\n-- Combat Log Event Unfiltered Listener\nlocal function ListenerCombatLogEventUnfiltered(Event, TimeStamp, SubEvent, ...)\n    if CombatEvents[SubEvent] then\n        -- Unfiltered Combat Log\n        for _, Handler in pairs(CombatEvents[SubEvent]) do\n            Handler(TimeStamp, SubEvent, ...)\n        end\n    end\n    if SelfCombatEvents[SubEvent] then\n        -- Unfiltered Combat Log with SourceGUID == PlayerGUID filter\n        if select(2, ...) == UnitGUID(\"player\") then\n            for _, Handler in pairs(SelfCombatEvents[SubEvent]) do\n                Handler(TimeStamp, SubEvent, ...)\n            end\n        end\n    end\n    if PetCombatEvents[SubEvent] then\n        -- Unfiltered Combat Log with SourceGUID == PetGUID filter\n        if select(2, ...) == UnitGUID(\"pet\") then\n            for _, Handler in pairs(SelfCombatEvents[SubEvent]) do\n                Handler(TimeStamp, SubEvent, ...)\n            end\n        end\n    end\n    for i = 1, CombatLogPrefixesCount do\n        -- TODO : Optimize the str find\n        if SubEvent then\n            local Start, End = stringfind(SubEvent, CombatLogPrefixes[i])\n            if Start and End then\n                -- TODO: Optimize the double str sub\n                local Prefix, Suffix = stringsub(SubEvent, Start, End), stringsub(SubEvent, End + 1)\n                if PrefixCombatEvents[Prefix] then\n                    -- Unfiltered Combat Log with Prefix only\n                    for _, Handler in pairs(PrefixCombatEvents[Prefix]) do\n                        Handler(TimeStamp, SubEvent, ...)\n                    end\n                end\n                if SuffixCombatEvents[Suffix] then\n                    -- Unfiltered Combat Log with Suffix only\n                    for _, Handler in pairs(SuffixCombatEvents[Suffix]) do\n                        Handler(TimeStamp, SubEvent, ...)\n                    end\n                end\n            end\n        end\n    end\nend\n\nAction:RegisterForEvent(function(Event)\n        ListenerCombatLogEventUnfiltered(Event, CombatLogGetCurrentEventInfo())\nend, \"COMBAT_LOG_EVENT_UNFILTERED\")\n\nlocal function removeLastChar(text)\n    return text:sub(1, -2)\nend\n\n--[[*\n  * @mixin HL.OffsetRemains\n  * @desc Apply an offset to an expiration time.\n  *\n  * @param {number} ExpirationTime - The expiration time to apply the offset on.\n  * @param {string|number} Offset - The offset to apply, can be a string for a known method or directly the offset value in seconds.\n  *\n  * @returns {number}\n  *]]\nfunction Action.OffsetRemains(ExpirationTime, Offset)\n    if type(Offset) == \"number\" then\n        ExpirationTime = ExpirationTime - Offset\n    elseif type(Offset) == \"string\" then\n        local CastRemains = Player:CastRemains()\n        local GCDRemains = Player:GCDRemains()\n        if Offset == \"GCDRemains\" then\n            ExpirationTime = ExpirationTime - GCDRemains\n        elseif Offset == \"CastRemains\" then\n            ExpirationTime = ExpirationTime - CastRemains\n        elseif Offset == \"Auto\" then\n            ExpirationTime = ExpirationTime - math.max(GCDRemains, CastRemains)\n        end\n    else\n        error(\"Invalid Offset.\")\n    end\n    return ExpirationTime\nend\n\n--------------------------------------\n--------- Action Status Frame --------\n--------------------------------------\n--- Draw a dynamic list based on current Blocked spells\n--- Future will add Queued frame and maybe other options depending on users feedbacks\n\nTR.BlockedListAssoc                = {}\nTR.BlockedListArray             = {}\nTR.BlockedListIcon               = {}\n\nlocal pairs, next, type, wipe    = pairs, next, type, wipe\nlocal hooksecurefunc             = hooksecurefunc\nlocal isHooked                    -- nil \n\nlocal L                         = {\n    enUS                         = \"No blocked actions :)\",\n    frFR                         = \"Aucune action bloquée :)\",\n    ruRU                        = \"Нет заблокированных действий :)\",\n}\n\nlocal function GetActionSpellStatus(this)\n    if Action.IsInitialized then \n        if not this then \n            wipe(TR.BlockedListAssoc)\n            \n            if Action[Action.PlayerSpec] then \n                for k, v in pairs(Action[Action.PlayerSpec]) do \n                    if type(v) == \"table\" and v.Type and v:IsBlocked() then     \n                        TR.BlockedListAssoc[k] = v\n                    end \n                end \n            end \n        else \n            local k = this:GetKeyName()\n            if k then \n                if this:IsBlocked() then \n                    TR.BlockedListAssoc[k] = this \n                else \n                    TR.BlockedListAssoc[k] = nil \n                end \n            end \n        end \n    end \n    \n    wipe(TR.BlockedListArray)\n    wipe(TR.BlockedListIcon)\n    for k, v in pairs(TR.BlockedListAssoc) do \n        TR.BlockedListArray[#TR.BlockedListArray + 1] = k --.. \" \" .. (v.Desc or \"\") .. \" \" .. (v.Color or \"\")\n        TR.BlockedListIcon[#TR.BlockedListIcon + 1] = v:Icon()\n    end \n    \n    TMW:Fire(\"TMW_ACTION_STATUS_BLOCKED_CHANGED\")\nend\n\nlocal function OnCallback()\n    GetActionSpellStatus()\nend \n\n-- Finally, callbackEvent on init\nTMW:RegisterCallback(\"TMW_ACTION_IS_INITIALIZED\", function(callbackEvent) \n        if Action.CurrentProfile:match(\"Taste\") then \n            GetActionSpellStatus()\n            if not isHooked then \n                TMW:RegisterCallback(\"TMW_ACTION_PLAYER_SPECIALIZATION_CHANGED\", OnCallback, \"TASTE_BLOCKED_TRACKER\")\n                isHooked = true \n            end \n        else\n            if isHooked then \n                wipe(TR.BlockedListAssoc)\n                wipe(TR.BlockedListArray)\n                wipe(TR.BlockedListIcon)\n                TMW:UnregisterCallback(\"TMW_ACTION_PLAYER_SPECIALIZATION_CHANGED\", OnCallback, \"TASTE_BLOCKED_TRACKER\")\n                TMW:Fire(\"TMW_ACTION_STATUS_BLOCKED_CHANGED\")            \n                isHooked = nil\n            end \n        end \nend)\n\n--------------------------------------\n--------- StdUI Status Frame ---------\n--------------------------------------\nAction.StatusFrame = StdUi:Window(UIParent, 120, 150, \"-- Blocked Spells --\");\nAction.StatusFrame.titlePanel.label:SetFontSize(14)\nAction.StatusFrame.default_w = Action.StatusFrame:GetWidth()\nAction.StatusFrame.default_h = Action.StatusFrame:GetHeight() \nAction.StatusFrame.titlePanel:SetPoint(\"TOP\", -100, 50)\nAction.StatusFrame:SetFrameStrata(\"HIGH\")\nAction.StatusFrame:SetPoint(\"CENTER\")\nAction.StatusFrame:SetShown(false) \n\n-- Test refresh button\n--local btn = StdUi:Button(StatusFrame, 100, 24, 'Refresh Data');\n--StdUi:GlueTop(btn, StatusFrame, 0, -40);\n\nlocal data = {};\nlocal columns = {\n    {\n        name         = 'Name',\n        width        = 70,\n        defaultwidth = 70,\n        align        = 'LEFT',\n        index        = 'name',\n        format       = 'string',\n    },\n    {\n        name         = '',\n        width        = 20,\n        defaultwidth = 20,\n        align        = 'RIGHT',\n        index        = 'icon',\n        format       = 'icon',\n    },\n}\n\nlocal customHeight = 5\n\nlocal StatusFrameScrollTable = StdUi:ScrollTable(Action.StatusFrame, columns, customHeight, 15);\nStatusFrameScrollTable:EnableSelection(true);\nStatusFrameScrollTable:SetResizable(true)\nStdUi:GlueTop(StatusFrameScrollTable, Action.StatusFrame, 0, -50);\nStatusFrameScrollTable.defaultrows = { numberOfRows = StatusFrameScrollTable.numberOfRows, rowHeight = StatusFrameScrollTable.rowHeight }\n\nfunction Action.StatusFrame.UpdateResize()\n    --StatusFrameScrollTable:SetWidth(Action.StatusFrame:GetWidth() - 50 )\n    --StatusFrameScrollTable:SetHeight(Action.StatusFrame:GetHeight() ) \n    -- ScrollTable\n    if StatusFrameScrollTable.columns then \n        for i = 1, #StatusFrameScrollTable.columns do                                         \n            if StatusFrameScrollTable.columns[i].index == \"name\" then\n                -- Column by Name resize\n                StatusFrameScrollTable.columns[i].width = round(StatusFrameScrollTable.columns[i].defaultwidth + (Action.StatusFrame:GetWidth() - Action.StatusFrame.default_w - 1), 0)\n                StatusFrameScrollTable:SetColumns(StatusFrameScrollTable.columns)    \n                -- Row resize\n                StatusFrameScrollTable.numberOfRows = StatusFrameScrollTable.defaultrows.numberOfRows + round((Action.StatusFrame:GetHeight() - Action.StatusFrame.default_h + 10) / StatusFrameScrollTable.defaultrows.rowHeight, 0)\n                StatusFrameScrollTable:SetDisplayRows(StatusFrameScrollTable.numberOfRows, StatusFrameScrollTable.defaultrows.rowHeight)\n                break \n            end \n        end\n    end \nend\n\nAction.StatusFrame:HookScript(\"OnSizeChanged\", Action.StatusFrame.UpdateResize)\n\nlocal function UpdateTableData()\n    data = {};\n    \n    for i = 1, #TR.BlockedListArray do\n        local r = {name = TR.BlockedListArray[i] or (L[Action.GetCL()] or L.enUS), icon = TR.BlockedListIcon[i] or 841383}\n        -- index\n        r.i = i;\n        tableinsert(data, r);\n    end\n    \n    -- update scroll table data\n    StatusFrameScrollTable:SetData(data);\nend\n\n--btn:SetScript('OnClick', UpdateTableData)\n\nhooksecurefunc(Action, \"SetBlocker\", function(this)\n        if isHooked then \n            GetActionSpellStatus(this)\n            UpdateTableData()\n            \n        end \nend)\n\nfunction TR.ToggleStatusFrame()\n    if not Action.PlayerSpec or (not Action.MainUI and not Action.IsInitialized) then \n        return \n    end \n    \n    if Action.StatusFrame:IsShown() then \n        UpdateTableData()\n        customHeight = #TR.BlockedListArray or 5\n        Action.StatusFrame:SetShown(not Action.StatusFrame:IsShown())\n        Action.StatusFrame.resizer = Action.StdUi.CreateResizer(Action.StatusFrame)\n        return\n    else \n        UpdateTableData()\n        customHeight = #TR.BlockedListArray or 5\n        Action.StatusFrame:SetShown(not Action.StatusFrame:IsShown())\n        Action.StatusFrame.resizer = Action.StdUi.CreateResizer(Action.StatusFrame)        \n    end \n    \nend\n\n--------------------------------------------------------\n----------- DOGTAG CALL FOR STATUS FRAME ---------------\n--------------------------------------------------------\n-- Replaced by StdUI code as of 24/03/2020 but still working if someone wants to use it through TMW DogTags\nlocal DogTag = LibStub(\"LibDogTag-3.0\", true)\nTMW:RegisterCallback(\"TMW_ACTION_STATUS_BLOCKED_CHANGED\",      DogTag.FireEvent, DogTag)\nif DogTag then \n    -- Status Frame Blocked Spells\n    DogTag:AddTag(\"TMW\", \"ActionStatusBlockedSpell\", {\n            code = function()\n                if #TR.BlockedListArray > 0 then\n                    for i = 1, #TR.BlockedListArray do\n                        return TR.BlockedListArray[i]\n                    end\n                else\n                    return L[Action.GetCL()] or L.enUS\n                end\n            end,\n            ret = \"string\",\n            doc = \"Displays Blocked Spells Icon\",\n            example = '[ActionStatusFrame] => \"TR.BlockedListArray.icon\"',\n            events = \"TMW_ACTION_STATUS_BLOCKED_CHANGED\",\n            category = \"Action\",\n    })    \n    -- Status Frame Blocked Spells Icon\n    DogTag:AddTag(\"TMW\", \"ActionStatusBlockedIcon\", {\n            code = function()\n                if #TR.BlockedListIcon > 0 then\n                    for i = 1, #TR.BlockedListIcon do\n                        return TR.BlockedListIcon[i]\n                    end\n                else\n                    return L[Action.GetCL()] or L.enUS\n                end\n            end,\n            ret = \"string\",\n            doc = \"Displays Blocked Spells\",\n            example = '[ActionStatusFrame] => \"TR.BlockedListArray.spellname\"',\n            events = \"TMW_ACTION_STATUS_BLOCKED_CHANGED\",\n            category = \"Action\",\n    })\nend \n\n------------------------------------\n--------- NOTIFICATIONS API --------\n------------------------------------\n-- Return a tost notification directly in game with status information from rotation. Useful for custom events announcer    \n-- @Parameters : Message and Spell are mandatory settings. \n-- @optional Parameters : Delay and incombat can be nil \n-- Usage : /run Action.SendNotification(\"test\", 22812, 2, false)    \nfunction Action.SendNotification(message, spell, delay, incombat)\n    local DelaySetting = Action.GetToggle(2, \"AnnouncerDelay\")\n    local InCombatSetting = Action.GetToggle(2, \"AnnouncerInCombatOnly\")\n    local Enabled = Action.GetToggle(2, \"UseAnnouncer\")\n    \n    if not message then\n        Action.Print(\"You didn't set any message for Notification.\")\n    end\n    \n    if not delay then\n        if DelaySetting then \n            delay = DelaySetting\n        else\n            delay = 2\n        end\n    end\n    \n    if not incombat then\n        if InCombatSetting then \n            incombat = InCombatSetting\n        else        \n            incombat = false\n        end\n    else\n        incombat = true\n    end\n    \n    -- Variables\n    local timer = TMW.time\n    local endtimer = timer + delay    \n    Action.NotificationMessage = \"\"\n    Action.NotificationIsValid = false\n    Action.NotificationIsValidUntil = endtimer\n    Action.CurrentNotificationIcon = GetSpellTexture(spell)\n    -- Check if enabled\n    if Enabled then\n        -- Option 1 : Combat only        \n        if message and spell and incombat then \n            if (TMW.time <= endtimer) and Unit(\"player\"):CombatTime() > 1 then \n                Action.NotificationIsValid = true\n                Action.NotificationMessage = message                 \n            else\n                Action.NotificationIsValid = false\n            end\n            -- Option 2 : Everytime\n        elseif message and spell and not incombat then     \n            if TMW.time <= endtimer then \n                Action.NotificationIsValid = true\n                Action.NotificationMessage = message            \n            else\n                Action.NotificationIsValid = false\n            end\n        end\n    end\n    TMW:Fire(\"TMW_ACTION_NOTIFICATION\")    \n    return Action.NotificationMessage, Action.CurrentNotificationIcon, Action.NotificationIsValid, Action.NotificationIsValidUntil\n    \nend              \n\n------------------------------------\n-- DogTags\n------------------------------------\n-- Taste's \nTMW:RegisterCallback(\"TMW_ACTION_NOTIFICATION\", DogTag.FireEvent, DogTag)\n\nif DogTag then\n    -- Custom Icon\n    DogTag:AddTag(\"TMW\", \"ActionNotificationIcon\", {\n            code = function()\n                if Action.CurrentNotificationIcon and Action.NotificationIsValid then\n                    return Action.CurrentNotificationIcon\n                else \n                    return \"\"\n                end \n            end,\n            ret = \"string\",\n            doc = \"Displays Notification Icon\",\n            example = '[ActionNotification] => \"Action.SendNotification(message, spell, delay)\"',\n            events = \"TMW_ACTION_NOTIFICATION\",\n            category = \"Action\",\n    })\n    \n    -- Custom Notifications\n    DogTag:AddTag(\"TMW\", \"ActionNotificationMessage\", {\n            code = function()\n                if Action.NotificationMessage and Action.NotificationIsValid then                \n                    return Action.NotificationMessage\n                else \n                    return \"\"\n                end \n            end,\n            ret = \"string\",\n            doc = \"Displays Notification Message\",\n            example = '[ActionNotification] => \"Action.SendNotification(message, spell, delay)\"',\n            events = \"TMW_ACTION_NOTIFICATION\",\n            category = \"Action\",\n    })            \n    \n    -- The biggest problem of TellMeWhen what he using :setup on frames which use DogTag and it's bring an error\n    TMW:RegisterCallback(\"TMW_ACTION_IS_INITIALIZED\", function()\n            TMW:Fire(\"TMW_ACTION_NOTIFICATION\")\n    end)\nend\n\n\n\n------------------------------------\n--- Version checker by Ayni\n------------------------------------\nlocal function GetUnixTimeStamp(dateString)\n    if type(dateString) ~= \"string\" then \n        error(toStr[dateString or \"nil\"] .. \" is not a string for func GetUnixTimeStamp\")\n        return\n    end\n    \n    local dateTable = {}\n    for v in dateString:gmatch(\"%d+\") do\n        v = toNum[v]\n        \n        if not dateTable.day then \n            dateTable.day = v\n        elseif not dateTable.month then\n            dateTable.month = v\n        else\n            dateTable.year = v\n        end\n    end\n    \n    return time(dateTable)\nend\n\n-- Version Popup\n-- TODO : Localized text and button\nStaticPopupDialogs[\"ACTION_OUTDATED_VERSION\"] = {\n    text = \"[WARNING]\\n\\nYou are currently running an old version of Action.\\n\\nPlease close the game and update.)\",\n    button1 = \"Got it\",\n    OnAccept = function()\n        StaticPopup_Hide (\"ACTION_OUTDATED_VERSION\")\n    end,\n    timeout = 0,\n    whileDead = true,\n    hideOnEscape = true,\n    preferredIndex = 2,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/\n}\n\n-- Addon version less than required date time of the need addon version\n--print(GetUnixTimeStamp(Action.DateTime) < GetUnixTimeStamp(\"31.07.2020\"))\nif GetUnixTimeStamp(Action.DateTime) < GetUnixTimeStamp(\"30.07.2020\") then\n    TR.OptimalConfiguration = false\n    StaticPopup_Show (\"ACTION_OUTDATED_VERSION\")\nend\n\n--if TR.OptimalConfiguration ~= true then\n--    Action.SendNotification(\"[WARNING]You are currently using Taste Rotations with outdated Action, please update.\", 182530, 10, false)  \n--end    ",
			}, -- [1]
			{
				["Order"] = 0.9,
				["Name"] = "Custom PvP",
				["Code"] = "---------------------------------------------------\n---------------- CUSTOM PVP FUNCTIONS -------------\n---------------------------------------------------\nlocal TMW                                   = TMW\nlocal CNDT                                  = TMW.CNDT\nlocal Env                                   = CNDT.Env\nlocal Action                                = Action\nlocal MultiUnits                            = Action.MultiUnits\nlocal next, pairs, type, print              = next, pairs, type, print\nlocal IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo = IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo\nlocal UnitIsPlayer, UnitExists, UnitGUID    = UnitIsPlayer, UnitExists, UnitGUID\nlocal PetLib                                = LibStub(\"PetLibrary\")\nlocal Unit                                  = Action.Unit \nlocal huge                                  = math.huge\n\n---------------------------------------------------\n-------------------- CONSTANTS --------------------\n---------------------------------------------------\n--- Reflect Spells List\nlocal pvpReflect = {\n    161372, -- Poly\n    190319, -- Combustion\n    161372, -- Polymorph\n    203286, -- Greater Pyroblast\n    199786, --  Glacial Spike\n    257537, -- Ebonbolt\n    210714, -- Icefury\n    191634, -- Stormkeeper\n    116858, -- Chaos Bolt\n    118, -- Poly\n}\n\n---------------------------------------------------\n-------------------- FUNCTIONS --------------------\n---------------------------------------------------\n-- Local Randomizer\nlocal randomReflect = math.random(90, 100)\n\n-- Should Reflect behavior\n-- Parameter \"unit\" is mandatory\n-- @ return Boolean\nfunction Action.ShouldReflect(unit)    \n    \n    local GoodToReflect = false\n    -- Protect if nil parameter \n    if not unit or unit == nil then \n        unit = \"target\"\n    end\n    \n    for i = 1, #pvpReflect do \n        local castingTime, castingLeftSec, castingDonePer, spellID, spellName = Unit(unit):CastTime()\n        if not spellID then \n            break \n        elseif pvpReflect[i] then \n            if  castingDonePer >= randomReflect then\n                GoodToReflect = true\n            else\n                GoodToReflect = false\n            end\n        end \n    end \n    \n    return GoodToReflect\nend \n\n",
			}, -- [2]
			{
				["Order"] = 1.1,
				["Name"] = "Custom PvE",
				["Code"] = "---------------------------------------------------\n---------------- CUSTOM PVE FUNCTIONS -------------\n---------------------------------------------------\nlocal _G, type, error, time                 = _G, type, error, time\nlocal A                                     = _G.Action\nlocal TMW                                   = _G.TMW\nlocal TeamCache                                = Action.TeamCache\nlocal EnemyTeam                                = Action.EnemyTeam\nlocal FriendlyTeam                            = Action.FriendlyTeam\nlocal LoC                                    = Action.LossOfControl\nlocal Player                                = Action.Player \nlocal MultiUnits                            = Action.MultiUnits\nlocal UnitCooldown                            = Action.UnitCooldown\nlocal next, pairs, type, print              = next, pairs, type, print\nlocal IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo = IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo\nlocal UnitIsPlayer, UnitExists, UnitGUID    = UnitIsPlayer, UnitExists, UnitGUID\nlocal PetLib                                = LibStub(\"PetLibrary\")\nlocal Unit                                  = Action.Unit \nlocal huge                                  = math.huge\nlocal UnitBuff                              = _G.UnitBuff\nlocal EventFrame                            = CreateFrame(\"Frame\", \"Taste_EventFrame\", UIParent)\nlocal UnitIsUnit                            = UnitIsUnit\n-- Lua\nlocal error                                 = error\nlocal setmetatable                          = setmetatable\nlocal stringformat                          = string.format\nlocal tableinsert                           = table.insert\nlocal TR                                    = Action.TasteRotation\nlocal _G, math, setmetatable                = _G, math, setmetatable\nlocal GameLocale                            = A.FormatGameLocale(_G.GetLocale())\nlocal StdUi                                 = A.StdUi -- Custom StdUI with Action shared settings\nlocal Factory                               = StdUi.Factory\nlocal math_random                           = math.random\n\n-------------------------------------------------------------------------------\n-- Tanks specifics functions\n-------------------------------------------------------------------------------\n-- To do: update for BFA !!\nlocal ActiveMitigationSpells = {\n    Buff = {\n        -- PR Legion\n        191941, -- Darkstrikes (VotW - 1st)\n        204151, -- Darkstrikes (VotW - 1st)\n        -- T20 ToS\n        239932 -- Felclaws (KJ)\n    },\n    Debuff = {    \n        255434,\n        265881,\n        264556,\n        270487,\n        274358,\n        270447,\n    },\n    Cast = {\n        -- PR Legion\n        197810, -- Wicked Slam (ARC - 3rd)\n        197418, -- Vengeful Shear (BRH - 2nd)\n        198079, -- Hateful Gaze (BRH - 3rd)\n        214003, -- Coup de Grace (BRH - Trash)\n        235751, -- Timber Smash (CotEN - 1st)\n        193668, -- Savage Blade (HoV - 4th)\n        227493, -- Mortal Strike (LOWR - 4th)\n        228852, -- Shared Suffering (LOWR - 4th)\n        193211, -- Dark Slash (MoS - 1st)\n        200732, -- Molten Crash (NL - 4th)\n        -- T20 ToS\n        241635, -- Hammer of Creation (Maiden)\n        241636, -- Hammer of Obliteration (Maiden)\n        236494, -- Desolate (Avatar)\n        239932, -- Felclaws (KJ)\n        -- T21 Antorus\n        254919, -- Forging Strike (Kin'garoth)\n        244899, -- Fiery Strike (Coven)\n        245458, -- Foe Breaker (Aggramar)\n        248499, -- Sweeping Scythe (Argus)\n        258039, -- Deadly Scythe (Argus)\n        -- BFA\n        267899, -- Shrine of the Storm\n        272457, -- Underrot\n        260508, -- Waycrest Manor\n        249919, -- Atal'Dazar\n        265910, -- King's Rest\n        268586, -- King's Rest\n        262277, -- Fetid Devourer\n        265248, -- Zek'voz\n        273316, -- Zul, Reborn\n        273282, -- Mythrax the Unraveler\n        \n    },\n    Channel = {}\n}\n\n-------------------------------------------------------------------------------\n-- Active mitigation \n-------------------------------------------------------------------------------\n-- Predict dangerous attacks and use defensives if needed\nfunction Player:ActiveMitigationNeeded()\n    -- Specials Dungeon behavior\n    local secondsLeft, percentLeft, spellID, spellName, notInterruptable, isChannel = Unit(\"target\"):IsCastingRemains()\n    \n    if Unit(\"player\"):IsTanking(\"target\") then\n        if ActiveMitigationSpells.Cast[spellID] then\n            return true\n        end\n        for _, Buff in pairs(ActiveMitigationSpells.Buff) do\n            if Unit(\"target\"):HasBuffs(Buff, true) > 0 then\n                return true\n            end\n        end\n        for _, Debuff in pairs(ActiveMitigationSpells.Debuff) do\n            if Unit(\"player\"):HasDeBuffs(Debuff, true) > 0 then\n                return true\n            end\n        end\n    end\n    return false\nend\n\n-------------------------------------------------------------------------------\n-- Smart Reflect Mythic+\n-------------------------------------------------------------------------------\n-- @Use with inside rotation function\n\nTR.Lists.ReflectID = {\n    --Battle of Dazar'alor\n    [283572] = \"Sacred Blade\",\n    [284449] = \"Reckoning\",\n    [286988] = \"Divine Burst\",\n    [282036] = \"Fireball\",\n    [286988] = \"Searing Embers\",\n    [286646] = \"Gigavolt Charge\",\n    [282182] = \"Buster Cannon\",\n    --Uldir\n    [279669] = \"Bacterial Outbreak\",\n    [279660] = \"Endemic Virus\",\n    [274262] = \"Explosive Corruption\",\n    --Reaping\n    [288693] = \"Grave Bolt\",\n    --Atal'Dazar\n    [250096] = \"Wracking Pain\",\n    [253562] = \"Wildfire\",\n    [252923] = \"Venom Blast\",\n    --Kings Rest\n    [267618] = \"Drain Fluids\",\n    [267308] = \"Lighting Bolt\",\n    [270493] = \"Spectral Bolt\",\n    [269973] = \"Deathly Chill\",\n    [270923] = \"Shadow Bolt\",\n    --Free Hold\n    [259092] = \"Lightning Bolt\",\n    [281420] = \"Water Bolt\",\n    --Siege of Boralus\n    [272588] = \"Rotting Wounds\",\n    [272581] = \"Water Spray\",\n    [257063] = \"Brackish Bolt\",\n    [272571] = \"Choking Waters\",\n    -- Temple of Sethraliss\n    [263318] = \"Jolt\",\n    [263775] = \"Gust\",\n    [268061] = \"Chain Lightning\",\n    [272820] = \"Shock\",\n    [268013] = \"Flame Shock\",\n    [274642] = \"Lava Burst\",\n    [268703] = \"Lightning Bolt\",\n    [272699] = \"Venomous Spit\",\n    --Shrine of the Storm\n    [265001] = \"Sea Blast\",\n    [264560] = \"Choking Brine\",\n    [264144] = \"Undertow\",\n    [268347] = \"Void Bolt\",\n    [267969] = \"Water Blast\",\n    [268233] = \"Electrifying Shock\",\n    [268315] = \"Lash\",\n    [268177] = \"Windblast\",\n    [268273] = \"Deep Smash\",\n    [268317] = \"Rip Mind\",\n    [265001] = \"Sea Blast\",\n    [274703] = \"Void Bolt\",\n    [268214] = \"Carve Flesh\",\n    --Motherlode\n    [259856] = \"Chemical Burn\",\n    [260318] = \"Alpha Cannon\",\n    [262794] = \"Energy Lash\",\n    [263202] = \"Rock Lance\",\n    [262268] = \"Caustic Compound\",\n    [263262] = \"Shale Spit\",\n    [263628] = \"Charged Claw\",\n    --Underrot\n    [260879] = \"Blood Bolt\",\n    [265084] = \"Blood Bolt\",\n    --Tol Dagor\n    [257777] = \"Crippling Shiv\",\n    [257033] = \"Fuselighter\",\n    [258150] = \"Salt Blast\",\n    [258869] = \"Blaze\",\n    --Waycrest Manor\n    [260701] = \"Bramble Bolt\",\n    [260700] = \"Ruinous Bolt\",\n    [260699] = \"Soul Bolt\",\n    [268271] = \"Wracking Chord\",\n    [261438] = \"Wasting Strike\",\n    [261440] = \"Virulent Pathogen\",\n    [266225] = \"Darkened Lightning\",\n    [273653] = \"Shadow Claw\",\n    [265881] = \"Decaying Touch\",\n    [264153] = \"Spit\",\n    [278444] = \"Infest\",\n    --Operation: Mechagn\n    [298669] = \"Taze\",\n    [300764] = \"slimebolt\",\n    [300650] = \"suffocating smog\",\n    [294195] = \"arcing zap\",\n    [291878] = \"pulse blast\"\n}\n-- Stormbolt Warrior Protection\n-- Specifics NPC\nTR.Lists.Storm_Unit_List = {\n    [131009] = \"Spirit of Gold\",\n    [134388] = \"A Knot of Snakes\",\n    [129758] = \"Irontide Grenadier\"\n}  \n\n-- Dangerous NPC Abilities that we can Stormbolt\nTR.Lists.Storm_Spells_List = {\n    274400,\n    274383,\n    257756,\n    276292,\n    268273,\n    256897,\n    272542,\n    272888,\n    269266,\n    258317,\n    258864,\n    259711,\n    258917,\n    264038,\n    253239,\n    269931,\n    270084,\n    270482,\n    270506,\n    270507,\n    267433,\n    267354,\n    268702,\n    268846,\n    268865,\n    258908,\n    264574,\n    272659,\n    272655,\n    267237,\n    265568,\n    277567,\n    265540,\n    268202,\n    258058,\n    257739\n}\n\n-- All units that we know we can't stun     \nTR.Lists.StunsBlackList = {\n    -- Atal'Dazar\n    [87318] = \"Dazar'ai Colossus\",\n    [122984] = \"Dazar'ai Colossus\",\n    [128455] = \"T'lonja\",\n    [129553] = \"Dinomancer Kish'o\",\n    [129552] = \"Monzumi\",\n    -- Freehold\n    [129602] = \"Irontide Enforcer\",\n    [130400] = \"Irontide Crusher\",\n    -- King's Rest\n    [133935] = \"Animated Guardian\",\n    [134174] = \"Shadow-Borne Witch Doctor\",\n    [134158] = \"Shadow-Borne Champion\",\n    [137474] = \"King Timalji\",\n    [137478] = \"Queen Wasi\",\n    [137486] = \"Queen Patlaa\",\n    [137487] = \"Skeletal Hunting Raptor\",\n    [134251] = \"Seneschal M'bara\",\n    [134331] = \"King Rahu'ai\",\n    [137484] = \"King A'akul\",\n    [134739] = \"Purification Construct\",\n    [137969] = \"Interment Construct\",\n    [135231] = \"Spectral Brute\",\n    [138489] = \"Shadow of Zul\",\n    -- Shrine of the Storm\n    [134144] = \"Living Current\",\n    [136214] = \"Windspeaker Heldis\",\n    [134150] = \"Runecarver Sorn\",\n    [136249] = \"Guardian Elemental\",\n    [134417] = \"Deepsea Ritualist\",\n    [136353] = \"Colossal Tentacle\",\n    [136295] = \"Sunken Denizen\",\n    [136297] = \"Forgotten Denizen\",\n    -- Siege of Boralus\n    [129369] = \"Irontide Raider\",\n    [129373] = \"Dockhound Packmaster\",\n    [128969] = \"Ashvane Commander\",\n    [138255] = \"Ashvane Spotter\",\n    [138465] = \"Ashvane Cannoneer\",\n    [135245] = \"Bilge Rat Demolisher\",\n    -- Temple of Sethraliss\n    [134991] = \"Sandfury Stonefist\",\n    [139422] = \"Scaled Krolusk Tamer\",\n    [136076] = \"Agitated Nimbus\",\n    [134691] = \"Static-charged Dervish\",\n    [139110] = \"Spark Channeler\",\n    [136250] = \"Hoodoo Hexer\",\n    [139946] = \"Heart Guardian\",\n    -- MOTHERLODE!!\n    [130485] = \"Mechanized Peacekeeper\",\n    [136139] = \"Mechanized Peacekeeper\",\n    [136643] = \"Azerite Extractor\",\n    [134012] = \"Taskmaster Askari\",\n    [133430] = \"Venture Co. Mastermind\",\n    [133463] = \"Venture Co. War Machine\",\n    [133436] = \"Venture Co. Skyscorcher\",\n    [133482] = \"Crawler Mine\",\n    -- Underrot\n    [131436] = \"Chosen Blood Matron\",\n    [133912] = \"Bloodsworn Defiler\",\n    [138281] = \"Faceless Corruptor\",\n    -- Tol Dagor\n    [130025] = \"Irontide Thug\",\n    -- Waycrest Manor\n    [131677] = \"Heartsbane Runeweaver\",\n    [135329] = \"Matron Bryndle\",\n    [131812] = \"Heartsbane Soulcharmer\",\n    [131670] = \"Heartsbane Vinetwister\",\n    [135365] = \"Matron Alma\",\n}\n\n-- Protection Paladin Hand of Justice\nTR.Lists.HOJ_Unit_List = {\n    [131009] = \"Spirit of Gold\",\n    [134388] = \"A Knot of Snakes\",\n    [129758] = \"Irontide Grenadier\",\n}\n\n-- Death Knight Asphyxiate\nTR.Lists.Asphyxiate_List = {\n    274400,\n    274383,\n    257756,\n    276292,\n    268273,\n    256897,\n    272542,\n    272888,\n    269266,\n    258317,\n    258864,\n    259711,\n    258917,\n    264038,\n    253239,\n    269931,\n    270084,\n    270482,\n    270506,\n    270507,\n    267433,\n    267354,\n    268702,\n    268846,\n    268865,\n    258908,\n    264574,\n    272659,\n    272655,\n    267237,\n    265568,\n    277567,\n    265540,\n    268202,\n    258058,\n    257739\n}\n\n-------------------------------------------------------------------------------\n-- Rogue Marked for death special functions\n-------------------------------------------------------------------------------\n-- Check if the unit is coded as blacklisted for Marked for Death (Rogue) or not.\n-- Most of the time if the unit doesn't really die and isn't the last unit of an instance.\n\n-- Not Facing Unit Blacklist\nA.UnitNotInFront = Player\nA.UnitNotInFrontTime = 0\nA.LastUnitCycled = Player\nA.LastUnitCycledTime = 0\n\nAction:RegisterForEvent(function(Event, MessageType, Message)\n        if MessageType == 50 and Message == SPELL_FAILED_UNIT_NOT_INFRONT then\n            A.UnitNotInFront = A.LastUnitCycled\n            A.UnitNotInFrontTime = A.LastUnitCycledTime\n        end\nend, \"UI_ERROR_MESSAGE\")\n\nlocal SpecialMfdBlacklistData = {\n    --- Legion\n    ----- Dungeons (7.0 Patch) -----\n    --- Halls of Valor\n    -- Hymdall leaves the fight at 10%.\n    [94960] = true,\n    -- Solsten and Olmyr doesn't \"really\" die\n    [102558] = true,\n    [97202] = true,\n    -- Fenryr leaves the fight at 60%. We take 50% as check value since it doesn't get immune at 60%.\n    [95674] = function(self) return self:HealthPercentage() > 50 and true or false end,\n    \n    ----- Trial of Valor (T19 - 7.1 Patch) -----\n    --- Odyn\n    -- Hyrja & Hymdall leaves the fight at 25% during first stage and 85%/90% during second stage (HM/MM)\n    [114360] = true,\n    [114361] = true,\n    \n    --- Warlord of Draenor (WoD)\n    ----- HellFire Citadel (T18 - 6.2 Patch) -----\n    --- Hellfire Assault\n    -- Mar'Tak doesn't die and leave fight at 50% (blocked at 1hp anyway).\n    [93023] = true,\n    \n    ----- Dungeons (6.0 Patch) -----\n    --- Shadowmoon Burial Grounds\n    -- Carrion Worm : They doesn't die but leave the area at 10%.\n    [88769] = true,\n    [76057] = true\n}\n\n-- Get the unit GUID.\nfunction Unit:GUID()\n    return UnitGUID(self.UnitID)\nend\n\n-- Get the unit NPC ID.\nfunction Unit:NPCID(BypassCache)\n    if not BypassCache and self.UseCache and self.UnitNPCID then\n        return self.UnitNPCID\n    end\n    \n    local GUID = self:GUID()\n    if GUID then\n        local UnitInfo = {}\n        \n        if not UnitInfo.NPCID then\n            local type, _, _, _, _, npcid = strsplit('-', GUID)\n            if type == \"Creature\" or type == \"Pet\" or type == \"Vehicle\" then\n                UnitInfo.NPCID = tonumber(npcid)\n            else\n                UnitInfo.NPCID = -2\n            end\n        end\n        return UnitInfo.NPCID\n    end\n    return -1\nend\n\n-- IsMfdBlacklisted function\nfunction Unit:IsMfdBlacklisted()\n    local npcid = self:NPCID()\n    if SpecialMfdBlacklistData[npcid] then\n        if type(SpecialMfdBlacklistData[npcid]) == \"boolean\" then\n            return true\n        else\n            return SpecialMfdBlacklistData[npcid](self)\n        end\n    end\n    return false\nend\n\n-- Get if two unit are the same.\nfunction Unit:IsUnit(Other)\n    return UnitIsUnit(self.UnitID, Other.UnitID)\nend\n\n-------------------------------------------------------------------------------\n-- Facing blacklisted check\n-------------------------------------------------------------------------------\nfunction Unit:IsFacingBlacklisted()\n    if self:IsUnit(A.UnitNotInFront) and TMW.time - A.UnitNotInFrontTime <= A.GetGCD() * A.GetToggle(2, \"BlacklistNotFacingExpireMultiplier\") then\n        return true\n    end\n    return false\nend\n\n------------------------------------\n--- MythicPlus system\n------------------------------------\n-- MythicPlus specific logic by class and specialisation\n-- @Return boolean\n-- @Usage: spec parameter is mandatory, latency is optional\n\nfunction TR:MythicPlus(spec, latency)\n    local secondsLeft, percentLeft, spellID, spellName, notInterruptable, isChannel = Unit(unit):IsCastingRemains()\n    local ExtraordinaryShouldPool = false\n    local LatencyModifier = 0\n    local PoolTimeValue = 0\n    \n    -- LatencyModifier\n    if latency then\n        LatencyModifier = LatencyModifier + Action.GetPing()\n    end    \n    \n    -- Check for nil\n    if spec then \n        \n        -- Havoc DH\n        if spec == \"havoc\" then    \n            PoolTimeValue = 5\n            \n            -- Tol Dagor\n            if A.ZoneID == 9327 and InstanceInfo.KeyStone and InstanceInfo.KeyStone > 1 then\n                -- Overseer Korgus - 1sec before his Dead Eye is ready\n                if Unit(\"boss1\"):GetUnitID() == 127503 and UnitCooldown:GetCooldown(\"boss1\", 256039) > UnitCooldown:GetMaxDuration(\"boss1\", 256039) - (1 + LatencyModifier) then\n                    \n                    --Pool for BladeDance                   \n                    ExtraordinaryShouldPool = true\n                    --TMW:Fire(\"TR_MYTHIC_PLUS_HAVOC_BLADEDANCE_TD1\")\n                    \n                end    \n            end\n            \n            -- King Rest \n            if A.ZoneID == 9526 and InstanceInfo.KeyStone and InstanceInfo.KeyStone > 1 then            \n                -- Aka'ali the Conqueror -  if it’s targeted on you to reduce group-wide damage to zero.\n                if Unit(\"boss1\"):GetUnitID() == 135470 and UnitIsUnit(\"targettarget\", \"player\") and UnitCooldown:GetCooldown(\"boss1\", 266951) > UnitCooldown:GetMaxDuration(\"boss1\", 266951) - (1 + LatencyModifier) then\n                    \n                    --Pool for BladeDance\n                    ExtraordinaryShouldPool = true\n                    --TMW:Fire(\"TR_MYTHIC_PLUS_HAVOC_BLADEDANCE_KR1\")\n                    \n                end    \n            end\n            \n            -- Freehold \n            if A.ZoneID == 9164 and InstanceInfo.KeyStone and InstanceInfo.KeyStone > 1 then            \n                -- Captain Eudora - Powder Shot deal high damage\n                if Unit(\"boss1\"):GetUnitID() == 126848 and Unit(\"boss1\"):GetSpellLastCast(A.HowlingBlast) and UnitCooldown:GetCooldown(\"boss1\", 266951) > UnitCooldown:GetMaxDuration(\"boss1\", 266951) - (1 + LatencyModifier) then\n                    \n                    --Pool for BladeDance\n                    ExtraordinaryShouldPool = true\n                    --TMW:Fire(\"TR_MYTHIC_PLUS_HAVOC_BLADEDANCE_FH1\")\n                    \n                end                \n            end\n            \n        end            \n    end\n    return ExtraordinaryShouldPool\nend\n\n--------------------------------------\n------- Taste Custom Functions -------\n--------------------------------------\n-- Since they need some CustomStuff snippets that load in 0.6, these function only work in this CustomPvE snippets that load in 1\n-- Only checks IsUsableP against the primary resource for pooling\n-- /dump Action[Action.PlayerSpec].WarStomp:IsUsablePPool()\n-- /dump Action[Action.PlayerSpec].WarStomp.ID:IsUsablePPool()\nfunction A:IsUsablePPool(Offset)\n    local CostInfo, TypeInfo = self:GetSpellPowerCost()     \n    --print(CostInfo)\n    --print(TypeInfo)\n    if CostInfo and TypeInfo then\n        return ( Player.PredictedResourceMap[TypeInfo]() >= ( CostInfo + ( Offset and Offset or 0 ) ) )\n    else\n        return true\n    end\nend\n\n-- Base Duration of a dot/hot/channel...\nlocal SpellDuration = TR.Enum.SpellDuration\nfunction A:BaseDuration()\n    local Duration = SpellDuration[self.ID]\n    if not Duration or Duration == 0 then \n        return 0 \n    end\n    local BaseDuration = Duration[1]\n    return BaseDuration / 1000\nend\n\n-- Max Duration of a dot/hot/channel...\nfunction A:MaxDuration()\n    local Duration = SpellDuration[self.ID]\n    if not Duration or Duration == 0 then \n        return 0 \n    end\n    local BaseDuration = Duration[2]\n    return BaseDuration / 1000\nend\n\n-- action.foo.travel_time\nlocal ProjectileSpeed = TR.Enum.ProjectileSpeed\nfunction A:FilterProjectileSpeed(SpecID)\n    local RegisteredSpells = {}\n    local BaseProjectileSpeed = TR.Enum.ProjectileSpeed -- In case FilterTravelTime is called multiple time, we take the Enum table as base.\n    -- Fetch registered spells during the init\n    for Spec, Spells in pairs(Action[Action.PlayerSpec]) do\n        for _, Spell in pairs(Spells) do\n            local SpellID = Spell.ID\n            local ProjectileSpeedInfo = BaseProjectileSpeed[SpellID]\n            if ProjectileSpeedInfo ~= nil then\n                RegisteredSpells[SpellID] = ProjectileSpeedInfo\n            end\n        end\n    end\n    ProjectileSpeed = RegisteredSpells\nend\n\nfunction A:TravelTime()\n    local Speed = ProjectileSpeed[self.ID]\n    if not Speed or Speed == 0 then \n        return 0 \n    end\n    return ACTION_CONST_CACHE_DEFAULT_NAMEPLATE_MAX_DISTANCE / (ProjectileSpeed[self.ID] or 22)\nend\n\nlocal L                                     = setmetatable({\n        ruRU = {\n            TasteInterruptName = \"BFA Mythic+ & Raid (by Dizzy)\",\n        },    \n        enUS = {\n            TasteInterruptName = \"BFA Mythic+ & Raid (by Dizzy)\",\n        },    \n    }, { __index = function(t) return t.enUS end })\n\nTMW:RegisterCallback(\"TMW_ACTION_INTERRUPTS_UI_CREATE_CATEGORY\", function(callbackEvent, Category)\n        Category.options[#Category.options + 1] = { text = L[GameLocale].TasteInterruptName, value = \"TasteBFAContent\" }\n        Category:SetOptions(Category.options)\nend)\n\n-- Custom BFA Interrupt list\n-- Factory[4].TasteBFAContent\n-- /dump Action.StdUi.Factory[4].TasteBFAContent[Action.FormatGameLocale(_G.GetLocale())][256060].useCC\nFactory[4].TasteBFAContent = StdUi:tGenerateMinMax({\n        [GameLocale] = {    \n            ISINTERRUPT = true,\n            -- Freehold\n            [256060] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [257397] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [257899] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [257736] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [257739] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [257756] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [257784] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [257870] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [258779] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [274383] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [274400] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [274507] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [281420] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            -- Atal'Dazar\n            [250096] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [252781] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [252923] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [253562] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [253583] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [253666] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [254959] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [255041] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [255824] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [256849] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [258653] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [259572] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [260668] = { useKick = false, useCC = true, useRacial = true }, -- CC        \n            -- King's Rest\n            [269931] = { useKick = false, useCC = true, useRacial = true }, -- CC    \n            [269972] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [269973] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [270084] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [270482] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [270492] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [270493] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [270507] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [270872] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [270901] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [270920] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [270923] = { useKick = false, useCC = false, useRacial = false }, -- Block    \n            -- Shrine of the Storm\n            [267809] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [267969] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [267973] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [267977] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [267981] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268030] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268050] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [268177] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [268273] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268309] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [268317] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268322] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268375] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [274437] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [274703] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [276297] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [276292] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [274631] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268315] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268347] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [267818] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            --[276266]    Purge    \n            \n            -- Siege of Boralus    \n            [256957] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [272571] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [272581] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [272588] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [274569] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [274941] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [256627] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [257641] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [257292] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [256866] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            -- Temple of Seth\n            [255741] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [263318] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [263775] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [264574] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265912] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [265968] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [267237] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268008] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268061] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268703] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [269116] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [272657] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [272659] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [272696] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [272700] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [272820] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [274642] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            \n            -- Motherload\n            [258627] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [262092] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [262377] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [262540] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [262554] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [262794] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [262947] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [263066] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [263103] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [263202] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [263215] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [267354] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268129] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268702] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268709] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268797] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268865] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [269302] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [280604] = { useKick = true, useCC = true, useRacial = true }, -- All\n            \n            -- Underrot\n            [260879] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [265081] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [265084] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265089] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265091] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265376] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265377] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265433] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [265487] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265523] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [265540] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265568] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [265668] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [266106] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [266107] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [266201] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [266209] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [272180] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [272183] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [278755] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [278961] = { useKick = true, useCC = true, useRacial = true }, -- All\n            \n            -- Tol Dagor    \n            [258128] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [258150] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [258153] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [258313] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [258317] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [258634] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [258864] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [258869] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [258917] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [258935] = { useKick = true, useCC = true, useRacial = true }, -- All\n            \n            -- Waycrest    \n            [260699] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [260700] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [260701] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [263891] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [263943] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [263959] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [264024] = { useKick = false, useCC = false, useRacial = false }, -- Block\n            [264050] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [264105] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [264153] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [264390] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [264396] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [264520] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [264525] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265346] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265368] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265407] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [265876] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [266035] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [266036] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [266225] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [267824] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [268202] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [268278] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [271174] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [278444] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [278463] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [278474] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [278504] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [278551] = { useKick = true, useCC = true, useRacial = true }, -- All\n            \n            -- Workshop    \n            [293729] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [293827] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [293930] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [293986] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [294195] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [294290] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [294324] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            \n            -- Junkyard    \n            [7289] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [299475] = { useKick = false, useCC = true, useRacial = true }, -- CC\n            [31532] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [158338] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [284507] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [48604] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [8365] = { useKick = true, useCC = false, useRacial = false }, -- Kick/Purge\n            [299415] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [300650] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [28995] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [300436] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            \n            -- Nyalotha     \n            [316211] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [313652] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [15407] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [310788] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [29184] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [136993] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            \n            -- Awakened    \n            [314592] = { useKick = true, useCC = true, useRacial = true }, -- All\n            [314406] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            [314411] = { useKick = true, useCC = false, useRacial = false }, -- Kick\n            \n        },            \n    }, 43, 70, math_random(87, 95), true)",
			}, -- [3]
			{
				["Order"] = 0.7,
				["Name"] = "Custom changelog",
				["Code"] = "---------------------------------------------------\n------------ CUSTOM CHANGELOG FUNCTIONS -----------\n---------------------------------------------------\nlocal TMW                                   = TMW\nlocal _G, type, error, time                 = _G, type, error, time\nlocal A                                     = _G.Action\nlocal TeamCache                                = Action.TeamCache\nlocal EnemyTeam                                = Action.EnemyTeam\nlocal FriendlyTeam                            = Action.FriendlyTeam\nlocal LoC                                    = Action.LossOfControl\nlocal Player                                = Action.Player \nlocal MultiUnits                            = Action.MultiUnits\nlocal UnitCooldown                            = Action.UnitCooldown\nlocal ActiveUnitPlates                        = MultiUnits:GetActiveUnitPlates()\nlocal next, pairs, type, print              = next, pairs, type, print\nlocal IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo = IsActionInRange, GetActionInfo, PetHasActionBar, GetPetActionsUsable, GetSpellInfo\nlocal UnitIsPlayer, UnitExists, UnitGUID    = UnitIsPlayer, UnitExists, UnitGUID\nlocal PetLib                                = LibStub(\"PetLibrary\")\nlocal Unit                                  = Action.Unit \nlocal huge                                  = math.huge\nlocal UnitBuff                              = _G.UnitBuff\nlocal UnitIsUnit                            = UnitIsUnit\nlocal StdUi                                 = LibStub(\"StdUi\")\n-- Lua\nlocal error                                 = error\nlocal setmetatable                          = setmetatable\nlocal stringformat                          = string.format\nlocal tableinsert                           = table.insert\nlocal TR                                    = Action.TasteRotation\n\n-------------------------------------------------------------------------------\n-- Profil Loader\n-------------------------------------------------------------------------------\n-- Load default profils for each class\nlocal currentClass = select(2, UnitClass(\"player\"))\nlocal currentSpec = GetSpecialization()\nlocal currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or \"None\"\n\n-- Druid\nif currentClass == \"WARRIOR\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Warrior\"\nend\n\n-- Warlock\nif currentClass == \"WARLOCK\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Warlock\"\nend\n\n-- Rogue\nif currentClass == \"ROGUE\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Rogue\"\nend\n\n-- Shaman\nif currentClass == \"SHAMAN\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Shaman\"\nend\n\n-- DeathKnight\nif currentClass == \"DEATHKNIGHT\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Death Knight\"\nend\n\n-- Priest\nif currentClass == \"PRIEST\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Priest\"\nend\n\n-- Paladin\nif currentClass == \"PALADIN\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Paladin\"\nend\n\n-- Mage\nif currentClass == \"MAGE\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Mage\"\nend\n\n-- Hunter\nif currentClass == \"HUNTER\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Hunter\"\nend\n\n-- Demon Hunter\nif currentClass == \"DEMONHUNTER\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Demon Hunter\"\nend\n\n-- Druid\nif currentClass == \"DRUID\" then\n    Action.Data.DefaultProfile[currentClass] = \"[Taste]Action - Druid\"\nend\n\n\n\n--------------------------------------\n--------- POPUP/CHANGELOG API --------\n--------------------------------------\n-- Return a popup message on player login that show all the latest change for rotations. \n-- Each classes got a ProfileUI button to enable/disable this option. (In case of Streaming)\n\n-- Init popup\nTR.Popup = {\n    popupname = Action.PlayerSpec,\n    message = \"\",\n    button1 = \"\",\n    button2 = \"\",\n    timeout = 0,\n    whileDead = true,\n    hideOnEscape = true,    \n}\n\n-- Popup Creation function.\n-- @Return string depending of current player specialization\n-- @Usage TR:CreatePopup(PlayerSpec, TR.PlayerSpec.Changelog, \"OK\", nil, 0, true, true)\nfunction TR:CreatePopup(popupname, message, button1, button2, timeout, whileDead, hideOnEscape)\n    local Errormessage = \"Error on popup : You did not set any message.\"\n    local Errorbutton = \"Cancel\"\n    --local PlayerSpec = Action.PlayerSpec\n    \n    if popupname then\n        TR.Popup.popupname = popupname\n    else\n        TR.Popup.popupname = 999\n    end\n    \n    if message then \n        TR.Popup.message = message\n    else\n        TR.Popup.message = Errormessage\n    end\n    \n    if button1 then\n        TR.Popup.button1 = button1\n    else\n        TR.Popup.button1 = Errorbutton\n    end\n    \n    if button2 then\n        TR.Popup.button2 = button2\n    else\n        TR.Popup.button2 = Errorbutton\n    end    \n    \n    if timeout then \n        TR.Popup.timeout = timeout\n    else\n        TR.Popup.timeout = 0\n    end\n    \n    if whileDead then\n        TR.Popup.whileDead = whileDead\n    end\n    \n    if hideOnEscape then\n        TR.Popup.hideOnEscape = hideOnEscape\n    end   \n    \n    return TR.Popup.popupname, TR.Popup.message, TR.Popup.button1, TR.Popup.button2, TR.Popup.timeout, TR.Popup.whileDead, TR.Popup.hideOnEscape\n    \nend\n\n-- Changelog handler for each specialisation\n-- @To do: find a way to improve ingame indentation and presentation\nfunction TR:UpdateChangeLog()\nlocal PlayerSpec = Action.PlayerSpec\n\n--------------------\n------ SHAMAN ------\n--------------------\n    -- Elemental\n    if PlayerSpec == 262 then\n        ChangeLog = [[\n        Welcome to Taste - Elemental Shaman !\n        \nList of latest changes :\n\n- New : Blocked Spells Status Frame (see 2nd tab)\n- Fixed Elemental Blast behavior\n- Reworked DBM opener\n- Fixed Healing Surge                \n\nAs always, please report on Discord or message me directly if you need anything !\n]]  \n\n    end    \n    -- Enhancement\n    if PlayerSpec == 263 then\n        ChangeLog = [[\n        Welcome to Taste - Enhancement Shaman !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n\n    end\n    \n    -- Restoration\n    if PlayerSpec == 264 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                    \n    end\n    \n--------------------\n----- PALADIN ------\n--------------------    \n    -- Retribution\n    if PlayerSpec == 70 then\n        ChangeLog = [[\n        Welcome to Taste - Retribution Paladin !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n    \n    -- Protection\n    if PlayerSpec == 66 then\n        ChangeLog = [[\n        Welcome to Taste - Protection Paladin !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n    \n    -- Holy\n    if PlayerSpec == 65 then\n        ChangeLog = [[\n        Welcome to Taste - Holy Paladin !\n        \n        ***** TEST BUILD *****    \n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]                  \n    end\n\n--------------------\n----- WARLOCK ------\n--------------------\n    -- Affliction\n    if PlayerSpec == 265 then\n        ChangeLog = [[\n        Welcome to Taste - Affliction Warlock !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Demonology\n    if PlayerSpec == 266 then\n        ChangeLog = [[\n        Welcome to Taste - Demonology Warlock !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Destruction\n    if PlayerSpec == 267 then\n        ChangeLog = [[\n        Welcome to Taste - Destruction Warlock !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end    \n    \n\n\n--------------------\n----- WARRIOR ------\n--------------------\n    -- Arms\n    if PlayerSpec == 71 then\n        ChangeLog = [[\n        Welcome to Taste - Arms Warrior !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Fury\n    if PlayerSpec == 72 then\n        ChangeLog = [[\n        Welcome to Taste - Fury Warrior !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Protection\n    if PlayerSpec == 73 then\n        ChangeLog = [[\n        Welcome to Taste - Protection Warrior !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n\n--------------------\n--- DEATHKNIGHT ----\n--------------------\n    -- Blood\n    if PlayerSpec == 250 then\n        ChangeLog = [[\n        Welcome to Taste - Blood Death Knight !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Frost\n    if PlayerSpec == 251 then\n        ChangeLog = [[\n        Welcome to Taste - Frost Death Knight !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Unholy\n    if PlayerSpec == 252 then\n        ChangeLog = [[\n        Welcome to Taste - Unholy Death Knight !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n\n--------------------\n--- DEMON HUNTER ---\n--------------------\n    -- Havoc\n    if PlayerSpec == 577 then\n        ChangeLog = [[\n        Welcome to Taste - Havoc Demon Hunter !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Vengeance\n    if PlayerSpec == 581 then\n        ChangeLog = [[\n        Welcome to Taste - Vengeance Demon Hunter !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n\n--------------------\n------ ROGUE -------\n--------------------\n    -- Assassination\n    if PlayerSpec == 259 then\n        ChangeLog = [[\n        Welcome to Taste - Assassination Rogue !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Outlaw\n    if PlayerSpec == 260 then\n        ChangeLog = [[\n        Welcome to Taste - Outlaw Rogue !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Subtlety\n    if PlayerSpec == 261 then\n        ChangeLog = [[\n        Welcome to Taste - Subtely Rogue !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]\n                    \n    end\n\n\n--------------------\n------ HUNTER ------\n--------------------\n    -- BeastMastery\n    if PlayerSpec == 253 then\n        ChangeLog = [[\n        Welcome to Taste - BeastMastery Hunter !\n\nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Marksmanship\n    if PlayerSpec == 254 then\n        ChangeLog = [[\n        Welcome to Taste - Marksmanship Hunter !\n                \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]\n                    \n    end\n\n    -- Survival\n    if PlayerSpec == 255 then\n        ChangeLog = [[\n        Welcome to Taste - Survival Hunter !\n                \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n\n--------------------\n------- MAGE -------\n--------------------\n    -- Arcane\n    if PlayerSpec == 62 then\n        ChangeLog = [[\n        Welcome to Taste - Arcane Mage !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n\n]]                  \n    end\n\n    -- Fire\n    if PlayerSpec == 63 then\n        ChangeLog = [[\n        Welcome to Taste - Fire Mage !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n\n]]                 \n    end\n\n    -- MFrost\n    if PlayerSpec == 64 then\n        ChangeLog = [[\n        Welcome to Taste - Frost Mage !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n\n]]                 \n    end\n\n\n--------------------\n------ DRUID -------\n--------------------\n    -- Balance\n    if PlayerSpec == 102 then\n        ChangeLog = [[\n        Welcome to Taste - Balance Druid !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Feral\n    if PlayerSpec == 103 then\n        ChangeLog = [[\n        Welcome to Taste - Feral Druid !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    -- Guardian\n    if PlayerSpec == 104 then\n        ChangeLog = [[\n        Welcome to Taste - Guardian Druid !\n        \nList of latest changes :\n\n- New : Blocked Spells Status Frame (see 2nd tab)\n- Updated to 8.3 APLs\n- Fix on AutoTaunt\n- Fixed Arcane Torrent logic\n\nTODO : Rework all defensives logic            \n\nAs always, please report on Discord or message me directly if you need anything !\n]]  \n                    \n    end\n\n    -- Restoration\n    if PlayerSpec == 105 then\n        ChangeLog = [[\n        Welcome to Taste - Restoration Druid !\n        \nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n\n--------------------\n------- MONK -------\n--------------------\n    -- Brewmaster\n    if PlayerSpec == 268 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                    \n    end\n\n    -- Windwalker\n    if PlayerSpec == 269 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                \n    end\n\n    -- Mistweaver\n    if PlayerSpec == 270 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                \n    end\n\n\n--------------------\n------ PRIEST ------\n--------------------\n    -- Discipline\n    if PlayerSpec == 256 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                \n    end\n\n    -- PHoly\n    if PlayerSpec == 257 then\n        ChangeLog = \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\"                \n    end\n\n    -- Shadow\n    if PlayerSpec == 258 then\n        ChangeLog = [[\n        Welcome to Taste - Shadow Priest !\n\nPrepatch rotations are not optimized and are just a way to play until Shadowlands is out. \n\nRotations will stay in an unstable state until Shadowlands release.\n\nThanks for comprehension.\n]]  \n                    \n    end\n\n    return ChangeLog\nend\n\n-- Love Popup\n-- This is secret popup :)\nStaticPopupDialogs[\"LOVE_POPUP\"] = {\n  text = \"Hey there ! Thanks for clicking the love button :)\\n\\nLove is the most important part :)\\n\\nDon't forget that you can ask me whatever you want on rotations. Feedbacks are really appreciated if you got optimized gear for the current content and see some rotations mistakes !\\n\\nCreating good profils is long task and take a lot of time as you can imagine. I will always try to do my best to satisfy everyone so do not hesitate to discord me if needed!\\n\\nHave a good game and thanks for reading !\\n\\nPS:Don't forget to post logs on discord :)\",\n  button1 = \"Okay :)\",\n  button2 = \"Close\",\n  OnAccept = function()\n      StaticPopup_Hide (\"LOVE_POPUP\")\n  end,\n  timeout = 0,\n  whileDead = true,\n  hideOnEscape = true,\n  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/\n}\n\n------------------------\n-- CHANGELOG CALLBACK --\n------------------------ \nTMW:RegisterCallback(\"TMW_ACTION_IS_INITIALIZED\", function()\n\n-- Spec specific Popup\nlocal PlayerSpec = Action.PlayerSpec\nlocal currentChangelog = TR:UpdateChangeLog()\nlocal Errormessage = \"Error on popup : You did not set any message.\"\nlocal profileName = TMW.db:GetCurrentProfile()\nlocal ChangelogOnStartup = A.GetToggle(2, \"ChangelogOnStartup\")\n\n    -- Dynamic popup creation\n    if Action.PlayerSpec and ChangelogOnStartup then\n        TR:CreatePopup(Action.PlayerSpec, currentChangelog, \"Okay\", \"Marry Me\", 0, true, true)\n    else     \n        TR:CreatePopup(999, \"Welcome to Taste Rotations !\\n\\nThis spec is currently in developpement.\\n\\nFollow latests update on Discord.\", \"OK\", nil, 0, true, true)\n    end    \n    \n    -- Create Popup Frame dynamically \n    StaticPopupDialogs[TR.Popup.popupname] = {\n        text = TR.Popup.message, --\"Do you want to greet the world today?\",\n        button1 = TR.Popup.button1, --\"Yes\", -- On ACCEPT\n        button2 = TR.Popup.button2, --\"No\", -- On CANCEL\n        OnAccept = function()\n            StaticPopup_Hide (TR.Popup.popupname)\n        end,\n        OnCancel = function()\n            StaticPopup_Show (\"LOVE_POPUP\")\n        end,\n        timeout = TR.Popup.timeout,\n        whileDead = TR.Popup.whileDead,\n        hideOnEscape = TR.Popup.hideOnEscape,\n        preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/\n    }\n\n    -- Check for Taste profils\n    if PlayerSpec then\n        if profileName:match(\"Taste\") then\n            if PlayerSpec and ChangelogOnStartup then\n                StaticPopup_Show (PlayerSpec)\n            end\n        end\n    end\n    \nend)",
			}, -- [4]
			{
				["Order"] = 0.8,
				["Name"] = "Custom enums duration",
			}, -- [5]
			{
				["Order"] = 0.8,
				["Name"] = "Custom enums travel",
			}, -- [6]
			{
				["Name"] = "Ryan Support",
				["Code"] = "local _G, select, setmetatable                            = _G, select, setmetatable\n\nlocal TMW                                                 = _G.TMW\n\nlocal A                                                 = _G.Action\n\nlocal Unit                                                = A.Unit\nlocal GameLocale                                        = A.FormatGameLocale(_G.GetLocale())\nlocal StdUi                                                = A.StdUi\nlocal Factory                                            = StdUi.Factory\nlocal math_random                                        = math.random\nlocal player                                             = \"player\"\npartyIDs                                                = {\n    [1] = \"party1\",\n    [2] = \"party2\",\n}\narenaIDs                                            = {\n    [1] = \"arena1\",\n    [2] = \"arena2\",\n    [3] = \"arena3\",\n}\n\n\nlocal L                                                = setmetatable(\n    {\n        ruRU                                         = {InterruptName         = \"SLs Mythic+ (by Ryan)\",},\n        enUS                                         = {InterruptName         = \"SLs Mythic+ (by Ryan)\",},\n    }, \n    { __index = function(t) return t.enUS end })\n\nTMW:RegisterCallback(\"TMW_ACTION_INTERRUPTS_UI_CREATE_CATEGORY\", function(callbackEvent, Category)\n        local CL = Action.GetCL()\n        Category.options[#Category.options + 1] = { text = L[GameLocale].InterruptName, value = \"RyanInterrupts\" }\n        Category:SetOptions(Category.options)\nend)\n\nFactory[4].RyanInterrupts = StdUi:tGenerateMinMax({\n        [GameLocale] = {\n            ISINTERRUPT = true,\n            --De Other Side\n            [332329] = { useKick = false, useCC = true, useRacial = true    }, --Devoted Sacrifice;         CC\n            [332671] = { useKick = false, useCC = true, useRacial = true    }, --Bladestorm;                CC\n            [332666] = { useKick = true, useCC = false, useRacial = false   }, --Renew;                     Kick\n            [332706] = { useKick = true, useCC = false, useRacial = false   }, --Heal;                      Kick\n            [332612] = { useKick = true, useCC = false, useRacial = false   }, --Healing Wave;              Kick\n            [331927] = { useKick = false, useCC = false, useRacial = false  }, --Haywire;                   Block\n            [332084] = { useKick = true, useCC = false, useRacial = false   }, --Self-Cleaning Cycle;       Kick\n            [340026] = { useKick = false, useCC = true, useRacial = true    }, --Wailing Grief;             CC\n            [321764] = { useKick = true, useCC = false, useRacial = false   }, --Bark Armor;                 Kick    \n            [320008] = { useKick = true, useCC = false, useRacial = false   }, --Frostbolt;                 Kick\n            [332608] = { useKick = true, useCC = false, useRacial = false   }, --Lightning Discharge;       Kick    \n            [328729] = { useKick = true, useCC = false, useRacial = false   }, --Dark Lotus;                 Kick    \n            [332605] = { useKick = true, useCC = true, useRacial = true     }, --Hex;                         Kick+CC\n            -- Halls of Attonement\n            [325523] = { useKick = false, useCC = true, useRacial = true    }, --Deadly Thrust;             CC\n            [326450] = { useKick = false, useCC = true, useRacial = true    }, --Loyal Beasts;              CC\n            [325700] = { useKick = true, useCC = false, useRacial = false   }, --Collect Sins;              Kick\n            [325701] = { useKick = true, useCC = true, useRacial = true     }, --Siphon Life;               Kick+CC\n            [326607] = { useKick = true, useCC = false, useRacial = false   }, --Turn to Stone;             Kick\n            [323552] = { useKick = true, useCC = false, useRacial = false    }, --Volley of Power; Kick            \n            [323538] = { useKick = true, useCC = false, useRacial = false    }, --Bolt of Power; Kick            \n            -- Mists of Tirna Scithe\n            [322938] = { useKick = true, useCC = false, useRacial = false   }, --Harvest Essence;           Kick\n            [322486] = { useKick = false, useCC = true, useRacial = true    }, --Overgrowth;                CC\n            [324914] = { useKick = true, useCC = false, useRacial = false   }, --Nourish the Forest;        Kick\n            [324776] = { useKick = true, useCC = false, useRacial = false   }, --Bramblethorn Coat;         Kick\n            [326046] = { useKick = true, useCC = true, useRacial = true     }, --Stimulate Resistance;      Kick+CC            \n            [340544] = { useKick = true, useCC = true, useRacial = true     }, --Stimulate Regeneration;    Kick+CC    \n            [337235] = { useKick = true, useCC = false, useRacial = false   }, --Parasitic Pacification;    Kick\n            [337251] = { useKick = true, useCC = false, useRacial = false   }, --Parasitic Incapacitation;  Kick\n            [337253] = { useKick = true, useCC = false, useRacial = false   }, --Parasitic Domination;      Kick\n            [326021] = { useKick = false, useCC = true, useRacial = true    }, --Acid Globule;              CC            \n            [331718] = { useKick = false, useCC = true, useRacial = true    }, --Spear Flurry;              CC                    \n            [331743] = { useKick = false, useCC = true, useRacial = true    }, --Bucking Rampage;           CC    \n            [322450] = { useKick = true, useCC = false, useRacial = false   }, --Consumption;      Kick\n            -- Necrotic Wake\n            [334748] = { useKick = true, useCC = true, useRacial = true     }, --Drain Fluids;              Kick+CC\n            [320462] = { useKick = true, useCC = false, useRacial = false   }, --Necrotic Bolt;             Kick            \n            [324293] = { useKick = true, useCC = true, useRacial = true     }, --Rasping Scream;            Kick+CC            \n            [320170] = { useKick = true, useCC = false, useRacial = false   }, --Necrotic Bolt;             Kick            \n            [338353] = { useKick = true, useCC = true, useRacial = true     }, --Goresplatter;              Kick+CC\n            [334748] = { useKick = true, useCC = true, useRacial = true     }, --Drain Fluids;              Kick+CC\n            [323190] = { useKick = true, useCC = true, useRacial = true     }, --meat shield;               Kick+CC            \n            [335143] = { useKick = false, useCC = false, useRacial = false    }, --Bonemend;                     Block        Does Damage if shield is broken, dont stop cast    \n            [327130] = { useKick = true, useCC = false, useRacial = false   }, --Repair Flesh;              Kick \n            --Plaguefall\n            [328177] = { useKick = false, useCC = true, useRacial = true    }, --Fungistorm;                CC            \n            [330403] = { useKick = false, useCC = false, useRacial = false  }, --Wing Buffet;                 Block           \n            [318949] = { useKick = false, useCC = true, useRacial = true    }, --Festering Belch;           CC            \n            [319070] = { useKick = true, useCC = false, useRacial = false   }, --Corrosive Gunk;            Kick            \n            [336451] = { useKick = false, useCC = true, useRacial = true    }, --Bulwark of Maldraxxus;     CC            \n            [328400] = { useKick = false, useCC = true, useRacial = true    },     --Stealthlings;             CC \n            [328180] = { useKick = true, useCC = true, useRacial = true     },     --Gripping Infection;         Kick+CC\n            [321999] = { useKick = true, useCC = false, useRacial = false   }, --Viral Globs;                Kick\n            [328429] = { useKick = false, useCC = true, useRacial = true    },     --Crushing Embrace;         CC\n            [328094] = { useKick = true, useCC = false, useRacial = false   }, --Pestilence Bolt;           Kick             \n            --Sanguine Depths\n            [319654] = { useKick = true, useCC = false, useRacial = false   }, --Hungering Drain;           Kick\n            [322433] = { useKick = true, useCC = false, useRacial = false   }, --Stoneskin;                 Kick\n            [321038] = { useKick = true, useCC = false, useRacial = false   }, --Wrack Soul;                Kick \n            [334653] = { useKick = true, useCC = false, useRacial = false    }, --Engorge; Kick\n            [335305] = { useKick = true, useCC = false, useRacial = false    }, --Barbed Shackles; Kick\n            [336277] = { useKick = true, useCC = false, useRacial = false    }, --Explosive Anger; Kick            \n            [326952] = { useKick = true, useCC = false, useRacial = false    }, --Fiery Cantrip Kick\n            [324609] = { useKick = false, useCC = true, useRacial = true    }, --Animate Weapon; CC\n            [326836] = { useKick = true, useCC = true, useRacial = true    }, --Curse of Suppression Kick+CC\n            --Spires of Ascension\n            [327413] = { useKick = true, useCC = false, useRacial = false   }, --Rebellious Fist;           Kick            \n            [317936] = { useKick = true, useCC = false, useRacial = false   }, --Forsworn Doctrine;         Kick            \n            [317963] = { useKick = true, useCC = false, useRacial = false   }, --Burden of Knowledge;       Kick\n            [328295] = { useKick = true, useCC = true, useRacial = true     }, --Greater Mending;           Kick+CC\n            [328137] = { useKick = true, useCC = false, useRacial = false   }, --Dark Pulse;                Kick\n            [328331] = { useKick = true, useCC = false, useRacial = false   }, --Forced Confession;         Kick\n            --Theater of Pain\n            [341902] = { useKick = true, useCC = false, useRacial = false   }, --Unholy Fervor;             Kick            \n            [341969] = { useKick = true, useCC = true, useRacial = true     }, --Withering Discharge        Kick+CC\n            [342139] = { useKick = true, useCC = false, useRacial = false   }, --Battle Trance;             Kick        \n            [330562] = { useKick = true, useCC = false, useRacial = false   }, --Demoralizing Shout;        Kick\n            [330810] = { useKick = true, useCC = true, useRacial = true     }, --Bind Soul;                 Kick+CC  \n            [330586] = { useKick = false, useCC = true, useRacial = true    }, --Devour Flesh                CC \n            [342675] = { useKick = true, useCC = true, useRacial = true     }, --Bone Spear;                Kick+CC  \n            [330868] = { useKick = true, useCC = true, useRacial = true     }, --Necrotic Bolt volley;      Kick+CC  \n            [341771] = { useKick = true, useCC = false, useRacial = false   }, --Grave Spike;                Kick            \n            [330532] = { useKick = false, useCC = true, useRacial = true    }, --Jagged Quarrel             CC                        \n            [330875] = { useKick = true, useCC = false, useRacial = false   }, --Spirit Frost;                Kick    \n            [319669] = { useKick = true, useCC = false, useRacial = false   }, --Spectral Reach;            Kick    \n            -- Castle Nathria\n            [325590] = { useKick = true, useCC = false, useRacial = false   }, --Scornful Blast;            Kick\n            [328254] = { useKick = true, useCC = false, useRacial = false   }, --Shattering Ruby;            Kick\n            [333002] = { useKick = true, useCC = false, useRacial = false   }, --Vulgar Brand;                Kick\n            [337110] = { useKick = true, useCC = false, useRacial = false   }, --Dreadbolt Volley;            Kick\n            \n            --[[ Templates\n            [] = { useKick = false, useCC = false, useRacial = false}    , -- Block\n            [] = { useKick = true, useCC = true, useRacial = true    }, -- Kick+CC\n            [] = { useKick = true, useCC = false, useRacial = false    }, -- Kick\n            [] = { useKick = false, useCC = true, useRacial = true    }, -- CC\n            --]]\n            \n        },\n    }, 43, 70, math_random(87, 95), true)\n\n\n\n",
			}, -- [7]
			["n"] = 7,
		},
		["Groups"] = {
			{
				["GUID"] = "TMW:group:1RCgER2LDYMA",
				["Point"] = {
					["y"] = -52.1353299047438,
					["x"] = -29.9,
					["point"] = "TOPLEFT",
					["relativePoint"] = "TOPLEFT",
				},
				["Scale"] = 1.40016186237335,
				["Locked"] = true,
				["Enabled"] = false,
				["Columns"] = 1,
				["Icons"] = {
					{
						["Type"] = "conditionicon",
						["GUID"] = "TMW:icon:1RCgCsBLK7pm",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "local icon = ...\nicon:SetInfo(\"texture\", 397907) \n\n\n\n",
								["Event"] = "OnEventsRestored",
								["Frequency"] = 0,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["Texts"] = {
									[2] = "",
								},
							},
						},
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
						["FakeHidden"] = true,
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return chat()",
							}, -- [1]
							["n"] = 1,
						},
					}, -- [1]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [2]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [3]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [4]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [5]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [6]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [7]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [8]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [9]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [10]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [11]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [12]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [13]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [14]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [15]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [16]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [17]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [18]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [19]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [20]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [21]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [22]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [23]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [24]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [25]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [26]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [27]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [28]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [29]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [30]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [31]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [32]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [33]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [34]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [35]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [36]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [37]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [38]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [39]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [40]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [41]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [42]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [43]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [44]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [45]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [46]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [47]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [48]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [49]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [50]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [51]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [52]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [53]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [54]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [55]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [56]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [57]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [58]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [59]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [60]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [61]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [62]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [63]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [64]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [65]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [66]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [67]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [68]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [69]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [70]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [71]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [72]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [73]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [74]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [75]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [76]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [77]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [78]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [79]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [80]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [81]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [82]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [83]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [84]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [85]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [86]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [87]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [88]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [89]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [90]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [91]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [92]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [93]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [94]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [95]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [96]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [97]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [98]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [99]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [100]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [101]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [102]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [103]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [104]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [105]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [106]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [107]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [108]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [109]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [110]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [111]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [112]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [113]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [114]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [115]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [116]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [117]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [118]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [119]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [120]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [121]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [122]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [123]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [124]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [125]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [126]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [127]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [128]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [129]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [130]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [131]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [132]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [133]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [134]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [135]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [136]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [137]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [138]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [139]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [140]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [141]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [142]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [143]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [144]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [145]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [146]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [147]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [148]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [149]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [150]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [151]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [152]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [153]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [154]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [155]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [156]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [157]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [158]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [159]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [160]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [161]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [162]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [163]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [164]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [165]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [166]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [167]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [168]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [169]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [170]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [171]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [172]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [173]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [174]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [175]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [176]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [177]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [178]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [179]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [180]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [181]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [182]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [183]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [184]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [185]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [186]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [187]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [188]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [189]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [190]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [191]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [192]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [193]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [194]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [195]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [196]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [197]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [198]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [199]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [200]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [201]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [202]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [203]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [204]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [205]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [206]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [207]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [208]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [209]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [210]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [211]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [212]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [213]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [214]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [215]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [216]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [217]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [218]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [219]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [220]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [221]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [222]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [223]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [224]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [225]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [226]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [227]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [228]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [229]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [230]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [231]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [232]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [233]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [234]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [235]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [236]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [237]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [238]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [239]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [240]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [241]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [242]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [243]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [244]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [245]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [246]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [247]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [248]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [249]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [250]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [251]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [252]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [253]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [254]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [255]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [256]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [257]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [258]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [259]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [260]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [261]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [262]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [263]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [264]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [265]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [266]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [267]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [268]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [269]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [270]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [271]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [272]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [273]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [274]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [275]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [276]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [277]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [278]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [279]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [280]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [281]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [282]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [283]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [284]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [285]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [286]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [287]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [288]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [289]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [290]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [291]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [292]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [293]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [294]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [295]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [296]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [297]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [298]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [299]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [300]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [301]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [302]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [303]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [304]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [305]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [306]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [307]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [308]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [309]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [310]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [311]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [312]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [313]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [314]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [315]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [316]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [317]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [318]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [319]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [320]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [321]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [322]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [323]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [324]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [325]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [326]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [327]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [328]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [329]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [330]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [331]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [332]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [333]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [334]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [335]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [336]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [337]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [338]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [339]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [340]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [341]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [342]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [343]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [344]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [345]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [346]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [347]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [348]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [349]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [350]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [351]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [352]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [353]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [354]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [355]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [356]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [357]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [358]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [359]
					{
						["ShowTimerText"] = true,
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [360]
				},
				["EnabledProfiles"] = {
					["[GGL] Monk"] = false,
					["[DEV] All in One"] = false,
					["[GGL] Template"] = false,
					["[GGL] Test"] = false,
					["[GGL] SimTest"] = false,
				},
				["Name"] = "[GGL] Chat trigger",
			}, -- [1]
			{
				["GUID"] = "TMW:group:1RhHG3BLwtGX",
				["Scale"] = 1.73339736461639,
				["Enabled"] = false,
				["Columns"] = 1,
				["Icons"] = {
					{
						["Type"] = "conditionicon",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "open_toggle = not open_toggle\n",
								["Event"] = "OnRightClick",
							}, -- [1]
							{
								["Type"] = "Lua",
								["Lua"] = "lclick_open_toggle = not lclick_open_toggle\n\n\n\n",
								["Event"] = "OnLeftClick",
							}, -- [2]
							{
								["Type"] = "Lua",
								["Lua"] = "SystemToggles()\nLocalToggles()\n\n\n",
								["Event"] = "OnEventsRestored",
							}, -- [3]
							["n"] = 3,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"Toggle\n", -- [1]
									"Toggle", -- [2]
								},
							},
						},
						["CustomTex"] = "219159",
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [1]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [2]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [3]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [4]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [5]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [6]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [7]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [8]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [9]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [10]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [11]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [12]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [13]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [14]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [15]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [16]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [17]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [18]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [19]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [20]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [21]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [22]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [23]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [24]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [25]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [26]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [27]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [28]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [29]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [30]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [31]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [32]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [33]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [34]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [35]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [36]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [37]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [38]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [39]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [40]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [41]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [42]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [43]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [44]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [45]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [46]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [47]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [48]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [49]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [50]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [51]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [52]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [53]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [54]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [55]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [56]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [57]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [58]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [59]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [60]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [61]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [62]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [63]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [64]
				},
				["EnabledProfiles"] = {
					["[GGL] Monk"] = false,
					["[GGL] Template"] = false,
					["[GGL] Test"] = false,
					["[GGL] SimTest"] = false,
				},
				["Name"] = "[GGL] Anchor TOGGLES",
				["Point"] = {
					["y"] = 114.226554870605,
					["x"] = -237.106316405631,
					["point"] = "BOTTOMRIGHT",
					["relativePoint"] = "BOTTOMRIGHT",
				},
			}, -- [2]
			{
				["GUID"] = "TMW:group:1RVRouwrKDKz",
				["Point"] = {
					["y"] = 30,
					["relativeTo"] = "TMW:group:1RhHG3BLwtGX",
					["point"] = "BOTTOMLEFT",
					["relativePoint"] = "BOTTOMLEFT",
				},
				["Scale"] = 1.7334,
				["Rows"] = 7,
				["Locked"] = true,
				["Enabled"] = false,
				["Columns"] = 1,
				["Icons"] = {
					{
						["Type"] = "conditionicon",
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return not BasicRotation",
							}, -- [1]
							["n"] = 1,
						},
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "LOSCheck = not LOSCheck\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 2\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 1\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\n\n",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"LOS\nSystem", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "189208",
						["States"] = {
							{
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [1]
					{
						["Type"] = "conditionicon",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "LOSCheck = not LOSCheck\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 1\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 2\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\n\n",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"LOS\nSystem", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "189208",
						["States"] = {
							{
								["Color"] = "ff848484d",
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return not BasicRotation",
							}, -- [1]
							["n"] = 1,
						},
					}, -- [2]
					{
						["Type"] = "conditionicon",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "MSG_Toggle = not MSG_Toggle\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 4\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 3\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"MSG\nSystem", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "101059",
						["States"] = {
							{
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return not BasicRotation",
							}, -- [1]
							["n"] = 1,
						},
					}, -- [3]
					{
						["Type"] = "conditionicon",
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return not BasicRotation",
							}, -- [1]
							["n"] = 1,
						},
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "MSG_Toggle = not MSG_Toggle\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 3\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 4\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"MSG\nSystem", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "101059",
						["States"] = {
							{
								["Color"] = "ff848484d",
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [4]
					{
						["Type"] = "conditionicon",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "Target_Toggle = not Target_Toggle\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 6\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 5\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"Auto\nTarget", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "153911",
						["States"] = {
							{
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [5]
					{
						["Type"] = "conditionicon",
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "Target_Toggle = not Target_Toggle\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw enable global 3 5\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)\n\nDEFAULT_CHAT_FRAME.editBox:SetText(\"/tmw disable global 3 6\")\nChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox,0)",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							["n"] = 1,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"Auto\nTarget", -- [1]
									"Mouse_HEAL", -- [2]
								},
							},
						},
						["CustomTex"] = "153911",
						["States"] = {
							{
								["Color"] = "ff848484d",
							}, -- [1]
							{
								["Color"] = "ff848484d",
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [6]
					{
						["Type"] = "conditionicon",
						["Enabled"] = true,
						["Events"] = {
							{
								["Type"] = "Lua",
								["Lua"] = "TMW.CNDT.Env.InPvP_Toggle = true\nTMW.CNDT.Env.InPvP_Status = not TMW.CNDT.Env.InPvP_Status\n\n",
								["OnlyShown"] = true,
								["Event"] = "OnLeftClick",
								["PassThrough"] = false,
							}, -- [1]
							{
								["Type"] = "Lua",
								["Lua"] = "-- Reset\nTMW.CNDT.Env.InPvP_Toggle = false\nTMW.CNDT.Env.InPvP_Status = TMW.CNDT.Env.CheckInPvP()\n\n\n",
								["OnlyShown"] = true,
								["Event"] = "OnRightClick",
								["PassThrough"] = false,
							}, -- [2]
							["n"] = 2,
						},
						["SettingsPerView"] = {
							["icon"] = {
								["TextLayout"] = "TMW:textlayout:1RFt2HZe_Cbk",
								["Texts"] = {
									"PvP / PvE\nRClick Reset", -- [1]
									"[Stacks:Hide(0)]", -- [2]
								},
							},
						},
						["CustomTex"] = "269083",
						["States"] = {
							{
							}, -- [1]
							{
								["Color"] = "ff848484d",
								["Alpha"] = 1,
							}, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
						["Conditions"] = {
							{
								["Type"] = "LUA",
								["Name"] = "return InPvP_Status",
							}, -- [1]
							["n"] = 1,
						},
					}, -- [7]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [8]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [9]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [10]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [11]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [12]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [13]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [14]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [15]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [16]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [17]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [18]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [19]
					{
						["States"] = {
							{
							}, -- [1]
							nil, -- [2]
							{
							}, -- [3]
							{
							}, -- [4]
						},
					}, -- [20]
					{
						["States"] = {
							{
							}, -- [1]