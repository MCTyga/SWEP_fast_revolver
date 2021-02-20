AddCSLuaFile()

SWEP.Author                     =   "Grüner Mexikaner"
SWEP.Base                       =   "weapon_base"
SWEP.PrintName                  =   "Mexikanerwaffe"
SWEP.Instructions               =   "Einfach schießen"


SWEP.ViewModel                  =   "models/weapons/c_357.mdl"
SWEP.ViewModelFlip              =   false
SWEP.UseHands                   =   true
SWEP.WorldModel                 =   "models/weapons/w_357.mdl"
SWEP.SetHoldType                =   "pistol"

SWEP.Weight                     =   5
SWEP.AutoSwitchTo               =   true
SWEP.AutoSwitchFrom             =   false

SWEP.Slot                       =   1
SWEP.SlotPos                    =   0

SWEP.DrawAmmo                   =   false
SWEP.DrawCrosshair              =   true

SWEP.Spawnable                  =   true 
SWEP.AdminSpawnable             =   true 

SWEP.Primary.ClipSize           =   10000
SWEP.Primary.DefaultClip        =   200
SWEP.Primary.Ammo               =   "357"
SWEP.Primary.Automatic          =   true 
SWEP.Primary.Recoil             =   0
SWEP.Primary.Damage             =   20
SWEP.Primary.NumShots           =   1
SWEP.Primary.Spread             =   0
SWEP.Primary.Cone               =   0
SWEP.Primary.Delay              =   0.2

SWEP.Secondary.ClipSize         =   100
SWEP.Secondary.DefaultClip      =   6
SWEP.Secondary.Ammo             =   "357"
SWEP.Secondary.Automatic        =   true 

SWEP.ShouldDropOnDie            =   false





local ShootSound = Sound("Weapon_357.Single")

function SWEP:Initialize()

    self:SetHoldType("pistol")

end

function SWEP:PrimaryAttack()

    if( not self:CanPrimaryAttack() ) then
    return 
    end
    

    local ply = self:GetOwner()

    ply:LagCompensation( true )
    local Bullet = {}
    Bullet.Num            =       self.Primary.NumShots
    Bullet.Src            =       ply:GetShootPos()
    Bullet.Dir            =       ply:GetAimVector()
    Bullet.Spread         =       Vector( self.Primary.Spread, self.Primary.Spreaad, 0 )
    Bullet.Tracer         =       0
    Bullet.Damage         =       self.Primary.Damage
    Bullet.AmmoType       =       self.Primary.Ammo

    self:FireBullets( Bullet )
    self:ShootEffects()
    
    self:EmitSound( ShootSound )
    self.BaseClass.ShootEffects( self )
    self:TakePrimaryAmmo( 1 )
    --self:SetNextPrimaryFire( CurTime() + self.Primary.Delay)              remove this message and the "--" infront of the "self:SetNextPrimaryFire(...)" so it not that fast (still fast)

    


    ply:LagCompensation( false )
end

function SWEP:SecondaryAttack()
    return false
end