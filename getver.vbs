Set Post = CreateObject("Msxml2.XMLHTTP") 
Set Shell = CreateObject("Wscript.Shell") 
Post.Open "GET","http://zjxdiu.in.3322.org:37751/storage/File/dev/ZFplayer_last_ver.txt",0 
Post.Send() 
Set aGet = CreateObject("ADODB.Stream") 
aGet.Mode = 3 
aGet.Type = 1 
aGet.Open() 
aGet.Write(Post.responseBody) 
aGet.SaveToFile "D:\ZFplayer\ZFplayer\ZFplayer_last_ver.txt",2 
wscript.sleep 1000 
