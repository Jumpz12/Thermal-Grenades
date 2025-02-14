
AddCSLuaFile()

SWEP.PrintName = "Thermal Mine"
SWEP.Author = "Jumpz"
SWEP.Purpose = "Set Up Mines."

SWEP.Slot = 5
SWEP.SlotPos = 3

SWEP.Spawnable = true

SWEP.ViewModel = Model( "models/weapons/c_medkit.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_grenade.mdl" )
SWEP.ViewModelFOV = 54
SWEP.UseHands = true

SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.HoldType = "slam"
SWEP.PlaceRange = 80

function SWEP:Initialize()

	self:SetHoldType( self.HoldType )

end

function SWEP:Deploy()

    
	return true

end


function SWEP:PrimaryAttack()

    
	

end

function SWEP:SecondaryAttack()


end

function SWEP:Reload()
end


function SWEP:Think()

end

if ( SERVER ) then return end 

