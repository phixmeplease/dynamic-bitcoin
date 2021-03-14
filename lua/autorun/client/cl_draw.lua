/*
    ShiftCore
    By LionDaDev / Lyth1um_

    Do not redistribute this file / files
    (c) 2021 ShiftRP
*/

local errormat = Material("error")
local save_dir = "dynamicbitcoin_savedmats/"
local mats = {}

file.CreateDir(save_dir)

dynamicbitcoin.fetchImage = function(url)
	if (!url) then return errormat end
	if mats[url] then return mats[url] end
	local c = util.CRC(url)
	if file.Exists(save_dir .. c .. ".png", "DATA") then
		mats[url] = Material("data/" .. save_dir .. c .. ".png")
		return mats[url]
	end
	http.Fetch(url, function(data)
		file.Write(save_dir .. c .. ".png", data)
		mats[url] = Material("data/" .. save_dir .. c .. ".png")
	end)
    if (!mats[url]) then
        return errormat
    end
	return mats[url]
end

dynamicbitcoin.drawWebImage = function(url, x, y, w, h, clr)
    surface.SetDrawColor(clr.r, clr.g, clr.b, clr.a)
    surface.SetMaterial(dynamicbitcoin.fetchImage(url))
    surface.DrawTexturedRect(x, y, w, h)
end