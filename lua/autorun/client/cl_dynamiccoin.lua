/*
    Dynamic Bitcoins is really cool you should use it forever
    just saying, it really is

    I might make a full bitminer addon later, but idk lmao
*/

net.Receive("DynamicBitcoin:UpdatePrice", function()
    local pr = net.ReadInt(32)
    if (!pr) then
        MsgC(dynamicbitcoin.theme["chat_prefix"], "[Dynamic Bitcoin] ", dynamicbitcoin.theme["chat_msg"], "Failed to get networked bitcoin price: ", dynamicbitcoin.theme["chat_error"], "Price not networked!" .. "\n")
        return
    end

    dynamicbitcoin.currentPrice = pr

    MsgC(dynamicbitcoin.theme["chat_prefix"], "[Dynamic Bitcoin] ", dynamicbitcoin.theme["chat_msg"], "New bitcoin price has been networked: ", dynamicbitcoin.theme["chat_error"], dynamicbitcoin.currentPrice .. "\n")
end)

hook.Add("OnPlayerChat", "DynamicBitcoin:ChatCMD", function(ply, text)
    if (ply != LocalPlayer()) then return end

    text = string.lower(text)

    if (text == dynamicbitcoin.cmd) then
        chat.AddText(dynamicbitcoin.theme["chat_msg"], "Current Bitcoin Price: ", dynamicbitcoin.theme["chat_error"], tostring(DarkRP.formatMoney(dynamicbitcoin.currentPrice)))

        return true // Fuck the message
    end
end)