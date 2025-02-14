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

	render.SetColorMaterial()

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