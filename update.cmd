@echo off
echo ɾ����ʱ�ļ�...
ping 127.0.0.1 -n 2 >nul
del getver.vbs >nul 2 >nul
del getupdatelog.vbs >nul 2 >nul
del download.vbs >nul 2 >nul
del ZFplayer_last_ver.txt
echo ��������...
taskkill /im ZFplayer.exe >nul
ping 127.0.0.1 -n 2 >nul
echo ɾ���ɰ����...
del ZFplayer.exe
echo �������°�...
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
echo ��������ɣ�
echo ������ɣ�����5����Զ�����...
echo ����������ʱ�ļ�...
ping 127.0.0.1 -n 4 >nul
del download.vbs
del ZFplayer_update.txt
del getver.vbs
del getupdatelog.vbs
del download.vbs
del ZFplayer_last_ver.txt
cls
echo ��ʱ�ļ���������������...
ping 127.0.0.1 -n 3 >nul
start ZFplayer.exe
exit
:notok
echo ���س������ֶ�ǰ����վ���ز��滻�ļ�...
pause
exit