--#########################################
--##### TRIP'S VENGEANCE DEMON HUNTER #####
--#########################################

-- Full credits to Taste

local _G, setmetatable                            = _G, setmetatable
local A                                         = _G.Action
local Listener                                    = Action.Listener
local Create                                    = Action.Create
local GetToggle                                    = Action.GetToggle
local SetToggle                                    = Action.SetToggle
local GetGCD                                    = Action.GetGCD
local GetCurrentGCD                                = Action.GetCurrentGCD
local GetPing                                    = Action.GetPing
local ShouldStop                                = Action.ShouldStop
local BurstIsON                                    = Action.BurstIsON
local AuraIsValid                                = Action.AuraIsValid
local InterruptIsValid                            = Action.InterruptIsValid
local FrameHasSpell                                = Action.FrameHasSpell
local Azerite                                    = LibStub("AzeriteTraits")
local Utils                                        = Action.Utils
local TeamCache                                    = Action.TeamCache
local EnemyTeam                                    = Action.EnemyTeam
local FriendlyTeam                                = Action.FriendlyTeam
local LoC                                        = Action.LossOfControl
local Player                                    = Action.Player 
local MultiUnits                                = Action.MultiUnits
local UnitCooldown                                = Action.UnitCooldown
local Unit                                        = Action.Unit 
local IsUnitEnemy                                = Action.IsUnitEnemy
local IsUnitFriendly                            = Action.IsUnitFriendly
local ActiveUnitPlates                            = MultiUnits:GetActiveUnitPlates()
local IsIndoors, UnitIsUnit                     = IsIndoors, UnitIsUnit
local TR                                        = Action.TasteRotation
local pairs                                     = pairs
local Pet                                       = LibStub("PetLibrary")

--For Toaster
local Toaster																	= _G.Toaster
local GetSpellTexture 															= _G.TMW.GetSpellTexture

--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- luacheck: max_line_length 9999

-- Spells
Action[ACTION_CONST_DEMONHUNTER_VENGEANCE] = {
    -- Racial
    ArcaneTorrent                          = Action.Create({ Type = "Spell", ID = 50613     }),
    BloodFury                              = Action.Create({ Type = "Spell", ID = 20572      }),
    Fireblood                              = Action.Create({ Type = "Spell", ID = 265221     }),
    AncestralCall                          = Action.Create({ Type = "Spell", ID = 274738     }),
    Berserking                             = Action.Create({ Type = "Spell", ID = 26297    }),
    ArcanePulse                            = Action.Create({ Type = "Spell", ID = 260364    }),
    QuakingPalm                            = Action.Create({ Type = "Spell", ID = 107079     }),
    Haymaker                               = Action.Create({ Type = "Spell", ID = 287712     }), 
    WarStomp                               = Action.Create({ Type = "Spell", ID = 20549     }),
    BullRush                               = Action.Create({ Type = "Spell", ID = 255654     }),  
    GiftofNaaru                            = Action.Create({ Type = "Spell", ID = 59544    }),
    Shadowmeld                             = Action.Create({ Type = "Spell", ID = 58984    }), -- usable in Action Core 
    Stoneform                              = Action.Create({ Type = "Spell", ID = 20594    }), 
    BagofTricks                            = Action.Create({ Type = "Spell", ID = 312411    }),
    WilloftheForsaken                      = Action.Create({ Type = "Spell", ID = 7744        }), -- not usable in APL but user can Queue it   
    EscapeArtist                           = Action.Create({ Type = "Spell", ID = 20589    }), -- not usable in APL but user can Queue it
    EveryManforHimself                     = Action.Create({ Type = "Spell", ID = 59752    }), -- not usable in APL but user can Queue it
    -- Abilities
    Frailty                                = Action.Create({ Type = "Spell", ID = 247456     }),
    ImmolationAura                         = Action.Create({ Type = "Spell", ID = 258920     }),
    InfernalStrike                         = Action.Create({ Type = "Spell", ID = 189110     }),
    Shear                                  = Action.Create({ Type = "Spell", ID = 203782     }),
    SoulFragments                          = Action.Create({ Type = "Spell", ID = 203981     }),
    ThrowGlaive                            = Action.Create({ Type = "Spell", ID = 204157     }), 
    Imprison                               = Action.Create({ Type = "Spell", ID = 217832     }),
    -- Sigils    
    SigilofFlameNoCS                       = Action.Create({ Type = "Spell", ID = 204596, Hidden = true}),
    SigilofFlameCS                         = Action.Create({ Type = "Spell", ID = 204513     }),
    SigilofFlame                           = Action.Create({ Type = "Spell", ID = 204596     }),
    SigilofFlame2                          = Action.Create({ Type = "Spell", ID = 204513, Hidden = true}),
    SigilofChains                          = Action.Create({ Type = "Spell", ID = 202138     }), -- 70% Snare + grip all enemies around 30yards
    SigilofMisery                          = Action.Create({ Type = "Spell", ID = 207684     }), -- AoE Interrupt "Fear"
    SigilofSilence                         = Action.Create({ Type = "Spell", ID = 202137     }), -- 30yards Silence for 6sec
    SoulCleave                             = Action.Create({ Type = "Spell", ID = 228477     }), 
    -- Defensive 
    DemonSpikes                            = Action.Create({ Type = "Spell", ID = 203720     }),
    FieryBrand                             = Action.Create({ Type = "Spell", ID = 204021     }),
    Torment                                = Action.Create({ Type = "Spell", ID = 185245     }),  -- Taunt
    -- Talents
    CharredFlesh                           = Action.Create({ Type = "Spell", ID = 264002     }),
    ConcentratedSigils                     = Action.Create({ Type = "Spell", ID = 207666     }),
    Felblade                               = Action.Create({ Type = "Spell", ID = 232893     }),
    FelDevastation                         = Action.Create({ Type = "Spell", ID = 212084     }),
    Fracture                               = Action.Create({ Type = "Spell", ID = 263642     }),
    SoulBarrier                            = Action.Create({ Type = "Spell", ID = 263648     }),
    SpiritBomb                             = Action.Create({ Type = "Spell", ID = 247454     }),
	AbyssalStrike						   = Action.Create({ Type = "Spell", ID = 207550	}),
    -- Utility 
    Disrupt                                = Action.Create({ Type = "Spell", ID = 183752     }),
    Metamorphosis                          = Action.Create({ Type = "Spell", ID = 187827     }),
    ChaosNova                              = Action.Create({ Type = "Spell", ID = 179057}),
    Blur                                   = Action.Create({ Type = "Spell", ID = 198589}),
    ConsumeMagic                           = Action.Create({ Type = "Spell", ID = 278326}),
    Darkness                               = Action.Create({ Type = "Spell", ID = 196718}),
    -- Buffs
    -- Debuffs
    RazorCoralDebuff                       = Action.Create({ Type = "Spell", ID = 303568, Hidden = true}),
    ConductiveInkDebuff                    = Action.Create({ Type = "Spell", ID = 302565, Hidden = true}),
    SpiritBombDebuff                       = Action.Create({ Type = "Spell", ID = 247456, Hidden = true}),
    FieryBrandDebuff                       = Action.Create({ Type = "Spell", ID = 207771, Hidden = true}), 
    DemonSpikesBuff                        = Action.Create({ Type = "Spell", ID = 203819, Hidden = true}), 
    SigilofFlameDebuff                     = Action.Create({ Type = "Spell", ID = 204598, Hidden = true}),  
    -- Generics
    LifebloodBuff                          = Action.Create({ Type = "Spell", ID = 295078 }),
    -- Potions
    PotionofUnbridledFury                  = Action.Create({ Type = "Potion", ID = 169299, QueueForbidden = true }), 
    BattlePotionOfAgility                  = Action.Create({ Type = "Potion", ID = 163223, QueueForbidden = true }), 
    
    SuperiorPotionofUnbridledFury          = Action.Create({ Type = "Potion", ID = 168489, QueueForbidden = true }), 
    SuperiorSteelskinPotion                = Action.Create({ Type = "Potion", ID = 168501, QueueForbidden = true }), 
    AbyssalHealingPotion                   = Action.Create({ Type = "Potion", ID = 169451, QueueForbidden = true }),     
    PotionofFocusedResolve                 = Action.Create({ Type = "Potion", ID = 168506 }),
    SuperiorBattlePotionofStrength         = Action.Create({ Type = "Potion", ID = 168500 }),
    PotionofEmpoweredProximity             = Action.Create({ Type = "Potion", ID = 168529 }),
    -- Trinkets
    AzsharasFontofPower                    = Action.Create({ Type = "Trinket", ID = 169314 }),
    PocketsizedComputationDevice           = Action.Create({ Type = "Trinket", ID = 167555 }),
    RotcrustedVoodooDoll                   = Action.Create({ Type = "Trinket", ID = 159624 }),
    ShiverVenomRelic                       = Action.Create({ Type = "Trinket", ID = 168905 }),
    AquipotentNautilus                     = Action.Create({ Type = "Trinket", ID = 169305 }),
    TidestormCodex                         = Action.Create({ Type = "Trinket", ID = 165576 }),
    VialofStorms                           = Action.Create({ Type = "Trinket", ID = 158224 }),
    GalecallersBoon                        = Action.Create({ Type = "Trinket", ID = 159614 }),
    InvocationOfYulon                      = Action.Create({ Type = "Trinket", ID = 165568 }),
    LustrousGoldenPlumage                  = Action.Create({ Type = "Trinket", ID = 159617 }),
    LurkersInsidiousGift                   = Action.Create({ Type = "Trinket", ID = 167866 }),
    VigorTrinket                           = Action.Create({ Type = "Trinket", ID = 165572 }),
    AshvanesRazorCoral                     = Action.Create({ Type = "Trinket", ID = 169311 }),
    MalformedHeraldsLegwraps               = Action.Create({ Type = "Trinket", ID = 167835 }),
    HyperthreadWristwraps                  = Action.Create({ Type = "Trinket", ID = 168989 }),
    NotoriousAspirantsBadge                = Action.Create({ Type = "Trinket", ID = 167528 }),
    NotoriousGladiatorsBadge               = Action.Create({ Type = "Trinket", ID = 167380 }),
    SinisterGladiatorsBadge                = Action.Create({ Type = "Trinket", ID = 165058 }),
    SinisterAspirantsBadge                 = Action.Create({ Type = "Trinket", ID = 165223 }),
    DreadGladiatorsBadge                   = Action.Create({ Type = "Trinket", ID = 161902 }),
    DreadAspirantsBadge                    = Action.Create({ Type = "Trinket", ID = 162966 }),
    DreadCombatantsInsignia                = Action.Create({ Type = "Trinket", ID = 161676 }),
    NotoriousAspirantsMedallion            = Action.Create({ Type = "Trinket", ID = 167525 }),
    NotoriousGladiatorsMedallion           = Action.Create({ Type = "Trinket", ID = 167377 }),
    SinisterGladiatorsMedallion            = Action.Create({ Type = "Trinket", ID = 165055 }),
    SinisterAspirantsMedallion             = Action.Create({ Type = "Trinket", ID = 165220 }),
    DreadGladiatorsMedallion               = Action.Create({ Type = "Trinket", ID = 161674 }),
    DreadAspirantsMedallion                = Action.Create({ Type = "Trinket", ID = 162897 }),
    DreadCombatantsMedallion               = Action.Create({ Type = "Trinket", ID = 161811 }),
    IgnitionMagesFuse                      = Action.Create({ Type = "Trinket", ID = 159615 }),
    TzanesBarkspines                       = Action.Create({ Type = "Trinket", ID = 161411 }),
    AzurethosSingedPlumage                = Action.Create({ Type = "Trinket", ID = 161377 }),
    AncientKnotofWisdomAlliance            = Action.Create({ Type = "Trinket", ID = 161417 }),
    AncientKnotofWisdomHorde               = Action.Create({ Type = "Trinket", ID = 166793 }),
    ShockbitersFang                        = Action.Create({ Type = "Trinket", ID = 169318 }),
    NeuralSynapseEnhancer                  = Action.Create({ Type = "Trinket", ID = 168973 }),
    BalefireBranch                         = Action.Create({ Type = "Trinket", ID = 159630 }),
    GrongsPrimalRage                       = Action.Create({ Type = "Trinket", ID = 165574 }),
    BygoneBeeAlmanac                       = Action.Create({ Type = "Trinket", ID = 163936 }),
    RampingAmplitudeGigavoltEngine         = Action.Create({ Type = "Trinket", ID = 165580 }),
    VisionofDemise                         = Action.Create({ Type = "Trinket", ID = 169307 }),
    JesHowler                              = Action.Create({ Type = "Trinket", ID = 159627 }),
    GalecallersBeak                        = Action.Create({ Type = "Trinket", ID = 161379 }),
    DribblingInkpod                        = Action.Create({ Type = "Trinket", ID = 169319 }),
    MerekthasFang                          = Action.Create({ Type = "Trinket", ID = 158367 }),    
    GrongsPrimalRage                       = Action.Create({ Type = "Trinket", ID = 165574 }),
    BygoneBeeAlmanac                       = Action.Create({ Type = "Trinket", ID = 163936 }),
    RampingAmplitudeGigavoltEngine         = Action.Create({ Type = "Trinket", ID = 165580 }),
    VisionofDemise                         = Action.Create({ Type = "Trinket", ID = 169307 }),
    JesHowler                              = Action.Create({ Type = "Trinket", ID = 159627 }),
    GalecallersBeak                        = Action.Create({ Type = "Trinket", ID = 161379 }),
    DribblingInkpod                        = Action.Create({ Type = "Trinket", ID = 169319 }),
    RazdunksBigRedButton                   = Action.Create({ Type = "Trinket", ID = 159611 }),
    MerekthasFang                          = Action.Create({ Type = "Trinket", ID = 158367 }),
    KnotofAncientFuryAlliance              = Action.Create({ Type = "Trinket", ID = 161413 }),
    KnotofAncientFuryHorde                 = Action.Create({ Type = "Trinket", ID = 166795 }),
    FirstMatesSpyglass                     = Action.Create({ Type = "Trinket", ID = 158163 }),
    VialofAnimatedBlood                    = Action.Create({ Type = "Trinket", ID = 159625 }),
    -- Misc
    Channeling                             = Action.Create({ Type = "Spell", ID = 209274, Hidden = true     }),    -- Show an icon during channeling
    TargetEnemy                            = Action.Create({ Type = "Spell", ID = 44603, Hidden = true     }),    -- Change Target (Tab button)
    StopCast                               = Action.Create({ Type = "Spell", ID = 61721, Hidden = true     }),        -- spell_magic_polymorphrabbit
    CyclotronicBlast                       = Action.Create({ Type = "Spell", ID = 293491, Hidden = true}),
    ConcentratedFlameBurn                  = Action.Create({ Type = "Spell", ID = 295368, Hidden = true}),
    RazorCoralDebuff                       = Action.Create({ Type = "Spell", ID = 303568, Hidden = true     }),
    ConductiveInkDebuff                    = Action.Create({ Type = "Spell", ID = 302565, Hidden = true     }),
    -- Hidden Heart of Azeroth
    -- added all 3 ranks ids in case used by rotation
    VisionofPerfectionMinor                = Action.Create({ Type = "Spell", ID = 296320, Hidden = true}),
    VisionofPerfectionMinor2               = Action.Create({ Type = "Spell", ID = 299367, Hidden = true}),
    VisionofPerfectionMinor3               = Action.Create({ Type = "Spell", ID = 299369, Hidden = true}),
    RecklessForceBuff                      = Action.Create({ Type = "Spell", ID = 302932, Hidden = true     }),     
	Darkflight							   = Action.Create({ Type = "Spell", ID = 68992 }), -- used for Heart of Azeroth		
};

-- To create essences use next code:
Action:CreateEssencesFor(ACTION_CONST_DEMONHUNTER_VENGEANCE)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_DEMONHUNTER_VENGEANCE], { __index = Action })


local function num(val)
    if val then return 1 else return 0 end
end

local function bool(val)
    return val ~= 0
end
local player = "player"
------------------------------------------
-------------- COMMON PREAPL -------------
------------------------------------------
local Temp = {
    TotalAndPhys                            = {"TotalImun", "DamagePhysImun"},
    TotalAndCC                              = {"TotalImun", "CCTotalImun"},
    TotalAndPhysKick                        = {"TotalImun", "DamagePhysImun", "KickImun"},
    TotalAndPhysAndCC                       = {"TotalImun", "DamagePhysImun", "CCTotalImun"},
    TotalAndPhysAndStun                     = {"TotalImun", "DamagePhysImun", "StunImun"},
    TotalAndPhysAndCCAndStun                = {"TotalImun", "DamagePhysImun", "CCTotalImun", "StunImun"},
    TotalAndMag                             = {"TotalImun", "DamageMagicImun"},
    TotalAndMagKick                         = {"TotalImun", "DamageMagicImun", "KickImun"},
    DisablePhys                             = {"TotalImun", "DamagePhysImun", "Freedom", "CCTotalImun"},
    DisableMag                              = {"TotalImun", "DamageMagicImun", "Freedom", "CCTotalImun"},
    AuraTaunt                               = {A.Torment.ID},
}

local IsIndoors, UnitIsUnit, UnitName = IsIndoors, UnitIsUnit, UnitName

--Register Toaster
Toaster:Register("TripToast", function(toast, ...)
	local title, message, spellID = ...
	toast:SetTitle(title or "nil")
	toast:SetText(message or "nil")
	if spellID then 
		if type(spellID) ~= "number" then 
			error(tostring(spellID) .. " (spellID) is not a number for TripToast!")
			toast:SetIconTexture("Interface\FriendsFrame\Battlenet-WoWicon")
		else 
			toast:SetIconTexture((GetSpellTexture(spellID)))
		end 
	else 
		toast:SetIconTexture("Interface\FriendsFrame\Battlenet-WoWicon")
	end 
	toast:SetUrgencyLevel("normal") 
end)

local function IsSchoolFree()
    return LoC:IsMissed("SILENCE") and LoC:Get("SCHOOL_INTERRUPT", "SHADOW") == 0
end 

-- Non GCD spell check
local function countInterruptGCD(unit)
    if not A.Disrupt:IsReadyByPassCastGCD(unit) or not A.Disrupt:AbsentImun(unit, Temp.TotalAndMagKick) then
        return true
    end
end

-- Interrupts spells
local function Interrupts(unit)
    if A.GetToggle(2, "TasteInterruptList") and (IsInRaid() or A.InstanceInfo.KeyStone > 1) then
        useKick, useCC, useRacial, notInterruptable, castRemainsTime, castDoneTime = Action.InterruptIsValid(unit, "TasteBFAContent", true, countInterruptGCD(unit))
    else
        useKick, useCC, useRacial, notInterruptable, castRemainsTime, castDoneTime = Action.InterruptIsValid(unit, nil, nil, countInterruptGCD(unit))
    end
    local EnemiesCasting = MultiUnits:GetByRangeCasting(30, 5, true, "TargetMouseover")
    
    if castRemainsTime >= A.GetLatency() then    
        
        -- Sigil of Chains (Snare)
        if useCC and A.SigilofChains:IsReady("player") and A.SigilofChains:AbsentImun(unit, Temp.TotalAndCC, true) and Unit(unit):GetRange() > 5 then 
            return A.SigilofChains              
        end 
        
        -- Sigil of Misery (Disorient)
        if useCC and A.SigilofMisery:IsReady("player") and EnemiesCasting > 1 and A.SigilofMisery:AbsentImun(unit, Temp.TotalAndCC, true) then 
            return A.SigilofMisery              
        end 
        
        -- Sigil of Silence (Silence)
        if useKick and (not A.Disrupt:IsReady(unit) or EnemiesCasting > 1) and A.SigilofSilence:IsReady("player") and A.SigilofSilence:AbsentImun(unit, Temp.TotalAndCC, true) then 
            return A.SigilofSilence              
        end 
        
        -- Imprison    
        if useCC and A.Imprison:IsReady(unit) and not A.Disrupt:IsReady(unit) then        
            return A.Imprison              
        end 
        
        -- Chaos Nova    
        if useCC and A.ChaosNova:IsReady(unit) and EnemiesCasting > 1 and A.ChaosNova:AbsentImun(unit, Temp.TotalAndCC, true) then 
            return A.ChaosNova              
        end 
        
        -- Disrupt
        if useKick and A.Disrupt:IsReady(unit) and A.Disrupt:AbsentImun(unit, Temp.TotalAndMagKick, true) then 
            return A.Disrupt
        end     
        
        if useRacial and A.QuakingPalm:AutoRacial(unit) then 
            return A.QuakingPalm
        end 
        
        if useRacial and A.Haymaker:AutoRacial(unit) then 
            return A.Haymaker
        end 
        
        if useRacial and A.WarStomp:AutoRacial(unit) then 
            return A.WarStomp
        end 
        
        if useRacial and A.BullRush:AutoRacial(unit) then 
            return A.BullRush
        end 
    end
end

-- Soul Fragments function taking into consideration aura lag
local function UpdateSoulFragments()
    SoulFragments = Unit("player"):HasBuffsStacks(A.SoulFragments.ID, true)
    
    -- Casting Spirit Bomb or Soul Cleave immediately updates the buff
    if Unit("player"):GetSpellLastCast(A.SpiritBomb.ID, true) < A.GetGCD()
    or Unit("player"):GetSpellLastCast(A.SoulCleave.ID, true) < A.GetGCD() then
        SoulFragmentsAdjusted = 0
        return;
    end
    
    -- Check if we have cast Fracture or Shear within the last GCD and haven't "snapshot" yet
    if SoulFragmentsAdjusted == 0 then
        if A.Fracture:IsSpellLearned() then
            if Unit("player"):GetSpellLastCast(A.Fracture.ID, true) < A.GetGCD() and A.Fracture:GetSpellTimeSinceLastCast() ~= LastSoulFragmentAdjustment then
                SoulFragmentsAdjusted = math.min(SoulFragments + 2, 5)
                LastSoulFragmentAdjustment = A.Fracture:GetSpellTimeSinceLastCast()
            end
        else
            if A.Shear:GetSpellTimeSinceLastCast() < A.GetGCD() and A.Fracture.Shear ~= LastSoulFragmentAdjustment then
                SoulFragmentsAdjusted = math.min(SoulFragments + 1, 5)
                LastSoulFragmentAdjustment = A.Shear:GetSpellTimeSinceLastCast()
            end
        end
    else
        -- If we have a soul fragement "snapshot", see if we should invalidate it based on time
        if A.Fracture:IsSpellLearned() then
            if A.Fracture:GetSpellTimeSinceLastCast() >= A.GetGCD() then
                SoulFragmentsAdjusted = 0
            end
        else
            if A.Shear:GetSpellTimeSinceLastCast() >= A.GetGCD() then
                SoulFragmentsAdjusted = 0
            end
        end
    end
    
    -- If we have a higher Soul Fragment "snapshot", use it instead
    if SoulFragmentsAdjusted > SoulFragments then
        SoulFragments = SoulFragmentsAdjusted
    elseif SoulFragmentsAdjusted > 0 then
        -- Otherwise, the "snapshot" is invalid, so reset it if it has a value
        -- Relevant in cases where we use a generator two GCDs in a row
        SoulFragmentsAdjusted = 0
    end
end

-- Melee Is In Range w/ Movement Handlers
local function UpdateIsInMeleeRange()
    if A.Felblade:GetSpellTimeSinceLastCast() < A.GetGCD()
    or A.InfernalStrike:GetSpellTimeSinceLastCast() < A.GetGCD() then
        IsInMeleeRange = true;
        IsInAoERange = true;
        return;
    end
    
    local IsInMeleeRange = Unit("target"):GetRange() <= 5
    local IsInAoERange = IsInMeleeRange or MultiUnits:GetByRange(8, 5, 10) > 0;
end

-- Current HPS > Incoming damage
local function IsInDanger(unit)
    return Unit("player"):GetHPS() < Unit("player"):GetDMG()
end

--- ======= ACTION LISTS =======
-- [3] Single Rotation
A[3] = function(icon, isMulti)
    --------------------
    --- ROTATION VAR ---
    --------------------
    local isMoving = A.Player:IsMoving()
    local inCombat = Unit("player"):CombatTime() > 0
    local combatTime = Unit("player"):CombatTime()
    local ShouldStop = Action.ShouldStop()
    local Pull = Action.BossMods:GetPullTimer()
    local ActiveMitigationNeeded = Player:ActiveMitigationNeeded()
    local IsTanking = Unit("player"):IsTanking("target", 8) or Unit("player"):IsTankingAoE(8)
    UpdateSoulFragments()
    UpdateIsInMeleeRange()
    local SoulFragments = Unit("player"):HasBuffsStacks(A.SoulFragments.ID, true)
    local Trinket1IsAllowed, Trinket2IsAllowed = TR.TrinketIsAllowed()
    
    ------------------------------------------------------
    ---------------- ENEMY UNIT ROTATION -----------------
    ------------------------------------------------------
    local function EnemyRotation(unit)
        -- vars
        -- Return boolean        
        local IsInDanger = IsInDanger(unit)
        local HPLoosePerSecond = Unit("player"):GetDMG() * 100 / Unit("player"):HealthMax()
        
	
			--Damage Rotation
			local function DamageRotation()
			
				--Infernal Strike if about to cap charges, range check for casting @player
				if A.InfernalStrike:IsReady("player") and (A.LastPlayerCastID ~= A.InfernalStrike.ID) and A.InfernalStrike:GetSpellCharges() > 1 and Unit("target"):GetRange() <= 6 then 
					return A.InfernalStrike:Show(icon)
				end
				
				--Fiery Brand on cooldown
				if A.FieryBrand:IsReady(unit) then 
					return A.FieryBrand:Show(icon)
				end
				
				-- guardian_of_azeroth
				if A.GuardianofAzeroth:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- focused_azerite_beam
				if A.FocusedAzeriteBeam:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- memory_of_lucid_dreams
				if A.MemoryofLucidDreams:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- blood_of_the_enemy
				if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- purifying_blast
				if A.PurifyingBlast:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				--[[ ripple_in_space
				if A.RippleInSpace:AutoHeartOfAzerothP(unit, true) and HeartOfAzeroth then
					return A.Darkflight:Show(icon)
				end]]
				
				-- concentrated_flame,line_cd=6
				if A.ConcentratedFlame:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- reaping_flames
				if A.ReapingFlames:IsReady(unit) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end
				
				-- the_unbound_force,if=buff.reckless_force.up
				if A.TheUnboundForce:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) and (Unit("player"):HasBuffs(A.RecklessForceBuff.ID, true)) then
					return A.Darkflight:Show(icon)
				end
				
				-- worldvein_resonance
				if A.WorldveinResonance:AutoHeartOfAzerothP(unit, true) and A.BurstIsON(unit) then
					return A.Darkflight:Show(icon)
				end	
			
				--Spirit Bomb if four or more souls and fury cap incoming
				if A.SpiritBomb:IsReady(unit) and SoulFragments >= 4 and Player:Fury() then
					return A.SpiritBomb:Show(icon)
				end
				
				--Fel Devastation on cooldown
				if A.FelDevastation:IsReady("player") and Unit("target"):GetRange() <= 15 then
					return A.Imprison:Show(icon)
				end

				--Fracture if need fury/souls
				if A.Fracture:IsReady(unit) and SoulFragments <= 4 and Player:Fury() <= 75 then
					return A.Fracture:Show(icon)
				end	

				--Immolation Aura if souls not capped
				if A.ImmolationAura:IsReady(unit) and SoulFragments <= 4 and Player:Fury() <= 80 then
					return A.ImmolationAura:Show(icon)
				end

				--Soul Cleave to dump fury
				if A.SoulCleave:IsReady(unit) and Player:Fury() >= 80 then
					return A.SoulCleave:Show(icon)
				end

				--Sigil of Flame (try not to overlap with Sigil from Abyssal Strike talent)
				if A.SigilofFlame:IsReady("player") and not (A.AbyssalStrike:IsSpellLearned() and A.InfernalStrike:GetSpellTimeSinceLastCast() < 4) then
					return A.SigilofFlame:Show(icon)
				end

				--Shear
				if A.Shear:IsReady(unit) and not A.Fracture:IsSpellLearned() then
					return A.Shear:Show(icon)
				end

				--Throw Glaive
				if A.ThrowGlaive:IsReady(unit) and inCombat then
					return A.ThrowGlaive:Show(icon)
				end	
			
			end 
	
			local function DefenseRotation()
			
				if A.DemonSpikes:IsReady(unit) and Unit("player"):HasBuffs(A.DemonSpikesBuff.ID, true) == 0 and Unit("player"):HasBuffs(A.Metamorphosis.ID, true) == 0 and (A.LastPlayerCastID ~= A.DemonSpikes.ID) then
					return A.DemonSpikes:Show(icon)
				end
				
				if A.SoulBarrier:IsReady(unit) and ((A.SpiritBomb:IsSpellLearned() and SoulFragments < 3) or (not A.SpiritBomb:IsSpellLearned() and SoulFragments >= 5)) then
					return A.SoulBarrier:Show(icon)
				end
				
				
				if A.Metamorphosis:IsReady(unit) and A.BurstIsON(unit) and Unit("player"):HasBuffs(A.Metamorphosis.ID, true) == 0 and
				(
					IsInDanger 
					or                 
					-- HP lose per sec >= 40
					Unit("player"):GetDMG() * 100 / Unit("player"):HealthMax() >= 40 
					or 
					Unit("player"):GetRealTimeDMG() >= Unit("player"):HealthMax() * 0.40 
					or 
					-- TTD 
					Unit("player"):TimeToDieX(15) < 3 
				)  
				then
					return A.Metamorphosis:Show(icon)
				end				
			end
			
			
			local function Utilities()
			
				-- Interrupt
				local Interrupt = Interrupts(unit)
				if Interrupt then 
					return Interrupt:Show(icon)
				end
				
				-- Purge
				-- Note: Toggles  ("UseDispel", "UsePurge", "UseExpelEnrage")
				-- Category ("Dispel", "MagicMovement", "PurgeFriendly", "PurgeHigh", "PurgeLow", "Enrage")
				if A.ConsumeMagic:IsReady(unit) and Action.AuraIsValid(unit, "UsePurge", "PurgeHigh") then
					return A.ConsumeMagic:Show(icon)
				end    
				
				-- Taunt 
				if A.GetToggle(2, "AutoTaunt") 
				and combatTime > 0     
				then 
					-- if not fully aggroed or we are not current target then use taunt
					if A.Torment:IsReady(unit, true, nil, nil, nil) and not Unit(unit):IsBoss() and not Unit(unit):IsDummy() and Unit(unit):GetRange() <= 30 and ( Unit("targettarget"):InfoGUID() ~= Unit("player"):InfoGUID() ) then 
						return A.Torment:Show(icon)
						-- else if all good on current target, switch to another one we know we dont currently tank
					else
						local Growl_Nameplates = MultiUnits:GetActiveUnitPlates()
						if Torment_Nameplates then  
							for Torment_UnitID in pairs(Torment_Nameplates) do             
								if not UnitIsUnit("target", Torment_UnitID) and A.Torment:IsReady(Torment_UnitID, true, nil, nil, nil) and not Unit(Torment_UnitID):IsDummy() and not Unit(Torment_UnitID):IsBoss() and Unit(Torment_UnitID):GetRange() <= 30 and not Unit(Torment_UnitID):InLOS() and Unit("player"):ThreatSituation(Torment_UnitID) ~= 3 then 
									return A:Show(icon, ACTION_CONST_AUTOTARGET)
								end         
							end 
						end
					end
				end 
				
				-- Non SIMC Custom Trinket1
				if A.Trinket1:IsReady(unit) and Trinket1IsAllowed then        
					return A.Trinket1:Show(icon)        
				end
				
				-- Non SIMC Custom Trinket2
				if A.Trinket2:IsReady(unit) and Trinket2IsAllowed then        
					return A.Trinket2:Show(icon)    
				end 
			
			end 
	
		if DefenseRotation(unit) and inCombat then
			return true
		end

		if Utilities(unit) and inCombat then
			return true
		end

		if DamageRotation(unit) and inCombat then
			return true
		end		
			
	end 
    
    -- End on EnemyRotation()
    
    -- Defensive
    --local SelfDefensive = SelfDefensives()
    if SelfDefensive then 
        return SelfDefensive:Show(icon)
    end 
    
    -- Mouseover
    if A.IsUnitEnemy("mouseover") then
        unit = "mouseover"
        if EnemyRotation(unit) then 
            return true 
        end 
    end 
    
    -- Target  
    if A.IsUnitEnemy("target") then 
        unit = "target"
        if EnemyRotation(unit) then 
            return true
        end 
        
    end
end
-- Finished

-- [4] AoE Rotation
A[4] = function(icon)
    return A[3](icon, true)
end
-- [5] Trinket Rotation
-- No specialization trinket actions 
-- Passive 
--[[local function FreezingTrapUsedByEnemy()
    if     UnitCooldown:GetCooldown("arena", 3355) > UnitCooldown:GetMaxDuration("arena", 3355) - 2 and
    UnitCooldown:IsSpellInFly("arena", 3355) and 
    Unit("player"):GetDR("incapacitate") >= 50 
    then 
        local Caster = UnitCooldown:GetUnitID("arena", 3355)
        if Caster and Unit(Caster):GetRange() <= 40 then 
            return true 
        end 
    end 
end 
local function ArenaRotation(icon, unit)
    if A.IsInPvP and (A.Zone == "pvp" or A.Zone == "arena") and not Player:IsStealthed() and not Player:IsMounted() then
        -- Note: "arena1" is just identification of meta 6
        if (unit == "arena1" or unit == "arena2" or unit == "arena3") then 
            -- Reflect Casting BreakAble CC
            if A.NetherWard:IsReady() and A.NetherWard:IsSpellLearned() and Action.ShouldReflect(unit) and EnemyTeam():IsCastingBreakAble(0.25) then 
                return A.NetherWard:Show(icon)
            end 
        end
    end 
end 
local function PartyRotation(unit)
    if (unit == "party1" and not A.GetToggle(2, "PartyUnits")[1]) or (unit == "party2" and not A.GetToggle(2, "PartyUnits")[2]) then 
        return false 
    end

      -- SingeMagic
    if A.SingeMagic:IsCastable() and A.SingeMagic:AbsentImun(unit, Temp.TotalAndMag) and IsSchoolFree() and Action.AuraIsValid(unit, "UseDispel", "Magic") and not Unit(unit):InLOS() then
        return A.SingeMagic:Show(icon)
    end
end 

A[6] = function(icon)
    return ArenaRotation(icon, "arena1")
end

A[7] = function(icon)
    local Party = PartyRotation("party1") 
    if Party then 
        return Party:Show(icon)
    end 
    return ArenaRotation(icon, "arena2")
end

A[8] = function(icon)
    local Party = PartyRotation("party2") 
    if Party then 
        return Party:Show(icon)
    end     
    return ArenaRotation(icon, "arena3")
end]]--
