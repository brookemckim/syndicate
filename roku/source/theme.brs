'*************************************************************
'** Set the configurable theme attributes for the application
'** 
'** Configure the custom overhang and Logo attributes
'** Theme attributes affect the branding of the application
'** and are artwork, colors and offsets specific to the app
'*************************************************************

Sub initTheme()

    app = CreateObject("roAppManager")
    theme = CreateObject("roAssociativeArray")

    theme.OverhangOffsetSD_X = "45"
    theme.OverhangOffsetSD_Y = "30"
    theme.OverhangSliceSD = "pkg:/images/banner-sd.png"
    theme.OverhangLogoSD  = "pkg:/images/banner-logo-sd.png"

    theme.OverhangOffsetHD_X = "75"
    theme.OverhangOffsetHD_Y = "40"
    theme.OverhangSliceHD = "pkg:/images/banner-hd.png"
    theme.OverhangLogoHD  = "pkg:/images/banner-logo-hd.png"
    
    theme.FilterBannerActiveColor   = "#FFFFFF"
    theme.FilterBannerInactiveColor = "#0055a0"
    theme.FilterBannerSideColor     = "#0055a0"

    app.SetTheme(theme)

End Sub