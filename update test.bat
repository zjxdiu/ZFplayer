@echo off
echo 获取最新版本中，请稍候...
(这里放版本号获取方法)
echo 清理临时文件...
del tempup.vbs
echo 删除旧版程序...
del ZFplayer.exe
echo 获取更新信息...
(更新信息获取并显示)
echo Set Post = CreateObject("Msxml2.XMLHTTP") >zl.vbs
echo Set Shell = CreateObject("Wscript.Shell") >>zl.vbs
echo Post.Open "GET","https://dl.hdslb.com/mobile/latest/iBiliPlayer-bili.apk",0 >>zl.vbs
echo Post.Send() >>zl.vbs
echo Set aGet = CreateObject("ADODB.Stream") >>zl.vbs
echo aGet.Mode = 3 >>zl.vbs
echo aGet.Type = 1 >>zl.vbs
echo aGet.Open() >>zl.vbs
echo aGet.Write(Post.responseBody) >>zl.vbs
echo aGet.SaveToFile "C:\UPDATE.exe",2 >>zl.vbs
echo wscript.sleep 1000 >>zl.vbs
