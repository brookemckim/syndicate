Function initVideoItem() As Object
    o = CreateObject("roAssociativeArray")
    
    o.ContentId        = ""
    o.Title            = ""
    o.Description      = ""
    o.StreamFormat     = ""
    o.Live             = false
    o.Length           = ""
    o.SDImageUrl       = ""
    o.HDImageUrl       = ""
    o.StreamQualities  = CreateObject("roArray", 5, true) 
    o.StreamBitrates   = CreateObject("roArray", 5, true)
    o.StreamUrls       = CreateObject("roArray", 5, true)
    o.StreamContentIDs = CreateObject("roArray", 5, true)
    return o
End Function