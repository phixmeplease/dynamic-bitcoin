AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props/cs_assault/Billboard.mdl")
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
    self:PhysicsInit( SOLID_VPHYSICS )
    local phys = self:GetPhysicsObject()
    if ( IsValid( phys ) ) then phys:Wake() end
    self:SetUseType(SIMPLE_USE)
end