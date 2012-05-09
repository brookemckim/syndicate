'******************************************************
'**  Video Player Example Application -- Poster Screen
'**  November 2009
'**  Copyright (c) 2009 Roku Inc. All Rights Reserved.
'******************************************************

'******************************************************
'** Perform any startup/initialization stuff prior to 
'** initially showing the screen.  
'******************************************************
Function prePosterScreen(breadA=invalid, breadB=invalid) As Object
    port=CreateObject("roMessagePort")
    screen = CreateObject("roPosterScreen")
    screen.SetMessagePort(port)
    if breadA<>invalid and breadB<>invalid then
        screen.SetBreadcrumbText(breadA, breadB)
    end if

    screen.SetListStyle("flat-category")
    screen.SetListDisplayMode("photo-fit")

    return screen
End Function


'******************************************************
'** Display the home screen and wait for events from 
'** the screen. The screen will show retreiving while
'** we fetch and parse the feeds for the game posters
'******************************************************
Function showPosterScreen(screen As Object, feedURL As String) As Integer
    curVideo  = 0
    
    videos = getMRSS(feedURL)

    if videos.Count() > 0 then
      screen.SetContentList(videos)
    else
      screen.ShowMessage("No videos found for this channel")
    end if
      
    screen.Show()

    while true
      print "POSTER SCREEN!"
  
      msg = wait(0, screen.GetMessagePort())
      if type(msg) = "roPosterScreenEvent" then
        print "showPosterScreen | msg = "; msg.GetMessage() " | index = "; msg.GetIndex()
        print msg.GetMessage()
        print "POSTER SCREEN! MSG"
    
        if msg.isListFocused() then
          curVideo    = 0
          screen.SetFocusedListItem(curVideo)
        else if msg.isListItemSelected() then
          curVideo = msg.GetIndex()    
          showMediaPlayer(videos[curVideo])
        else if msg.isScreenClosed() then
          print "Screen Closed!"
          return -1
        end if
      end If
    end while
End Function
