local name, addon = ...

--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\AlfaSlabOne-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\Bangers-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\Bungee-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\LuckiestGuy-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\PassionOne-Black.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\RockSalt-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\RubikMonoOne-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\RussoOne-Regular.ttf"
--local fontName = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\SeymourOne-Regular.ttf"

local combatTextFont = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\RussoOne-Regular.ttf"
local damageTextFont = "Interface\\AddOns\\CombatTextBeautifier\\Fonts\\SeymourOne-Regular.ttf"

CombatTextBeautifier = CreateFrame("Frame", "CombatTextBeautifier");

function CombatTextBeautifier:ApplySystemFonts()
	DAMAGE_TEXT_FONT = damageTextFont;

    --NUM_COMBAT_TEXT_LINES = 20;
    --COMBAT_TEXT_SCROLLSPEED = 1.9;
    --COMBAT_TEXT_FADEOUT_TIME = 1.3;
    --COMBAT_TEXT_HEIGHT = 25;
    COMBAT_TEXT_HEIGHT = 14;
    --COMBAT_TEXT_CRIT_MAXHEIGHT = 60;
    COMBAT_TEXT_CRIT_MAXHEIGHT = 32;
    --COMBAT_TEXT_CRIT_MINHEIGHT = 30;
    COMBAT_TEXT_CRIT_MINHEIGHT = 18;
    --COMBAT_TEXT_CRIT_SCALE_TIME = 0.05;
    --COMBAT_TEXT_CRIT_SHRINKTIME = 0.2;
    --COMBAT_TEXT_TO_ANIMATE = {};
    --COMBAT_TEXT_STAGGER_RANGE = 20;
    --COMBAT_TEXT_SPACING = 10;
    COMBAT_TEXT_SPACING = 4;
    --COMBAT_TEXT_MAX_OFFSET = 130;
    COMBAT_TEXT_MAX_OFFSET = 60;
    --COMBAT_TEXT_LOW_HEALTH_THRESHOLD = 0.2;
    --COMBAT_TEXT_LOW_MANA_THRESHOLD = 0.2;
    --COMBAT_TEXT_LOCATIONS = {};
    --COMBAT_TEXT_X_ADJUSTMENT = 80;
    --COMBAT_TEXT_Y_SCALE = 1;
    --COMBAT_TEXT_X_SCALE = 1;

    local _, fHeight, fFlags = CombatTextFont:GetFont()
    CombatTextFont:SetFont(combatTextFont, fHeight, fFlags)
end

local function onevent(self, event, arg1, ...)
    if (event == "ADDON_LOADED" and name == arg1) then
        print("Combat Text Beautifier is loaded.")
        CombatTextBeautifier:UnregisterEvent("ADDON_LOADED")
        CombatTextBeautifier:ApplySystemFonts()
    end
end
 
CombatTextBeautifier:RegisterEvent("ADDON_LOADED");
CombatTextBeautifier:SetScript("OnEvent", onevent)