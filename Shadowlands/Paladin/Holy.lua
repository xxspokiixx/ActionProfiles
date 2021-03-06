--###############################
--##### TRIP'S HOLY PALADIN #####
--###############################


local _G, setmetatable                            = _G, setmetatable
local TMW                                       = TMW
local CNDT                                      = TMW.CNDT
local Env                                       = CNDT.Env
local A                                         = _G.Action
local Listener                                  = Action.Listener
local Create                                    = Action.Create
local GetToggle                                 = Action.GetToggle
local SetToggle                                 = Action.SetToggle
local GetGCD                                    = Action.GetGCD
local GetCurrentGCD                             = Action.GetCurrentGCD
local GetPing                                   = Action.GetPing
local ShouldStop                                = Action.ShouldStop
local BurstIsON                                 = Action.BurstIsON
local AuraIsValid                               = Action.AuraIsValid
local AuraIsValidByPhialofSerenity                = A.AuraIsValidByPhialofSerenity
local InterruptIsValid                          = Action.InterruptIsValid
local FrameHasSpell                             = Action.FrameHasSpell
local Utils                                     = Action.Utils
local TeamCache                                 = Action.TeamCache
local EnemyTeam                                 = Action.EnemyTeam
local FriendlyTeam                              = Action.FriendlyTeam
local LoC                                       = Action.LossOfControl
local Player                                    = Action.Player 
local MultiUnits                                = Action.MultiUnits
local UnitCooldown                              = Action.UnitCooldown
local Unit                                      = Action.Unit 
local IsUnitEnemy                               = Action.IsUnitEnemy
local IsUnitFriendly                            = Action.IsUnitFriendly
local HealingEngine                             = Action.HealingEngine
local ActiveUnitPlates                          = MultiUnits:GetActiveUnitPlates()
local TeamCacheFriendly                         = TeamCache.Friendly
local TeamCacheFriendlyIndexToPLAYERs           = TeamCacheFriendly.IndexToPLAYERs
local IsIndoors, UnitIsUnit                     = IsIndoors, UnitIsUnit
local TR                                        = Action.TasteRotation
local Pet                                       = LibStub("PetLibrary")
local next, pairs, type, print                  = next, pairs, type, print 
local math_floor                                = math.floor
local math_ceil                                 = math.ceil
local tinsert                                   = table.insert 
local select, unpack, table                     = select, unpack, table 
local CombatLogGetCurrentEventInfo              = _G.CombatLogGetCurrentEventInfo
local UnitGUID, UnitIsUnit, UnitDamage, UnitAttackSpeed, UnitAttackPower = UnitGUID, UnitIsUnit, UnitDamage, UnitAttackSpeed, UnitAttackPower
local select, math                              = select, math 
local huge                                      = math.huge  
local UIParent                                  = _G.UIParent 
local CreateFrame                               = _G.CreateFrame
local wipe                                      = _G.wipe
local IsUsableSpell                             = IsUsableSpell
local UnitPowerType                             = UnitPowerType 

--For Toaster
local Toaster                                    = _G.Toaster
local GetSpellTexture                             = _G.TMW.GetSpellTexture

--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- luacheck: max_line_length 9999

-- Spells
Action[ACTION_CONST_PALADIN_HOLY] = {
    -- Racial
    ArcaneTorrent                          = Create({ Type = "Spell", ID = 50613     }),
    BloodFury                              = Create({ Type = "Spell", ID = 20572      }),
    Fireblood                              = Create({ Type = "Spell", ID = 265221     }),
    AncestralCall                          = Create({ Type = "Spell", ID = 274738     }),
    Berserking                             = Create({ Type = "Spell", ID = 26297    }),
    ArcanePulse                            = Create({ Type = "Spell", ID = 260364    }),
    QuakingPalm                            = Create({ Type = "Spell", ID = 107079     }),
    Haymaker                               = Create({ Type = "Spell", ID = 287712     }), 
    WarStomp                               = Create({ Type = "Spell", ID = 20549     }),
    BullRush                               = Create({ Type = "Spell", ID = 255654     }),  
    GiftofNaaru                            = Create({ Type = "Spell", ID = 59544    }),
    Shadowmeld                             = Create({ Type = "Spell", ID = 58984    }), -- usable in Action Core 
    Stoneform                              = Create({ Type = "Spell", ID = 20594    }), 
    WilloftheForsaken                      = Create({ Type = "Spell", ID = 7744        }), -- not usable in APL but user can Queue it   
    EscapeArtist                           = Create({ Type = "Spell", ID = 20589    }), -- not usable in APL but user can Queue it
    EveryManforHimself                     = Create({ Type = "Spell", ID = 59752    }), -- not usable in APL but user can Queue it
    
    -- Spells
    -- Paladin General
    AvengingWrath                    = Action.Create({ Type = "Spell", ID = 31884    }),    
    BlessingofFreedom                = Action.Create({ Type = "Spell", ID = 1044        }),
    BlessingofProtection            = Action.Create({ Type = "Spell", ID = 1022        }),
    BlessingofSacrifice                = Action.Create({ Type = "Spell", ID = 6940        }),
    ConcentrationAura                = Action.Create({ Type = "Spell", ID = 317920    }),
    Consecration                    = Action.Create({ Type = "Spell", ID = 26573    }),
    CrusaderAura                    = Action.Create({ Type = "Spell", ID = 32223    }),
    CrusaderStrike                    = Action.Create({ Type = "Spell", ID = 35395    }),
    DevotionAura                    = Action.Create({ Type = "Spell", ID = 465        }),    
    DivineShield                    = Action.Create({ Type = "Spell", ID = 642        }),
    DivineSteed                        = Action.Create({ Type = "Spell", ID = 190784    }),
    FlashofLight                    = Action.Create({ Type = "Spell", ID = 19750, predictName = "FlashofLight"        }),
    HammerofJustice                    = Action.Create({ Type = "Spell", ID = 853        }),
    HammerofJusticeGreen            = Action.Create({ Type = "SpellSingleColor", ID = 853, Color = "GREEN", Desc = "[1] CC", Hidden = true, Hidden = true, QueueForbidden = true }),    
    HammerofWrath                    = Action.Create({ Type = "Spell", ID = 24275    }),
    HandofReckoning                    = Action.Create({ Type = "Spell", ID = 62124    }),    
    Judgment                        = Action.Create({ Type = "Spell", ID = 275773    }),
    LayOnHands                        = Action.Create({ Type = "Spell", ID = 633, predictName = "LayOnHands"            }),    
    Redemption                        = Action.Create({ Type = "Spell", ID = 7328        }),
    RetributionAura                    = Action.Create({ Type = "Spell", ID = 183435    }),
    ShieldoftheRighteous            = Action.Create({ Type = "Spell", ID = 53600    }),
    TurnEvil                        = Action.Create({ Type = "Spell", ID = 10326    }),
    WordofGlory                        = Action.Create({ Type = "Spell", ID = 85673, predictName = "WordofGlory"        }),    
    Forbearance                        = Action.Create({ Type = "Spell", ID = 25771    }),
    
    
    -- Holy Specific
    Absolution                        = Action.Create({ Type = "Spell", ID = 212056    }),
    AuraMastery                        = Action.Create({ Type = "Spell", ID = 31821    }),
    BeaconofLight                    = Action.Create({ Type = "Spell", ID = 53563    }),
    Cleanse                            = Action.Create({ Type = "Spell", ID = 4987        }),
    DivineProtection                = Action.Create({ Type = "Spell", ID = 498        }),
    HolyLight                        = Action.Create({ Type = "Spell", ID = 82326, predictName = "HolyLight"            }),
    HolyShock                        = Action.Create({ Type = "Spell", ID = 20473, predictName = "HolyShock"            }),
    LightofDawn                        = Action.Create({ Type = "Spell", ID = 85222, predictName = "LightofDawn"        }),
    LightofMartyr                    = Action.Create({ Type = "Spell", ID = 183998, predictName = "LightofMartyr"    }),
    InfusionofLight                    = Action.Create({ Type = "Spell", ID = 53576, Hidden = true        }),    
    InfusionofLightBuff                = Action.Create({ Type = "Spell", ID = 54149, Hidden = true        }),    
    
    -- Normal Talents
    CrusadersMight                    = Action.Create({ Type = "Spell", ID = 196926, Hidden = true    }),
    BestowFaith                        = Action.Create({ Type = "Spell", ID = 223306, predictName = "BestowFaith"        }),
    LightsHammer                    = Action.Create({ Type = "Spell", ID = 114158    }),    
    SavedbytheLight                    = Action.Create({ Type = "Spell", ID = 157047, Hidden = true    }),
    JudgmentofLight                    = Action.Create({ Type = "Spell", ID = 183778, Hidden = true    }),        
    HolyPrism                        = Action.Create({ Type = "Spell", ID = 114165, predictName = "HolyPrism"        }),
    FistofJustice                    = Action.Create({ Type = "Spell", ID = 234299, Hidden = true    }),
    Repentance                        = Action.Create({ Type = "Spell", ID = 20066    }),
    BlindingLight                    = Action.Create({ Type = "Spell", ID = 115750    }),        
    UnbreakableSpirit                = Action.Create({ Type = "Spell", ID = 114154, Hidden = true    }),        
    Cavalier                        = Action.Create({ Type = "Spell", ID = 230332, Hidden = true    }),
    RuleofLaw                        = Action.Create({ Type = "Spell", ID = 214202    }),
    DivinePurpose                    = Action.Create({ Type = "Spell", ID = 223817, Hidden = true    }),    
    DivinePurposeBuff               = Action.Create({ Type = "Spell", ID = 223819, Hidden = true     }),
    HolyAvenger                        = Action.Create({ Type = "Spell", ID = 105809    }),
    Seraphim                        = Action.Create({ Type = "Spell", ID = 152262    }),
    SanctifiedWrath                    = Action.Create({ Type = "Spell", ID = 53376    }),    
    AvengingCrusader                = Action.Create({ Type = "Spell", ID = 216331    }),
    Awakening                        = Action.Create({ Type = "Spell", ID = 248033, Hidden = true    }),
    GlimmerofLight                    = Action.Create({ Type = "Spell", ID = 325966, Hidden = true    }),
    GlimmerofLightBuff                = Action.Create({ Type = "Spell", ID = 287280, Hidden = true    }),
    BeaconofFaith                    = Action.Create({ Type = "Spell", ID = 156910    }),
    BeaconofVirtue                    = Action.Create({ Type = "Spell", ID = 200025    }),        
    
    -- PvP
    DivineFavor                               = Action.Create({ Type = "Spell", ID = 210294 }),
    HordeFlag                                = Action.Create({ Type = "Spell", ID = 156618 }),
    AllianceFlag                           = Action.Create({ Type = "Spell", ID = 156621 }),
    OrbofPowerPurple                               = Action.Create({ Type = "Spell", ID = 121175 }), 
    OrbofPowerGreen                               = Action.Create({ Type = "Spell", ID = 121176 }), 
    OrbofPowerBlue                               = Action.Create({ Type = "Spell", ID = 121164 }), 
    OrbofPowerOrange                        = Action.Create({ Type = "Spell", ID = 121177 }), 
    FocusedAssault                           = Action.Create({ Type = "Spell", ID = 46392 }),
    NetherstormFlag                           = Action.Create({ Type = "Spell", ID = 34976 }),
    CleanseTheWeak                            = Action.Create({ Type = "Spell", ID = 199330 }),
    RecentlySavedByTheLight                    = Action.Create({ Type = "Spell", ID = 157131 }),
    
    --    Later
    
    -- Covenant Abilities
    DivineToll                        = Action.Create({ Type = "Spell", ID = 304971    }),    
    SummonSteward                    = Action.Create({ Type = "Spell", ID = 324739    }),
    AshenHallow                        = Action.Create({ Type = "Spell", ID = 316958    }),    
    DoorofShadows                    = Action.Create({ Type = "Spell", ID = 300728    }),
    VanquishersHammer                = Action.Create({ Type = "Spell", ID = 328204    }),    
    Fleshcraft                        = Action.Create({ Type = "Spell", ID = 331180    }),
    BlessingoftheSeasons            = Action.Create({ Type = "Spell", ID = 328278    }),
    BlessingofSummer                = Action.Create({ Type = "Spell", ID = 328620    }),    
    BlessingofAutumn                = Action.Create({ Type = "Spell", ID = 328622    }),    
    BlessingofSpring                = Action.Create({ Type = "Spell", ID = 328282    }),    
    BlessingofWinter                = Action.Create({ Type = "Spell", ID = 328281    }),        
    Soulshape                        = Action.Create({ Type = "Spell", ID = 310143    }),
    Flicker                            = Action.Create({ Type = "Spell", ID = 324701    }),
    
    -- Conduits
    
    
    -- Legendaries
    -- General Legendaries
    
    --Holy Legendaries
    
    
    --Anima Powers - to add later...
    
    
    -- Trinkets
    
    
    -- Potions
    PotionofUnbridledFury            = Action.Create({ Type = "Potion", ID = 169299, QueueForbidden = true }),     
    SuperiorPotionofUnbridledFury    = Action.Create({ Type = "Potion", ID = 168489, QueueForbidden = true }),
    PotionofSpectralIntellect        = Action.Create({ Type = "Potion", ID = 171273, QueueForbidden = true }),
    PotionofSpectralStamina            = Action.Create({ Type = "Potion", ID = 171274, QueueForbidden = true }),
    PotionofEmpoweredExorcisms        = Action.Create({ Type = "Potion", ID = 171352, QueueForbidden = true }),
    PotionofHardenedShadows            = Action.Create({ Type = "Potion", ID = 171271, QueueForbidden = true }),
    PotionofPhantomFire                = Action.Create({ Type = "Potion", ID = 171349, QueueForbidden = true }),
    PotionofDeathlyFixation            = Action.Create({ Type = "Potion", ID = 171351, QueueForbidden = true }),
    SpiritualHealingPotion            = Action.Create({ Type = "Item", ID = 171267, QueueForbidden = true }),
    PhialofSerenity                    = Action.Create({ Type = "Item", ID = 177278 }),
    
    -- Misc
    Channeling                      = Action.Create({ Type = "Spell", ID = 209274, Hidden = true     }),    -- Show an icon during channeling
    TargetEnemy                     = Action.Create({ Type = "Spell", ID = 44603, Hidden = true     }),    -- Change Target (Tab button)
    StopCast                        = Action.Create({ Type = "Spell", ID = 61721, Hidden = true     }),        -- spell_magic_polymorphrabbit
    PoolResource                    = Action.Create({ Type = "Spell", ID = 209274, Hidden = true     }),
    Quake                           = Action.Create({ Type = "Spell", ID = 240447, Hidden = true     }), -- Quake (Mythic Plus Affix)
    Cyclone                         = Action.Create({ Type = "Spell", ID = 33786, Hidden = true     }), -- Cyclone     
    
}

-- To create essences use next code:
Action:CreateEssencesFor(ACTION_CONST_PALADIN_HOLY)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_PALADIN_HOLY], { __index = Action })


local player = "player"
local targettarget = "targettarget"
local target = "target"
local mouseover = "mouseover"
local focustarget = "focustarget"

-- Call to avoid lua limit of 60upvalues 
-- Call RotationsVariables in each function that need these vars
local function RotationsVariables()
    combatTime = Unit(player):CombatTime()
    inCombat = Unit(player):CombatTime() > 0
    UseDBM = GetToggle(1 ,"DBM") -- Don't call it DBM else it broke all the global DBM var used by another addons
    Potion = GetToggle(1, "Potion")
    Racial = GetToggle(1, "Racial")
    MouseOver = GetToggle(2, "mouseover")
    -- ProfileUI vars
    BeaconWorkMode = GetToggle(2, "BeaconWorkMode")    
    StartByPreCast = GetToggle(2, "StartByPreCast")
    TrinketMana = GetToggle(2, "TrinketMana")
    FlashofLightHP = GetToggle(2, "FlashofLightHP")
    HolyLightHP = GetToggle(2, "HolyLightHP")
    HolyShockHP = GetToggle(2, "HolyShockHP")
    WordofGloryHP = GetToggle(2, "WordofGloryHP")
    BestowFaithHP = GetToggle(2, "BestowFaithHP")
    HolyPrismHP = GetToggle(2, "HolyPrismHP")
    LightofMartyrHP = GetToggle(2, "LightofMartyrHP")
    LightofDawnHP = GetToggle(2, "LightofDawnHP")
    LightofDawnUnits = GetToggle(2, "LightofDawnUnits")
    UseLightofDawn = GetToggle(2, "UseLightofDawn")
    ForceGlimmerOnMaxUnits = GetToggle(2, "ForceGlimmerOnMaxUnits")
    -- Burst Settings from UI
    MythicPlusLogic = GetToggle(2, "MythicPlusLogic")
    StopCastOverHeal = GetToggle(2, "StopCastOverHeal")
    StopCastQuake = GetToggle(2, "StopCastQuake")
    StopCastQuakeSec = GetToggle(2, "StopCastQuakeSec")
    AutoFreedom = GetToggle(2, "AutoFreedom")
end


-- Get Lowest Tank
local function GetLowestTank(option)
    -- Get Current Tanks Table
    local CurrentTanks = A.HealingEngine.GetMembersByMode("TANK")
    
    -- Protect against nil values
    if #CurrentTanks == 0 then
        if option == "GUID" then
            return "NoGuid"
        end
        
        if option == 'HP' then
            return 1000
        end
        
        if option == 'AHP' then
            return 1000
        end
        
        if option == 'UnitID' then
            return "NoUnit"
        end
    end
    
    -- GUID
    if option == "GUID" then
        return CurrentTanks[1].GUID or "NoGuid"
    end
    
    -- HP
    if option == 'HP' then
        return CurrentTanks[1].HP or 1000
    end
    
    -- AHP
    if option == 'AHP' then
        return CurrentTanks[1].AHP or 1000
    end
    
    -- UnitID
    if option == 'UnitID' then
        return CurrentTanks[1].Unit or "NoUnit"
    end
end

-- Get Lowest Healer
local function GetLowestHealer(option)
    -- Get Current Healers Table
    local CurrentHealers = A.HealingEngine.GetMembersByMode("HEALER")
    
    -- Protect against nil values
    if #CurrentHealers == 0 then
        if option == "GUID" then
            return "NoGuid"
        end
        
        if option == 'HP' then
            return 1000
        end
        
        if option == 'AHP' then
            return 1000
        end
        
        if option == 'UnitID' then
            return "NoUnit"
        end
    end
    
    -- GUID
    if option == "GUID" then
        return CurrentHealers[1].GUID or "NoGuid"
    end
    
    -- HP
    if option == 'HP' then
        return CurrentHealers[1].HP or 1000
    end
    
    -- AHP
    if option == 'AHP' then
        return CurrentHealers[1].AHP or 1000
    end
    
    -- UnitID
    if option == 'UnitID' then
        return CurrentHealers[1].Unit or "NoUnit"
    end
end

-- Get Lowest DPS
local function GetLowestDamager(option)
    -- Get Current Damagers Table
    local CurrentDamagers = A.HealingEngine.GetMembersByMode("DAMAGER")
    --Unit = member, GUID = memberGUID, HP = memberhp, AHP = memberahp, isPlayer = true, incDMG = Actual_DMG
    
    -- Protect against nil values
    if #CurrentDamagers == 0 then
        if option == "GUID" then
            return "NoGuid"
        end
        
        if option == 'HP' then
            return 1000
        end
        
        if option == 'AHP' then
            return 1000
        end
        
        if option == 'UnitID' then
            return "NoUnit"
        end
    end
    
    -- GUID
    if option == "GUID" then
        return CurrentDamagers[1].GUID or "NoGuid"
    end
    
    -- HP
    if option == 'HP' then
        return CurrentDamagers[1].HP or 1000
    end
    
    -- AHP
    if option == 'AHP' then
        return CurrentDamagers[1].AHP or 1000
    end
    
    -- UnitID
    if option == 'UnitID' then
        return CurrentDamagers[1].Unit or "NoUnit"
    end
end

-- Get Lowest ALL
local function GetLowestALL(option)
    -- Get Current Members Table
    local CurrentMembers = A.HealingEngine.GetMembersAll()
    --Unit = member, GUID = memberGUID, HP = memberhp, AHP = memberahp, isPlayer = true, incDMG = Actual_DMG
    
    -- Protect against nil values
    if #CurrentMembers == 0 then
        if option == "GUID" then
            return "NoGuid"
        end
        
        if option == 'HP' then
            return 1000
        end
        
        if option == 'AHP' then
            return 1000
        end
        
        if option == 'UnitID' then
            return "NoUnit"
        end
    end
    
    -- GUID
    if option == "GUID" then
        return CurrentMembers[1].GUID or "NoGuid"
    end
    
    -- HP
    if option == 'HP' then
        return CurrentMembers[1].HP or 1000
    end
    
    -- AHP
    if option == 'AHP' then
        return CurrentMembers[1].AHP or 1000
    end
    
    -- UnitID
    if option == 'UnitID' then
        return CurrentMembers[1].Unit or "NoUnit"
    end
end

-- Get Lowest Ally depending on parameters 
-- @parameters target and option are mandatory
-- @target can be "TANK", "DAMAGER", "HEALER" or "ALL"
-- @option can be "GUID", "HP", "AHP" or "UnitID"
-- return the current lowest member depending of choosen option

local function GetLowestAlly(target, option)
    if target == "TANK" then
        return GetLowestTank(option)
    end
    
    if target == "DAMAGER" then
        return GetLowestDamager(option)
    end
    
    if target == "HEALER" then
        return GetLowestHealer(option)
    end
    
    if target == "ALL" then
        return GetLowestALL(option)
    end
end

healingTarget = "None"
healingTargetGUID = "None"

-- Custom targetting function
-- @Parameter: TARGET is mandatory
-- @usage: Arguments can be "TANK", "HEALER", "DAMAGER", "ALL"
-- Return current LowestAlly based on arguments, example: current lowest tank
local function ForceHealingTarget(TARGET)
    --local target = TARGET or nil
    local CurrentHealers = A.HealingEngine.GetMembersByMode("HEALER")
    local CurrentDamagers = A.HealingEngine.GetMembersByMode("DAMAGER")
    local CurrentTanks = A.HealingEngine.GetMembersByMode("TANK")
    local CurrentMembers = A.HealingEngine.GetMembersAll()
    healingTarget = "None"
    healingTargetGUID = "None"
    HealingEngine.SetTarget(healingTarget)
    
    if TARGET == "TANK" then
        healingTarget = CurrentTanks[1].Unit
        healingTargetGUID = CurrentTanks[1].GUID
        HealingEngine.SetTarget(healingTarget)
        return
    end
    
    if TARGET == "DPS" and CurrentDamagers[1].HP < hp then
        healingTarget = CurrentDamagers[1].Unit
        healingTargetGUID = CurrentDamagers[1].GUID
        HealingEngine.SetTarget(healingTarget)
        return
    end
    
    if TARGET == "HEAL" and CurrentHealers[1].HP < hp then
        healingTarget = CurrentHealers[1].Unit
        healingTargetGUID = CurrentHealers[1].GUID
        HealingEngine.SetTarget(healingTarget)
        return
    end
    
    if TARGET == "ALL" and CurrentMembers[1].HP < 99 then
        healingTarget = CurrentMembers[1].Unit
        healingTargetGUID = CurrentMembers[1].GUID
        HealingEngine.SetTarget(healingTarget)
        return
    end
end

-- Custom HPal Dispell handler
local function ShouldDispell(unit)
    -- Do not dispel these spells
    local blacklist = {
        33786,
        131736,
        30108,
        124465,
        34914
    }
    -- Dispell Types
    local dispelTypes = {
        "Poison",
        "Disease",
        "Magic"
    }
    
    for i = 1, 40 do
        for x = 1, #dispelTypes do
            local name, rank, icon, count, debuffType = UnitDebuff(unit, i) 
            if debuffType == dispelTypes[x] then
                for i = 1, #blacklist do
                    if Unit(unit):HasDeBuffs(blacklist[i], true) then
                        return false
                    end
                end
                return true
            end
        end
    end
    return false
end
ShouldDispell = A.MakeFunctionCachedDynamic(ShouldDispell)

local Temp                               = {
    TotalAndPhys                            = {"TotalImun", "DamagePhysImun"},
    TotalAndPhysKick                        = {"TotalImun", "DamagePhysImun", "KickImun"},
    TotalAndPhysAndCC                       = {"TotalImun", "DamagePhysImun", "CCTotalImun"},
    TotalAndPhysAndStun                     = {"TotalImun", "DamagePhysImun", "StunImun"},
    TotalAndPhysAndCCAndStun                = {"TotalImun", "DamagePhysImun", "CCTotalImun", "StunImun"},
    TotalAndMag                             = {"TotalImun", "DamageMagicImun"},
    TotalAndMagKick                         = {"TotalImun", "DamageMagicImun", "KickImun"},
    -- Anti overhealing
    IsSpellIsCast                           = {
        [A.FlashofLight:Info()]                 = "FlashofLight",
        [A.HolyLight:Info()]                    = "HolyLight",        
    }, 
}

local GetTotemInfo, IsMouseButtonDown, UnitIsUnit = GetTotemInfo, IsMouseButtonDown, UnitIsUnit

local function IsSchoolFree()
    return LoC:IsMissed("SILENCE") and LoC:Get("SCHOOL_INTERRUPT", "NATURE") == 0
end 

local function InMelee(unit)
    -- @return boolean 
    return A.CrusaderStrike:IsInRange(unit)
end 

-- @return boolean  
-- @parameters count, range are mandatory, others parameters optionals
local ActiveUnitPlates = MultiUnits:GetActiveUnitPlates()
local function GetByRange(count, range, isCheckEqual, isCheckCombat)
    local c = 0 
    for unit in pairs(ActiveUnitPlates) do 
        if (not isCheckEqual or not UnitIsUnit(target, unit)) and (not isCheckCombat or Unit(unit):CombatTime() > 0) then 
            if InMelee(unit) then 
                c = c + 1
            elseif range then 
                local r = Unit(unit):GetRange()
                if r > 0 and r <= range then 
                    c = c + 1
                end 
            end 
            
            if c >= count then 
                return true 
            end 
        end 
    end
end  


-- [1] CC AntiFake Rotation
local function AntiFakeStun(unit) 
    return 
    IsUnitEnemy(unit) and  
    Unit(unit):GetRange() <= 10 and 
    A.HammerofJusticeGreen:AbsentImun(unit, Temp.TotalAndPhysAndCCAndStun, true)          
end 
A[1] = function(icon)    
    local useKick, useCC, useRacial = A.InterruptIsValid(targettarget, "TargetMouseover")    
    
    
    
    -- Manual Key
    if     A.HammerofJusticeGreen:IsReady(nil, nil, nil, true) and 
    (
        AntiFakeStun(mouseover) or 
        AntiFakeStun(target) or 
        (
            not IsUnitEnemy(mouseover) and 
            not IsUnitEnemy(target) and                     
            (
                (A.IsInPvP and EnemyTeam():PlayersInRange(1, 10)) or 
                (not A.IsInPvP and GetByRange(1, 10))
            )
        )
    )
    then 
        return A.HammerofJusticeGreen:Show(icon)         
    end
    
    
end

local function SelfDefensives()
    if Unit(player):CombatTime() == 0 then 
        return 
    end 
    
    local unit
    if A.IsUnitEnemy("mouseover") then 
        unit = "mouseover"
    elseif A.IsUnitEnemy("target") then 
        unit = "target"
    end  
    
    -- DivineShield
    if A.DivineShield:IsReady(player) and combatTime > 0 and Unit(player):HasDeBuffs(A.Forbearance.ID, true) == 0 and Unit(player):HealthPercent() < 20 and Unit(player):TimeToDieX(20) < 3
    then 
        return A.DivineShield
    end
    
    -- BlessingofProtection
    if A.BlessingofProtection:IsReady(player) and combatTime > 0 and not A.DivineShield:IsReady(player) and Unit(player):HealthPercent() < 30 and Unit(player):TimeToDieX(20) < 3 and Unit(player):HasDeBuffs(A.Forbearance.ID, true) == 0
    then 
        return A.BlessingofProtection
    end
    
    -- DivineProtection
    if A.DivineProtection:IsReady(player) and Unit(player):HealthPercent() < 60 and Unit(player):TimeToDieX(20) < 10 then
        return A.DivineProtection
    end
    
    if not Player:IsStealthed() then     
        -- Healthstone | AbyssalHealingPotion
        local Healthstone = GetToggle(1, "HealthStone") 
        if Healthstone >= 0 then 
            if A.HS:IsReady(player) then                     
                if Healthstone >= 100 then -- AUTO 
                    if Unit(player):TimeToDie() <= 9 and Unit(player):HealthPercent() <= 40 then                    
                        return A.HS
                    end 
                elseif Unit(player):HealthPercent() <= Healthstone then                 
                    return A.HS                             
                end
            elseif A.Zone ~= "arena" and (A.Zone ~= "pvp" or not Action.InstanceInfo.isRated) and A.SpiritualHealingPotion:IsReady(player) then 
                if Healthstone >= 100 then -- AUTO 
                    if Unit(player):TimeToDie() <= 9 and Unit(player):HealthPercent() <= 40 and Unit(player):HealthDeficit() >= A.SpiritualHealingPotion:GetItemDescription()[1] then                    
                        return A.AbyssalHealingPotion
                    end 
                elseif Unit(player):HealthPercent() <= Healthstone then                
                    return A.AbyssalHealingPotion                         
                end                
            end 
        end
        
        -- PhialofSerenity
        if A.Zone ~= "arena" and (A.Zone ~= "pvp" or not Action.InstanceInfo.isRated) and A.PhialofSerenity:IsReady(player) then 
            -- Healing 
            local PhialofSerenityHP, PhialofSerenityOperator, PhialofSerenityTTD = GetToggle(2, "PhialofSerenityHP"), GetToggle(2, "PhialofSerenityOperator"), GetToggle(2, "PhialofSerenityTTD")
            if PhialofSerenityOperator == "AND" then 
                if (PhialofSerenityHP <= 0 or Unit(player):HealthPercent() <= PhialofSerenityHP) and (PhialofSerenityTTD <= 0 or Unit(player):TimeToDie() <= PhialofSerenityTTD) then 
                    return A.PhialofSerenity
                end 
            else
                if (PhialofSerenityHP > 0 and Unit(player):HealthPercent() <= PhialofSerenityHP) or (PhialofSerenityTTD > 0 and Unit(player):TimeToDie() <= PhialofSerenityTTD) then 
                    return A.PhialofSerenity
                end 
            end 
            
            -- Dispel 
            if AuraIsValidByPhialofSerenity() then 
                return A.PhialofSerenity    
            end 
        end 
    end
    
    -- Stoneform on self dispel (only PvE)
    if A.Stoneform:IsRacialReady("player", true) and not A.IsInPvP and A.AuraIsValid("player", "UseDispel", "Dispel") then 
        return A.Stoneform
    end 
    
end 
SelfDefensives = A.MakeFunctionCachedStatic(SelfDefensives)

-----------------------------------------
--        ROTATION FUNCTIONS           --
-----------------------------------------

-- Return boolean
-- Current HPS > Incoming damage
local function IsEnoughHPS(unit)
    return Unit(player):GetHPS() > Unit(unit):GetDMG()
end 

-- Return boolean
-- Current Group HPS > Incoming damage
local function IsGroupEnoughHPS()
    return ((HealingEngine.GetIncomingHPSAVG() > HealingEngine.GetIncomingDMGAVG()) or (not IsInRaid() and not IsInGroup()))
end

-- Return boolean
-- Current Group is taking massive damage that need burst
local function NeedEmergencyHPS()
    return ( HealingEngine.GetIncomingHPSAVG() * 2 < HealingEngine.GetIncomingDMGAVG() )
end

-- Return boolean
-- Current Group is taking ultra massive damage that need burst
local function NeedUltraEmergencyHPS()
    return ( HealingEngine.GetIncomingHPSAVG() * 3 < HealingEngine.GetIncomingDMGAVG() )
end

-- Return total active Glimmer of Light buff and debuff
local function GlimmerofLightCount()
    return HealingEngine.GetBuffsCount(A.GlimmerofLightBuff.ID, 0, player, true)
end

-- Return valid members that can be healed
--@parameter IsPlayer : return only members that are real players
local function GetValidMembers(IsPlayer)
    local HealingEngineMembersALL = A.HealingEngine.GetMembersAll()
    if not IsPlayer then 
        return #HealingEngineMembersALL
    else 
        local total = 0 
        if #HealingEngineMembersALL > 0 then 
            for i = 1, #HealingEngineMembersALL do
                if Unit(HealingEngineMembersALL[i].Unit):IsPlayer() then
                    total = total + 1
                end
            end 
        end 
        return total 
    end 
end

-- Tracks destination unit of the casting spells to prevent by stopcasting overhealing 
local TeamCacheFriendlyGUIDs                = Action.TeamCache.Friendly.GUIDs
local function CastStart(event, ...)
    local unitID, _, spellID = ...
    if unitID == player and spellID then 
        local spellName = GetSpellInfo(spellID)
        if spellName and Temp.IsSpellIsCast[spellName] then 
            Temp.LastPrimaryUnitGUID     = (IsUnitFriendly(mouseover) and Unit(mouseover):InfoGUID()) or (IsUnitFriendly(target) and Unit(target):InfoGUID()) or Unit(player):InfoGUID()
            Temp.LastPrimaryUnitID       = TeamCacheFriendlyGUIDs[Temp.LastPrimaryUnitGUID]
            Temp.LastPrimarySpellName    = spellName 
            Temp.LastPrimarySpellID      = spellID
        end 
    end 
end 

local function CastStop(event, ...)
    if Temp.LastPrimaryUnitGUID then     
        local unitID = ...
        if unitID == player then 
            Temp.LastPrimaryUnitGUID     = nil 
            Temp.LastPrimaryUnitID       = nil 
            Temp.LastPrimarySpellName    = nil 
            Temp.LastPrimarySpellID      = nil 
        end 
    end 
end 

Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_START",            CastStart   )
Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_STOP",             CastStop    )
Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_FAILED",           CastStop    )
Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_INTERRUPTED",      CastStop    )
Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_CHANNEL_START",    CastStart   )
Listener:Add("ACTION_EVENT_HOLY_PALADIN", "UNIT_SPELLCAST_CHANNEL_STOP",     CastStop    )

local function CanStopCastingOverHeal(unitID, unitGUID)
    -- @return boolean 
    if GetToggle(1, "StopCast") and Temp.LastPrimaryUnitGUID then
        local castLeftSeconds, castDonePercent, _, spellName = Unit(player):IsCastingRemains()
        if castLeftSeconds > 0 and castLeftSeconds <= 0.35 and spellName == Temp.LastPrimarySpellName and (Temp.LastPrimaryUnitID or (unitID and ((unitGUID or UnitGUID(unitID)) == Temp.LastPrimaryUnitGUID))) then
            local unit = Temp.LastPrimaryUnitID or unitID
            if Unit(unit):HealthPercent() >= 100 then 
                return true 
            end 
            
            local Key = Temp.IsSpellIsCast[spellName]
            local ObjKey
            for i = 0, huge do 
                if i == 0 then 
                    ObjKey = Key
                else 
                    ObjKey = Key .. i
                end 
                
                if A[ObjKey] then 
                    if A[ObjKey].ID == Temp.LastPrimarySpellID then 
                        --return not A[ObjKey]:PredictHeal(unit, 0.8, unitGUID)
                        return not A[ObjKey]:PredictHeal(unit, 0.8)
                    end 
                else 
                    break 
                end 
            end 
        end 
    end 
end 

-- Return average DMG taken from all our current member team
local function FriendlyTeamReceivedLast5sec()
    local total = 0
    local getmembersAll = HealingEngine.GetMembersAll()
    
    if #getmembersAll > 0 then 
        for i = 1, #getmembersAll do
            -- Avoid getting pet damage
            if Unit(getmembersAll[i].Unit):IsPlayer() then
                total = total + Unit(getmembersAll[i].Unit):GetLastTimeDMGX(5)
            end
        end
        
        avg = total / #getmembersAll
    end 
    return total
end

function FriendlyTeam:GetLastTimeDMGX(x, range)
    -- @return number, number, number
    -- [1] Average received damage latest 'x' seconds 
    -- [2] Summary received damage latest 'x' seconds 
    -- [3] Count of members valid for conditions
    -- Nill-able: range
    local ROLE                            = self.ROLE
    local lastDMG, members                = 0, 0
    local member
    
    if TeamCacheFriendly.Size <= 1 then 
        if Unit("player"):Role(ROLE) then  
            lastDMG = Unit("player"):GetLastTimeDMGX(x)
            return lastDMG, 1     
        end 
        
        return lastDMG, members
    end         
    
    if ROLE and TeamCacheFriendly[ROLE] then 
        for member in pairs(TeamCacheFriendly[ROLE]) do
            if Unit(member):InRange() and (not range or Unit(member):GetRange() <= range) then
                lastDMG = lastDMG + Unit(member):GetLastTimeDMGX(x)   
                members = members + 1
            end             
        end             
    else
        for i = 1, TeamCacheFriendly.MaxSize do
            member = TeamCacheFriendlyIndexToPLAYERs[i]                
            if member and Unit(member):InRange() and (not range or Unit(member):GetRange() <= range) then
                lastDMG = lastDMG + Unit(member):GetLastTimeDMGX(x)   
                members = members + 1
            end 
        end  
        
        if TeamCacheFriendly.Type ~= "raid" then
            lastDMG = lastDMG + Unit("player"):GetLastTimeDMGX(x)  
            members = members + 1
        end 
    end      
    
    if lastDMG == 0 and members == 0 then 
        return 0, lastDMG, members
    else 
        return lastDMG / members, lastDMG, members
    end 
end


-- [3] Single Rotation
A[3] = function(icon, isMulti)
    --------------------
    --- ROTATION VAR ---
    --------------------
    local CurrentTanks = HealingEngine.GetMembersByMode("TANK")
    local getmembersAll = HealingEngine.GetMembersAll()
    local inCombat = Unit(player):CombatTime() > 0
    local isMoving = Player:IsMoving()
    local isMovingFor = A.Player:IsMovingTime()
    local combatTime = Unit(player):CombatTime()    
    local ShouldStop = Action.ShouldStop()
    local Pull = Action.BossMods:GetPullTimer()
    local AoEON = GetToggle(2, "AoE")
    local GlimmerofLightCount = GlimmerofLightCount()    
	local InMelee = InMelee()	
    local StatMultiplier = 1
    if A.Zone == "arena" or A.InstanceInfo.isRated then
        StatMultiplier = (((100 + Player:VersatilityDmgPct())/100) * 1.4)
    end
    if A.Zone ~= "arena" and not A.InstanceInfo.isRated then
        StatMultiplier = ((100 + Player:VersatilityDmgPct())/100)
    end
    local HSMultiplier = 1
    if A.Zone == "arena" or A.InstanceInfo.isRated then
        HSMultiplier = (((100 + Player:VersatilityDmgPct())/100) * 1.4)
    end
    if A.Zone ~= "arena" and not A.InstanceInfo.isRated then
        HSMultiplier = ((100 + Player:VersatilityDmgPct())/100)
    end
    local AvengingWrathMultiplier = 1
    if Unit(player):HasBuffs(A.AvengingWrath.ID, true) > 0 then
        AvengingWrathMultiplier = 1.3
    end
    if Unit(player):HasBuffs(A.AvengingWrath.ID, true) == 0 then
        AvengingWrathMultiplier = 1
    end
    -- Healing Engine vars
    local ReceivedLast5sec = FriendlyTeam("ALL"):GetLastTimeDMGX(5) --Unit(player):GetLastTimeDMGX(5) -- LastIncDMG(player, 5)
    local AVG_DMG = HealingEngine.GetIncomingDMGAVG()
    local AVG_HPS = HealingEngine.GetIncomingHPSAVG()
    local TeamCacheEnemySize = TeamCache.Enemy.Size
    local DungeonGroup = TeamCache.Friendly.Size >= 2 and TeamCache.Friendly.Size <= 5
    local RaidGroup = TeamCache.Friendly.Size >= 5
    local TeamCacheFriendlySize = TeamCache.Friendly.Size
    local TeamCacheFriendlyType = TeamCache.Friendly.Type or "none"     
    
    
    RotationsVariables()    
    
    --------------------------------
    local UseCovenant = A.GetToggle(1, "Covenant")
    
    --------------------
    --- DPS ROTATION ---
    --------------------
    local function DamageRotation(unitID)
        
        if A.Zone == "pvp" or A.Zone ~= "pvp" and inCombat then
            
            local useCC = Action.InterruptIsValid(target)
            if useCC and A.HammerofJustice:IsReady(target) and Unit(target):GetRange() <= 10 and A.HammerofJustice:AbsentImun(target, Temp.TotalAndPhysAndCC) and not Unit(target):IsBoss() and IsUnitEnemy(target) and not Unit(target):IsDead() and Unit(target):CanInterrupt(true, nil, 20, 85)
            then 
                return A.HammerofJustice:Show(icon)       
            end          
            if useCC and A.HammerofJustice:IsReady(mouseover) and Unit(mouseover):GetRange() <= 10 and A.HammerofJustice:AbsentImun(mouseover, Temp.TotalAndPhysAndCC) and not Unit(mouseover):IsBoss() and IsUnitEnemy(mouseover) and not Unit(mouseover):IsDead() and Unit(mouseover):CanInterrupt(true, nil, 20, 85)
            then 
                return A.HammerofJustice:Show(icon)     
            end
            if useCC and A.BlindingLight:IsReady(target) and Unit(target):GetRange() <= 10 and A.BlindingLight:AbsentImun(target, Temp.TotalAndPhysAndCC) and not Unit(target):IsBoss() and IsUnitEnemy(target) and not Unit(target):IsDead() and Unit(target):CanInterrupt(true, nil, 20, 85)
            then 
                return A.BlindingLight:Show(icon)       
            end            
            
            if A.VanquishersHammer:IsReady(target) and UseCovenant then
                return A.VanquishersHammer:Show(icon)
            end    
            
            if A.Consecration:IsReady(player) and IsUnitEnemy(target) and A.CrusaderStrike:IsInRange(target) then
                return A.Consecration:Show(icon)
            end
            
            if A.ShieldoftheRighteous:IsReady(player) and Unit(target):GetRange() <= 5 and IsUnitEnemy(target) and Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0 and (HealingEngine.GetBelowHealthPercentUnits(90, 40) < 1 or TeamCache.Friendly.Size <= 2) then
                return A.ShieldoftheRighteous:Show(icon)
            end
            
            if A.HammerofWrath:IsReady(target) and Unit(target):GetRange() <= 30 and IsUnitEnemy(target) and Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0 then
                return A.HammerofWrath:Show(icon)
            end
            
            if A.Judgment:IsReady(target) and Unit(target):GetRange() <= 30 and IsUnitEnemy(target) and Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0 then
                return A.Judgment:Show(icon)
            end
            
            if A.HolyShock:IsReady(target) and Unit(target):GetRange() <= 40 and IsUnitEnemy(target) and Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0 then
                return A.HolyShock:Show(icon)
            end
            
            if A.CrusaderStrike:IsReady(target) and A.CrusaderStrike:IsInRange(target) and IsUnitEnemy(target) and Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0 then
                return A.CrusaderStrike:Show(icon)
            end
            
        end
        
    end
    DamageRotation = Action.MakeFunctionCachedDynamic(DamageRotation)
    
    ---------------------
    --- HEAL ROTATION ---
    ---------------------
    local function HealingRotation(unitID) 
        
        local useDispel, useShields, useHoTs, useUtils = HealingEngine.GetOptionsByUnitID(unitID)
        local unitGUID = UnitGUID(unitID)    
        
        --Devotion Aura
        if A.DevotionAura:IsReady(player) and Unit(player):HasBuffs(A.DevotionAura.ID) == 0 and Unit(player):HasBuffs(A.CrusaderAura.ID) == 0 and Unit(player):HasBuffs(A.RetributionAura.ID) == 0 
        and Unit(player):HasBuffs(A.ConcentrationAura.ID) == 0 then
            return A.DevotionAura:Show(icon)
        end
        
        --Avenging Wrath
        if A.AvengingWrath:IsReady(unitID) and combatTime > 0 and not Unit(unitID):IsDead() and Unit(player):HasBuffs(A.HolyAvenger.ID, true) == 0 and HealingEngine.GetBelowHealthPercentUnits(50, 30) >= 3 then
            return A.AvengingWrath:Show(icon)
        end    
        
        --Holy Avenger
        if A.HolyAvenger:IsReady(unitID) and combatTime > 0 and not Unit(unitID):IsDead() and HealingEngine.GetBelowHealthPercentUnits(50, 30) >= 3 and Unit(player):HasBuffs(A.AvengingWrath.ID, true) == 0 then
            return A.HolyAvenger:Show(icon)
        end    
        
        --Lay on hands
        if combatTime > 0 and Action.Zone ~= "arena" and not Action.InstanceInfo.isRated   -- Forbearance
        then
            for i = 1, #getmembersAll do 
                if Unit(getmembersAll[i].Unit):GetRange() <= 40 then 
                    if not Unit(getmembersAll[i].Unit):IsPet() and not Unit(getmembersAll[i].Unit):IsDead() and A.LayOnHands:IsReady(getmembersAll[i].Unit) and (Unit(getmembersAll[i].Unit):HealthPercent() <= 20 
                        and Unit(getmembersAll[i].Unit):TimeToDie() <= 2) and Unit(getmembersAll[i].Unit):HasDeBuffs(A.Forbearance.ID, true) == 0 then
                        HealingEngine.SetTarget(getmembersAll[i].Unit, 0.3)    -- Add 1sec delay in case of emergency switch     
                        return A.LayOnHands:Show(icon)                        
                    end                    
                end                
            end    
            
        end 
        
        --Blessing of Sacrifice
        if A.BlessingofSacrifice:IsReady(unitID) and combatTime > 0 and not UnitIsUnit(unitID, player) and not Unit(unitID):IsPet() and not Unit(unitID):IsDead() and Unit(unitID):HealthPercent() <= 40 
        and Unit(unitID):TimeToDieX(20) <= 4 then
            return A.BlessingofSacrifice:Show(icon)
        end    
        
        --Blessing of Protection
        if A.BlessingofProtection:IsReady(unitID) and combatTime > 0 and not Unit(unitID):IsPet() and not Unit(unitID):IsTank() and not UnitIsUnit(unitID, player) and not Unit(unitID):IsDead() 
        and Unit(unitID):HealthPercent() <= 30 and Unit(unitID):TimeToDieX(20) <= 4 and Unit(unitID):HasDeBuffs(A.OrbofPowerBlue.ID) == 0 and Unit(unitID):HasDeBuffs(A.OrbofPowerGreen.ID) == 0 
        and Unit(unitID):HasDeBuffs(A.OrbofPowerPurple.ID) == 0 and Unit(unitID):HasDeBuffs(A.OrbofPowerOrange.ID) == 0 
        and not Unit(unitID):HasFlags() then
            return A.BlessingofProtection:Show(icon)
        end    
        
        --Aura Mastery
        if DungeonGroup then
            if A.AuraMastery:IsReady(unitID) and combatTime > 0 and Unit(unitID):TimeToDieX(20) <= 5 and HealingEngine.GetBelowHealthPercentUnits(50, 40) >= 3 then
                return A.AuraMastery:Show(icon)
            end    
        end
        
        if RaidGroup then
            if A.AuraMastery:IsReady(unitID) and combatTime > 0 and Unit(unitID):TimeToDieX(20) <= 5 and HealingEngine.GetBelowHealthPercentUnits(50, 40) >= 5 then
                return A.AuraMastery:Show(icon)
            end    
        end    
        
        --Holy Light Infusion proc
        if A.HolyLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) > 0 and Unit(unitID):HealthDeficit() >= ((WordofGloryHP/1.211) * 1.3 * AvengingWrathMultiplier * StatMultiplier * 2) and not Unit(unitID):IsDead() and Unit(player):HasBuffs(A.InfusionofLightBuff.ID, true) > 2.3 + GetCurrentGCD() and A.HolyLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= HolyLightHP and Unit(player):GetCurrentSpeed() == 0 then
            return A.HolyLight:Show(icon)
        end    
        
        --Holy Light no infusion
        if A.HolyLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) > 0 and Unit(unitID):HealthDeficit() >= ((WordofGloryHP/1.211) * AvengingWrathMultiplier * StatMultiplier * 2) and not Unit(unitID):IsDead() and A.HolyLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= HolyLightHP and Unit(player):GetCurrentSpeed() == 0 then
            return A.HolyLight:Show(icon)
        end    
        
        -- Beacon of Light - Self
        if A.BeaconofLight:IsReady() and BeaconWorkMode == "Self" then
            if UnitIsUnit(unitID, player) and Unit(player):HasBuffs(A.BeaconofLight.ID, true) == 0  then    
                return A.BeaconofLight:Show(icon)                        
            end                    
        end
        
        -- Beacon of Light - Tank
        if A.BeaconofLight:IsReady() and BeaconWorkMode == "Tanking Units" then
            if Unit(unitID):Role("TANK") and Unit(unitID):HasBuffs(A.BeaconofLight.ID, true) == 0 and HealingEngine.GetBuffsCount(A.BeaconofLight.ID) == 0 then
                return A.BeaconofLight:Show(icon)
            end
        end
        
        -- Beacon of Light - Beacon of Faith + Saved By the Light
        if A.SavedbytheLight:IsTalentLearned() and A.BeaconofFaith:IsTalentLearned() and BeaconWorkMode == "Beacon of Faith + Saved By the Light" then
            if UnitIsUnit(unitID, player) and not Unit(unitID):IsDead() and Unit(player):HasBuffs(A.BeaconofLight.ID, true) == 0 and Unit(player):HasDeBuffs(A.RecentlySavedByTheLight.ID, true) == 0 
            or not UnitIsUnit(unitID, player) and HealingEngine.GetBuffsCount(A.BeaconofFaith.ID) > 0 and Unit(unitID):HasDeBuffs(A.Cyclone.ID, true) == 0 and not Unit(unitID):IsDead() and IsUnitFriendly(unitID) and Unit(unitID):IsPlayer() and Unit(player):HasDeBuffs(A.RecentlySavedByTheLight.ID, true) > 0 and Unit(unitID):HasDeBuffs(A.RecentlySavedByTheLight.ID, true) == 0 and Unit(unitID):HasBuffs(A.BeaconofLight.ID, true) == 0 and Unit(unitID):HasBuffs(A.BeaconofFaith.ID, true) == 0 and Unit(unitID):HealthPercent() <= 45 and combatTime > 0 then
                return A.BeaconofLight:Show(icon)                        
            end           
            if IsUnitFriendly(unitID) and Unit(unitID):HasDeBuffs(A.Cyclone.ID, true) == 0 and not UnitIsUnit(unitID, player) and not Unit(unitID):IsDead() and Unit(unitID):IsPlayer() and Unit(unitID):HasBuffs(A.RecentlySavedByTheLight.ID, true) == 0 and (Unit(player):HasBuffs(A.BeaconofLight.ID, true) == 0 or Unit(player):HasDeBuffs(A.RecentlySavedByTheLight.ID, true) == 0) and Unit(unitID):HasBuffs(A.BeaconofLight.ID, true) == 0 and Unit(unitID):HasBuffs(A.BeaconofFaith.ID, true) == 0 and Unit(unitID):HealthPercent() <= 45 and combatTime > 0 then
                return A.BeaconofFaith:Show(icon)
            end
        end
        
        --Beacon of Virtue
        if A.BeaconofVirtue:IsReady(unitID) and A.BeaconofVirtue:IsTalentLearned() and TeamCacheFriendlyType ~= "none" and
        (
            (       
                not IsUnitEnemy(target) and
                A.BeaconofVirtue:IsInRange(target) and
                Unit(target):HasDeBuffs(A.Cyclone.ID, true) == 0
            )
        ) and
        (
            (
                DungeonGroup and
                HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 3 
            ) or
            (
                RaidGroup and
                HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 4
            )
        )
        then
            return A.BeaconofVirtue:Show(icon)
        end
        
        -- #17 HPvE DivineToll
        if A.DivineToll:IsReady(unit) and combatTime > 0 and A.DivineToll:IsReadyByPassCastGCD(unit) then
            for i = 1, #getmembersAll do 
                if Unit(getmembersAll[i].Unit):IsPlayerOrPet() and not Unit(getmembersAll[i].Unit):IsDead() and Unit(getmembersAll[i].Unit):HealthPercent() <= 90 and not IsUnitEnemy(getmembersAll[i].Unit) 
                and A.DivineToll:IsReady(getmembersAll[i].Unit) and Unit(getmembersAll[i].Unit):GetRange() <= 30 
                and
                ((Player:HolyPower() <= 1 and
                        (    (Action.Zone == "arena" and (TeamCache.Friendly.Size >= 2 and HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 2))
                            or
                            (TeamCacheFriendlyType == "none" and MultiUnits:GetByRange(10) > 2 and Unit(player):HealthPercent() <= 80) 
                            or
                            (TeamCacheFriendlyType == "party" and HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 3) 
                            or
                            (TeamCacheFriendlyType == "raid" and HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 3)
                        )
                    ) 
                    or
                    HealingEngine.GetBelowHealthPercentUnits(80, 30) >= 3 and Player:HolyPower() <= 3)
                then
                    HealingEngine.IsMostlyIncDMG(getmembersAll[i].Unit)   
                    return A.DivineToll:Show(icon)
                end
            end
        end         
        
        
        --Ashen Hallow
        if A.AshenHallow:IsReady(unitID) and UseCovenant and HealingEngine.GetBelowHealthPercentUnits(95, 30) >= 3 then
            return A.AshenHallow:Show(icon)
        end

        if A.LightofDawn:IsReady(unitID) and not Unit(unitID):IsDead() and A.LightofDawn:PredictHeal(unitID) and TeamCacheFriendlyType == "raid" and UseLightofDawn and HealingEngine.GetBelowHealthPercentUnits(LightofDawnHP, 15) >= LightofDawnUnits then
            return A.LightofDawn:Show(icon)
        end
        
        --Word of Glory at 5 HP
        if A.WordofGlory:IsReady(unitID) and not Unit(unitID):IsDead() and A.WordofGlory:PredictHeal(unitID) and Unit(unitID):HealthDeficit() >= (WordofGloryHP * StatMultiplier * AvengingWrathMultiplier) and Player:HolyPower() >= 5 then
            return A.WordofGlory:Show(icon)
        end
        
        if A.HolyPrism:IsReady(unitID) and not Unit(unitID):IsDead() and A.HolyPrism:PredictHeal(unitID) and Unit(unitID):HealthDeficit() >= (HolyPrismHP * StatMultiplier * AvengingWrathMultiplier) then
            return A.HolyPrism:Show(icon)
        end       
        
        --Holy Shock target
        if A.HolyShock:IsReady(unitID) and not Unit(unitID):IsDead() and A.HolyShock:PredictHeal(unitID) and Unit(unitID):HealthDeficit() >= (HolyShockHP * HSMultiplier * AvengingWrathMultiplier) then
            return A.HolyShock:Show(icon)
        end
        
        --Word of Glory 3 HP
        if A.WordofGlory:IsReady(unitID) and not Unit(unitID):IsDead() and A.WordofGlory:PredictHeal(unitID) and Unit(unitID):HealthDeficit() >= (WordofGloryHP * StatMultiplier * AvengingWrathMultiplier) then
            return A.WordofGlory:Show(icon)
        end
        
        if not Action.InstanceInfo.isRated or Action.InstanceInfo.isRated and (Unit(unitID):HealthPercent() >= 30 or Unit(unitID):HealthPercent() < 30 and not A.HolyShock:IsReady() and not A.WordofGlory:IsReady()) then
            
            -- Dispel Sniper
            if A.Cleanse:IsReady() and A.GetToggle(2, "DispelSniper") then
                for i = 1, #getmembersAll do 
                    if Unit(getmembersAll[i].Unit):GetRange() <= 40 and not Unit(getmembersAll[i].Unit):IsDead() and AuraIsValid(getmembersAll[i].Unit, "UseDispel", "Dispel") 
                    and (Unit(getmembersAll[i].Unit):HasDeBuffs(342938, true) == 0 or not A.CleanseTheWeak:IsTalentLearned() and Unit(getmembersAll[i].Unit):HasDeBuffs(342938, true) > 0 and Unit(player):HealthPercent() >= 90 or A.CleanseTheWeak:IsTalentLearned() and Unit(getmembersAll[i].Unit):HasDeBuffs(342938, true) > 0 and Unit(player):HealthPercent() >= 90 and HealingEngine.GetDeBuffsCount(342938) <= 1) then  
                        HealingEngine.SetTarget(getmembersAll[i].Unit, 0.3)                                      
                    end                
                end
            end
            
            if A.BlessingofFreedom:IsReady() and A.GetToggle(2, "DispelSniper") then
                for i = 1, #getmembersAll do 
                    if Unit(getmembersAll[i].Unit):GetRange() <= 40 and not Unit(getmembersAll[i].Unit):IsDead() and Unit(getmembersAll[i].Unit):HasBuffs(A.BlessingofFreedom.ID) == 0 
                    and AuraIsValid(getmembersAll[i].Unit, true, "BlessingofFreedom") then  
                        HealingEngine.SetTarget(getmembersAll[i].Unit, 0.3)                                      
                    end                
                end
            end
            
            -- #1 HPvE Dispel
            if A.Cleanse:IsReady(unitID) and
            useDispel and (Unit(unitID):HasDeBuffs(342938, true) == 0 or not A.CleanseTheWeak:IsTalentLearned() and Unit(unitID):HasDeBuffs(342938, true) > 0 and Unit(player):HealthPercent() >= 90 or A.CleanseTheWeak:IsTalentLearned() and Unit(unitID):HasDeBuffs(342938, true) > 0 and Unit(player):HealthPercent() >= 90 and HealingEngine.GetDeBuffsCount(342938) <= 1) and
            (
                -- MouseOver
                (
                    A.GetToggle(2, "mouseover") and
                    Unit("mouseover"):IsExists() and 
                    MouseHasFrame() and                      
                    not IsUnitEnemy("mouseover") and         
                    AuraIsValid(mouseover, "UseDispel", "Dispel")
                ) or 
                (
                    (
                        not A.GetToggle(2, "mouseover") or 
                        not Unit("mouseover"):IsExists() or 
                        IsUnitEnemy("mouseover")
                    ) and        
                    not IsUnitEnemy("target") and A.GetToggle(2, "DispelSniper") and
                    AuraIsValid(target, "UseDispel", "Dispel")
                )
            )
            then
                return A.Cleanse:Show(icon)
            end        
            
            -- #2 HPvE BoF
            if A.BlessingofFreedom:IsReady(unitID) and Unit(unitID):HasBuffs(A.BlessingofFreedom.ID) == 0 and
            useUtils and
            (
                -- MouseOver
                (
                    A.GetToggle(2, "mouseover") and
                    Unit("mouseover"):IsExists() and 
                    MouseHasFrame() and                      
                    not IsUnitEnemy("mouseover") and         
                    AuraIsValid(mouseover, true, "BlessingofFreedom")
                ) or 
                (
                    (
                        not A.GetToggle(2, "mouseover") or 
                        not Unit("mouseover"):IsExists() or 
                        IsUnitEnemy("mouseover")
                    ) and        
                    not IsUnitEnemy("target") and A.GetToggle(2, "DispelSniper") and
                    AuraIsValid(target, true, "BlessingofFreedom")
                )
            )
            then
                return A.BlessingofFreedom:Show(icon)
            end        
            
        end
        
        if A.ArcaneTorrent:IsReady(player) and not Unit(player):IsDead() and Player:HolyPower() == 2 and combatTime > 0 then
            return A.ArcaneTorrent:Show(icon)
        end
        
        if A.HolyShock:IsReady(unitID) and not Unit(unitID):IsDead() and A.HolyShock:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= 90 and combatTime == 0 then
            return A.HolyShock:Show(icon)
        end
        
        if A.WordofGlory:IsReady(unitID) and not Unit(unitID):IsDead() and A.WordofGlory:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= 90 and combatTime == 0 then
            return A.WordofGlory:Show(icon)
        end
        
        if A.GlimmerofLight:IsTalentLearned() and GlimmerofLightCount < 8 and ForceGlimmerOnMaxUnits and HealingEngine.GetBelowHealthPercentUnits(95, 40) < 1 then
            if (IsInGroup() or A.IsInPvP or IsInRaid()) then
                for i = 1, #getmembersAll do 
                    if Unit(getmembersAll[i].Unit):IsPlayer() and not IsUnitEnemy(getmembersAll[i].Unit) and A.HolyShock:IsReadyByPassCastGCD(getmembersAll[i].Unit) and Unit(getmembersAll[i].Unit):GetRange() <= 40 and Unit(getmembersAll[i].Unit):HasBuffs(A.GlimmerofLightBuff.ID, true) == 0 then 
                        if UnitGUID(getmembersAll[i].Unit) ~= currGUID then
                            HealingEngine.SetTarget(getmembersAll[i].Unit, 0.3)      
                            return A.HolyShock:Show(icon)
                        end    
                    end                
                end    
            end
        end 
        
        --Rule of Law
        if A.RuleofLaw:IsReady(player) and not Unit(unitID):IsDead() and IsUnitFriendly(unitID) and combatTime > 0 and A.RuleofLaw:IsTalentLearned() and Unit(player):HasBuffs(A.RuleofLaw.ID, true) == 0 and inCombat and 
        ((Unit(unitID):CanInterract(40) and (A.RuleofLaw:GetSpellChargesFrac() >= 2 and Unit(unitID):Health() <= Unit(unitID):HealthMax()*0.6) or (Unit(unitID):TimeToDie() <= 6 or Unit(unitID):Health() <= Unit(unitID):HealthMax()*0.35) or (not Unit(unitID):CanInterract(40)))) then
            return A.RuleofLaw:Show(icon)
        end
        
        --Bestow Faith
        if A.BestowFaith:IsReady(unitID) and not Unit(unitID):IsDead() and A.BestowFaith:PredictHeal(unitID) and Unit(unitID):HealthDeficit() >= (BestowFaithHP * StatMultiplier * AvengingWrathMultiplier) then
            return A.BestowFaith:Show(icon)
        end    
        
        if A.DivineFavor:IsTalentLearned() and Unit(unitID):GetRange() <= 40 and Unit(unitID):HealthDeficit() >= ((WordofGloryHP/1.211) * AvengingWrathMultiplier * StatMultiplier * 2) and A.DivineFavor:IsReady(player) then
            return A.DivineFavor:Show(icon)
        end
        
        if A.Zone == "pvp" or A.Zone ~= "pvp" and inCombat then
            
            if ((A.HammerofWrath:GetCooldown() == 0 and (Unit(targettarget):HealthPercent() <= 20 or Unit(player):HasBuffs(A.AvengingWrath.ID, true) > 0) and Unit(targettarget):GetRange() <= 10 and IsUnitEnemy(targettarget) and Unit(targettarget):HasDeBuffs(A.Cyclone.ID, true) == 0)
                or (not IsUnitEnemy(targettarget) and A.HammerofWrath:GetCooldown() == 0 and (Unit(focustarget):HealthPercent() <= 20 or Unit(player):HasBuffs(A.AvengingWrath.ID, true) > 0) and Unit(focustarget):GetRange() <= 10 and IsUnitEnemy(focustarget) and Unit(focustarget):HasDeBuffs(A.Cyclone.ID, true) == 0))
            and not Unit(target):IsDead() and IsUnitFriendly(target) then
                return A.HammerofWrath:Show(icon)
            end
            
            if ((A.CrusaderStrike:IsReady(targettarget) and A.CrusaderStrike:IsInRange(targettarget) and IsUnitEnemy(targettarget) and Unit(targettarget):HasDeBuffs(A.Cyclone.ID, true) == 0) 
                or (not IsUnitEnemy(targettarget) and A.CrusaderStrike:IsReady(focustarget) and A.CrusaderStrike:IsInRange(focustarget) and IsUnitEnemy(focustarget) and Unit(focustarget):HasDeBuffs(A.Cyclone.ID, true) == 0)) 
            and not Unit(target):IsDead() and IsUnitFriendly(target) and ((A.CrusadersMight:IsTalentLearned() and (A.HolyShock:GetCooldown() >= 1.5 or (A.HolyShock:GetCooldown() == 0 and A.CrusaderStrike:GetSpellChargesFrac() >= 1.7 and Player:HolyPower() < 5))) or not A.CrusadersMight:IsTalentLearned() and Player:HolyPower() < 5) then
                return A.CrusaderStrike:Show(icon)        
            end
            
            local useCC = Action.InterruptIsValid(targettarget)
            if useCC and A.HammerofJustice:IsReady(targettarget) and Unit(targettarget):GetRange() <= 10 and A.HammerofJustice:AbsentImun(targettarget, Temp.TotalAndPhysAndCC) and not Unit(targettarget):IsBoss() and IsUnitEnemy(targettarget) and IsUnitFriendly(target) and not Unit(target):IsDead() and Unit(targettarget):CanInterrupt(true, nil, 20, 85)
            then 
                return A.HammerofJustice:Show(icon)       
            end       
            
            if useCC and A.BlindingLight:IsReady(targettarget) and Unit(targettarget):GetRange() <= 10 and A.BlindingLight:AbsentImun(targettarget, Temp.TotalAndPhysAndCC) and not Unit(targettarget):IsBoss() and IsUnitEnemy(targettarget) and IsUnitFriendly(target) and not Unit(target):IsDead() and Unit(targettarget):CanInterrupt(true, nil, 20, 85)
            then 
                return A.BlindingLight:Show(icon)       
            end            
            
            if ((A.Judgment:IsReady(targettarget) and Unit(targettarget):GetRange() <= 10 and IsUnitEnemy(targettarget) and Unit(targettarget):HasDeBuffs(A.Cyclone.ID, true) == 0 and Unit(targettarget):HasDeBuffs(196941, true) == 0) 
                or (A.Judgment:IsReady(focustarget) and Unit(focustarget):GetRange() <= 10 and IsUnitEnemy(focustarget) and Unit(focustarget):HasDeBuffs(A.Cyclone.ID, true) == 0 and Unit(focustarget):HasDeBuffs(196941, true) == 0)) 
            and A.JudgmentofLight:IsTalentLearned() and not Unit(target):IsDead() and IsUnitFriendly(target) then
                return A.Judgment:Show(icon)
            end
            
            -- Consecration
            if A.Consecration:IsReady(player) and not Unit(target):IsDead() and IsUnitEnemy(targettarget) and IsUnitFriendly(target) and A.CrusaderStrike:IsInRange(targettarget) then
                return A.Consecration:Show(icon)
            end        
            
        end
        
        --Light's Hammer
        if A.LightsHammer:IsReady(unitID) and HealingEngine.GetBelowHealthPercentUnits(85, 15) >= 3 then
            return A.LightsHammer:Show(icon)
        end    
        
        --Night Fae covenant
        if A.BlessingofSummer:IsReady(unitID) and not Unit(unitID):IsDead() and UseCovenant then
            return A.BlessingofSummer:Show(icon)
        end
        
        if A.BlessingofSpring:IsReady(unitID) and not Unit(unitID):IsDead() and UseCovenant then
            return A.BlessingofSpring:Show(icon)
        end        
        
        if A.BlessingofAutumn:IsReady(unitID) and not Unit(unitID):IsDead() and UseCovenant then
            return A.BlessingofAutumn:Show(icon)
        end        
        
        if A.BlessingofWinter:IsReady(unitID) and not Unit(unitID):IsDead() and UseCovenant then
            return A.BlessingofWinter:Show(icon)
        end        
        
        -- Light of the Martyr
        if A.LightofMartyr:IsReady(unitID) and not Unit(unitID):IsDead() and A.LightofMartyr:PredictHeal(unitID) and (Unit(player):HealthPercent() >= 40 or Unit(player):HasBuffs(A.DivineShield.ID) > 0) and Unit(unitID):HealthPercent() <= LightofMartyrHP and Unit(player):GetCurrentSpeed() ~= 0 and not UnitIsUnit(unitID, player) then
            return A.LightofMartyr:Show(icon)
        end    

		if Unit(player):HasDeBuffs(A.Quake.ID, true) == 0 then
        
			--Flash of Light Infusion proc
			if A.FlashofLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) == 0 and not Unit(unitID):IsDead() and Unit(player):HasBuffs(A.InfusionofLightBuff.ID, true) > 1.4 + A.GetCurrentGCD() and A.FlashofLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= FlashofLightHP and Unit(player):GetCurrentSpeed() == 0 then
				return A.FlashofLight:Show(icon)
			end
			
			--Holy Light Infusion proc
			if A.HolyLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) == 0 and not Unit(unitID):IsDead() and Unit(player):HasBuffs(A.InfusionofLightBuff.ID, true) > 2.3 + GetCurrentGCD() and A.HolyLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= HolyLightHP and Unit(player):GetCurrentSpeed() == 0 then
				return A.HolyLight:Show(icon)
			end    
			
			--Flash of Light no infusion
			if A.FlashofLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) == 0 and not Unit(unitID):IsDead() and A.FlashofLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= FlashofLightHP and Unit(player):GetCurrentSpeed() == 0 then
				return A.FlashofLight:Show(icon)
			end
			
			--Holy Light no infusion
			if A.HolyLight:IsReady(unitID) and Unit(player):HasBuffs(A.DivineFavor.ID, true) == 0 and not Unit(unitID):IsDead() and A.HolyLight:PredictHeal(unitID) and Unit(unitID):HealthPercent() <= HolyLightHP and Unit(player):GetCurrentSpeed() == 0 then
				return A.HolyLight:Show(icon)
			end    

        end
        
        if A.Zone == "pvp" or A.Zone ~= "pvp" and inCombat then
            
            if ((A.ShieldoftheRighteous:IsReady(player) and Unit(targettarget):GetRange() <= 5 and IsUnitEnemy(targettarget) and Unit(targettarget):HasDeBuffs(A.Cyclone.ID, true) == 0) or (not IsUnitEnemy(targettarget) and A.ShieldoftheRighteous:IsReady(player) and Unit(focustarget):GetRange() <= 5 and IsUnitEnemy(focustarget) and Unit(focustarget):HasDeBuffs(A.Cyclone.ID, true) == 0)) and IsUnitFriendly(target) and (HealingEngine.GetBelowHealthPercentUnits(90, 40) < 1 or (HealingEngine.GetBelowHealthPercentUnits(50, 40) < 1 and TeamCache.Friendly.Size <= 2)) then
                return A.ShieldoftheRighteous:Show(icon)
            end
            
            if HealingEngine.GetBelowHealthPercentUnits(90, 40) < 1 then
                
                if A.VanquishersHammer:IsReady(targettarget) and UseCovenant then
                    return A.VanquishersHammer:Show(icon)
                end    
                
                if A.Judgment:IsReady(targettarget) and IsUnitFriendly(target) and Unit(targettarget):GetRange() <= 10 and IsUnitEnemy(targettarget) and Unit(targettarget):HasDeBuffs(A.Cyclone.ID, true) == 0 then
                    return A.Judgment:Show(icon)
                end
                
            end
            
        end
        
    end    
    HealingRotation = Action.MakeFunctionCachedDynamic(HealingRotation)
    
    -- Defensive
    local SelfDefensive = SelfDefensives()
    if SelfDefensive then 
        return SelfDefensive:Show(icon)
    end 
    
    -- Heal Target 
    if IsUnitFriendly(target) then 
        unitID = target 
        
        if HealingRotation(unitID) then 
            return true 
        end 
    end  
    
    -- Cleanse Mouseover 
    if A.Cleanse:IsReady(mouseover) then 
        unitID = mouseover 
        
        if HealingRotation(unitID) then 
            return true 
        end 
    end  
    
    -- DPS TargetTarget 
    if IsUnitEnemy(targettarget) then 
        unitID = targettarget    
        
        if HealingRotation(unitID) then 
            return true 
        end 
    end     
    
    -- DPS Target     
    if IsUnitEnemy(target) then 
        unitID = target
        
        if DamageRotation(unitID) then 
            return true 
        end 
    end         
end 

A[4] = nil
A[5] = nil 
A[6] = function(icon)    
    
    if IsUnitEnemy("mouseover") and Unit("mouseover"):IsExplosives() or IsUnitEnemy("mouseover") and Unit("mouseover"):IsTotem() then 
        return A:Show(icon, ACTION_CONST_LEFT)
    end
end 
A[7] = nil 
A[8] = nil 

