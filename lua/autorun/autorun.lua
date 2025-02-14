if ( SERVER ) then 
    util.AddNetworkString( "JZMineDraw" )
else


net.Receive("JZMineDraw", function(len, ply)
    hit = net.ReadVector()
    print(hit.x, hit.y, hit.z)
    cam.Start3D()
    render.SetColorMaterial()
    local pos = LocalPlayer():GetEyeTrace().HitPos

    render.DrawSphere(pos, 50, 30, 30, Color( 0, 175, 175, 100 ) )
    cam.End3D()
end)


hook.Add( "PostDrawTranslucentRenderables", "test", function()

	--[[
		when you draw a sphere, you have to specify what material the sphere is
		going to have before rendering it, render.SetColorMaterial()
		just sets it to a white material so we can recolor it easily.
	--]]
	render.SetColorMaterial()

	-- The position to render the sphere at, in this case, the looking position of the local player
	local pos = LocalPlayer():GetEyeTrace().HitPos

	-- Draw the sphere!
    if LocalPlayer():GetActiveWeapon():GetClass() == "jz_mine" then
        if LocalPlayer():GetPos():Distance(pos) > LocalPlayer():GetActiveWeapon().PlaceRange then
            render.DrawSphere( pos, 25, 30, 30, Color( 255, 0, 0, 100 ) )
        else
            render.DrawSphere( pos, 25, 30, 30, Color( 0, 255, 0, 100 ) )
        end

    end
	

end )

end 