Citizen.CreateThread(function()
    while true do
        Wait(0)
        local blip = GetFirstBlipInfoId(8)
        while DoesBlipExist(blip) do
            Wait(0)
            local blipCoords = GetBlipInfoIdCoord(blip)
            local pedCoords = GetEntityCoords(GetPlayerPed(-1))
            local zScale = #(blipCoords - pedCoords) - height
            DrawMarker(marker.id, blipCoords.x, blipCoords.y, blipCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.scale, marker.scale, zScale, marker.rgb.r, marker.rgb.g, marker.rgb.b, marker.rgb.a, false, false, 2, nil, nil, false)
            if textureDict ~= nil and textureName ~= nil then
                if not HasStreamedTextureDictLoaded(textureDict) then
                    RequestStreamedTextureDict(textureDict, true)
                    while not HasStreamedTextureDictLoaded(textureDict) do
                        Wait(1)
                    end
                else
                    DrawMarker(8, blipCoords.x, blipCoords.y, zScale + textureHeight, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, textureMarkerScale, textureMarkerScale, textureMarkerScale, 255, 255, 255, 255, false, false, 2, true, 'marker', 'marker', false)
                end
            end
        end
    end
end)