
AddCSLuaFile()

SWEP.PrintName = "Thermal Mine"
SWEP.Author = "Jumpz"
SWEP.Purpose = "Set Up Mines."

SWEP.Slot = 5
SWEP.SlotPos = 3

SWEP.Spawnable = true
SWEP.Category = "Thermal Grenades"

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
SWEP.MaxRange = 250

function SWEP:Initialize()

	self:SetHoldType( self.HoldType )

end

function SWEP:Equip()
	self.Owner.Bombs = {}
end

function SWEP:Deploy()

    
	return true

end


function SWEP:PrimaryAttack()

	local pos = self:GetOwner():GetEyeTrace().HitPos

	if self:GetOwner():GetPos():Distance(pos) > self.PlaceRange then
		print("NOT ALLOWED")
	else
		if #self.Owner.Bombs ~= 2 then
			local ent = ents.Create("jz_mine_placed")
			
			ent:SetPos(pos) 
			ent:SetAngles(self:GetOwner():LocalEyeAngles()) 
			ent.Owner = self:GetOwner()
			table.insert(self.Owner.Bombs, ent)
			ent:Spawn()
		else
			print("TOO MANY")
		end

	end



end

function SWEP:SecondaryAttack()

	if #self.Owner.Bombs > 0 then
		for k, v in pairs(self.Owner.Bombs) do
			timer.Simple(0.5, function()
				if IsValid(v) then
					v:Remove()
					table.remove(self.Owner.Bombs, k)
				end
				
			end)
			
		end
	self.Owner.Bombs = {}
	end
end

function SWEP:Reload()
end


function SWEP:Think()

end

if ( SERVER ) then return end 

