Function getMRSS(url As Object) As Object
  feed   = initConnection(url)
  videos = parseVideos( to_xml(feed) )
  
  return videos
End Function

Function parseVideos(xml as Object) As Object
  videos = CreateObject("roArray", 100, true)
  
  if xml = invalid then
    print "Error Retrieving XML"
    return videos
  endif
  
  if xml.GetName() <> "channel" then
      print "No channel tag found."
      return videos
  endif
  
  'stop

  for each item in xml.GetNamedElements("item")
    'stop
    video = initVideoItem()
    'video.ContentId    = curVideo.id.GetText()
    title = item.GetNamedElements("media:title")
    video.Title        = title.GetText()
    video.Description  = item.description.GetText()
    'video.StreamFormat = curVideo.format.GetText()
    video.StreamFormat = "mp4"
    'video.Length       = curVideo.runtime.GetText() 
    'video.Quality      = curVideo.quality.GetText() 
    'video.SDPosterUrl  = curVideo.sd_image.GetText()
    'video.HDPosterUrl  = curVideo.hd_image.GetText()

    video.StreamUrls[0]      = item.content.GetAttributes().url
    video.streamQualities[0] = "SD"
    video.StreamBitrates     = 0
    'n = 0
    'streams = item.medias.GetChildElements()
    'for each curStream in streams
      'video.StreamQualities[n]  = curStream.quality.GetText()
      'video.StreamBitrates[n]   = curStream.bitrate.GetText()
      'video.StreamUrls[n]       = curStream.url.GetText()
      'video.StreamContentIDs[n] = curStream.id.GetText()
      'n = n + 1
    'next
    
    video.ShortDescriptionLine2 = video.Description
    video.ShortDescriptionLine1 = video.Title

    print video
    
    videos.Push(video)
  next
  
  return videos
End Function
