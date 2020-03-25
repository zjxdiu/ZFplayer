@echo off
echo 删除临时文件...
ping 127.0.0.1 -n 2 >nul
del getver.vbs >nul 2 >nul
del getupdatelog.vbs >nul 2 >nul
del download.vbs >nul 2 >nul
del ZFplayer_last_ver.txt
echo 结束进程...
taskkill /im ZFplayer.exe >nul
ping 127.0.0.1 -n 2 >nul
echo 删除旧版程序...
del ZFplayer.exe
echo 下载最新版...
ping 127.0.0.1 -n 5 >nul
echo Set Post = CreateObject("Msxml2.XMLHTTP") >download.vbs
echo Set Shell = CreateObject("Wscript.Shell") >>download.vbs
echo Post.Open "GET","http://zjxdiu.in.3322.org:37751/storage/File/dev/ZFplayer.txt",0 >>download.vbs
echo Post.Send() >>download.vbs
echo Set aGet = CreateObject("ADODB.Stream") >>download.vbs
echo aGet.Mode = 3 >>download.vbs
echo aGet.Type = 1 >>download.vbs
echo aGet.Open() >>download.vbs
echo aGet.Write(Post.responseBody) >>download.vbs
echo aGet.SaveToFile "%cd%\ZFplayer.exe",2 >>download.vbs
echo wscript.sleep 1000 >>download.vbs
ping 127.0.0.1 -n 1 >nul
start download.vbs >nul
ping 127.0.0.1 -n 3 >nul
if exist "%cd%\ZFplayer.exe" goto OK
goto notok
:OK
cls
echo 下载已完成！
echo 更新完成！将在5秒后自动启动...
echo 正在清理临时文件...
ping 127.0.0.1 -n 4 >nul
del download.vbs
del ZFplayer_update.txt
del getver.vbs
del getupdatelog.vbs
del download.vbs
del ZFplayer_last_ver.txt
cls
echo 临时文件已清理！即将启动...
ping 127.0.0.1 -n 3 >nul
start ZFplayer.exe
exit
:notok
echo 下载出错，请手动前往网站下载并替换文件...
pause
exit