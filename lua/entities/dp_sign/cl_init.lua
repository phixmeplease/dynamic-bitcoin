include("shared.lua")

surface.CreateFont("DynamicBitcoin:PriceSub", {
    font = "Montserrat Medium",
    size = 200,
    weight = 500,
})

surface.CreateFont("DynamicBitcoin:Price", {
    font = "Montserrat Medium",
    size = 500,
    weight = 500,
})

local w, h = 2210, 1152
local coinSize = 800
function ENT:DrawTranslucent()
    self:DrawModel()

    cam.Start3D2D(self:LocalToWorld(Vector(1.1, 0, 0)), self:LocalToWorldAngles(Angle(0, 90, 90)), 0.1)
        draw.RoundedBox(0, -w / 2, -h / 2, w, h, dynamicbitcoin.theme["background"])
        dynamicbitcoin.drawWebImage(dynamicbitcoin.icon, -coinSize / 2, -coinSize / 2, coinSize, coinSize, ColorAlpha(color_white, 25))

        draw.SimpleText(dynamicbitcoin.lang["price"], "DynamicBitcoin:PriceSub", 0, 0, dynamicbitcoin.theme["price_sub"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
        draw.SimpleText(DarkRP.formatMoney(dynamicbitcoin.currentPrice), "DynamicBitcoin:Price", 0, 0, dynamicbitcoin.theme["price"], TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
    cam.End3D2D()
end