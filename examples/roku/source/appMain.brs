Sub Main()

    'initialize theme attributes like titles, logos and overhang color
    initTheme()
    
    'So the app launches right away instead of waiting to parse xml
    screenFacade = CreateObject("roPosterScreen")
    screenFacade.show()

    'prepare the screen for display and get ready to begin  
    url = "http://10.0.1.5:3000/d/Users/bmckim/Desktop/"
    showPosterScreen(prePosterScreen("", ""), url)
End Sub
