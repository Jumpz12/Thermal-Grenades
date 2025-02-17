if ( SERVER ) then 
    util.AddNetworkString( "JZMineDraw" )
else

    hook.Add( "PostDrawTranslucentRenderables", "test", function()

        render.SetColorMaterial()

        local pos = LocalPlayer():GetEyeTrace().HitPos

        if LocalPlayer():GetActiveWeapon():GetClass() == "jz_mine" then
            if LocalPlayer():GetPos():Distance(pos) < LocalPlayer():GetActiveWeapon().MaxRange then
                if LocalPlayer():GetPos():Distance(pos) > LocalPlayer():GetActiveWeapon().PlaceRange then
                    render.DrawSphere( pos, 2, 30, 30, Color( 255, 0, 0, 20 ) )
                else
                    render.DrawSphere( pos, 2, 30, 30, Color( 0, 255, 0, 20 ) )
                end

            end
        end
        
    end )

end 