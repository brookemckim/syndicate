'Library of Shared Functions

'Creates connection and retrieve url over http
Function initConnection(url As String) As String
  
  conn = CreateObject("roAssociativeArray")

  conn.Url   = url
  print "Initializing connection to" + conn.Url
  conn.Timer = CreateObject("roTimespan")
  
  'print "created feed connection for " + conn.Url
  http = NewHttp(conn.Url)
  
  'print "Getting http response"
  rsp = http.GetToStringWithRetry()
  'print rsp
  
  return rsp
End Function

'Creates XML object out of string
Function to_xml(rsp As String) As Object
  xml = CreateObject("roXMLElement")
  if not xml.Parse(rsp) then
      'print "Invalid XML"
      return invalid
  endif
  
  return xml
End Function

Function comma_seperate(string1 As String, string2 As String) As String
  str = CreateObject("roString")

  if (string1.Len() > 0 AND string2.Len() > 0) then
    str =  string1 + ", " + string2
  else if (string1.Len() <= 0 AND string2.Len() > 0) then
    str = string2    
  else if (string1.Len() > 0 AND string2.Len() <= 0) then
    str = string1
  end if
  
  return str
End Function