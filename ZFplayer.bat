@echo off
:checkreg
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto hadreg||goto hadentreg
:hadentreg
cls
color CF
echo �㻹û��ע�ᣡ���ZFplayer Register.exe���������к����ע�ᣬע����ɺ��ٴδ򿪱������
pause
exit
:hadreg
del ZFplay.bat >nul 2 >nul
echo. >config.ini
for /f "delims=" %%i in ('Wmic DesktopMonitor Get ScreenHeight^,ScreenWidth /Value') do set "%%i">nul 2 >nul
for /f "delims=" %%i in ('findstr /i "Heigh= Width=" config.ini') do set "%%i">nul 2 >nul
cls
goto autoupdate
:autoupdate
title �Զ�����
echo ������ʱ�ļ�...
del getver.vbs >nul 2 >nul
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
cls
echo ���ڼ�����...
echo ��ȡ��ǰ�汾��...
set now_ver=30
set /a nowver_p=%now_ver%
echo ��ɣ���ǰ�汾�ţ�%nowver_p%
echo ��ȡ���°汾��...
echo Set Post = CreateObject("Msxml2.XMLHTTP") >getver.vbs
echo Set Shell = CreateObject("Wscript.Shell") >>getver.vbs
echo Post.Open "GET","http://zjxdiu.in.3322.org:37751/storage/File/dev/ZFplayer_last_ver.txt",0 >>getver.vbs
echo Post.Send() >>getver.vbs
echo Set aGet = CreateObject("ADODB.Stream") >>getver.vbs
echo aGet.Mode = 3 >>getver.vbs
echo aGet.Type = 1 >>getver.vbs
echo aGet.Open() >>getver.vbs
echo aGet.Write(Post.responseBody) >>getver.vbs
echo aGet.SaveToFile "%cd%\ZFplayer_last_ver.txt",2 >>getver.vbs
echo wscript.sleep 1000 >>getver.vbs
start getver.vbs >nul
ping 127.0.0.1 -n 5 >nul
for /f "delims=" %%a in (%cd%\ZFplayer_last_ver.txt) do (
set last_ver=%%a
) 
set /a version=%last_ver%
if %nowver_p% NEQ %version% (goto inform) else (goto cont)
echo �汾���¼��ʧ�ܣ����ֶ����´���ҳ������°汾��
pause
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
del getver.vbs >nul 2 >nul
echo ��ʱ�ļ���������1�������������򣬰�2�˳�����...
choice /c 12
if errorlevel 2 exit
if errorlevel 1 goto cont
pause
exit
:inform
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
cls
echo �Ѽ�鵽�°汾�����°汾%version%
echo ���������ʼ�Զ�����...
pause >nul
cls
title ����׼������...
echo ������ʱ�ļ�...
del getver.vbs /q
echo ��ȡ������־...
echo Set Post = CreateObject("Msxml2.XMLHTTP") >getupdatelog.vbs
echo Set Shell = CreateObject("Wscript.Shell") >>getupdatelog.vbs
echo Post.Open "GET","http://zjxdiu.in.3322.org:37751/storage/File/dev/ZFplayer_update.txt",0 >>getupdatelog.vbs
echo Post.Send() >>getupdatelog.vbs
echo Set aGet = CreateObject("ADODB.Stream") >>getupdatelog.vbs
echo aGet.Mode = 3 >>getupdatelog.vbs
echo aGet.Type = 1 >>getupdatelog.vbs
echo aGet.Open() >>getupdatelog.vbs
echo aGet.Write(Post.responseBody) >>getupdatelog.vbs
echo aGet.SaveToFile "%cd%\ZFplayer_update.txt",2 >>getupdatelog.vbs
echo wscript.sleep 1000 >>getupdatelog.vbs
start getupdatelog.vbs
ping 127.0.0.1 -n 3 >nul
for /f "delims=" %%a in (%cd%\ZFplayer_update.txt) do (
echo %%a
)
ping 127.0.0.1 -n 7 >nul
title ִ�и��³���...
start update.cmd
exit
:cont
color 0F
cls
title ZFplayer - ��ǰ�汾��%nowver_p%
echo ���°汾%version%
echo ===========================�����ߣ�zjx-diu==================================
echo                     ��ӭʹ��ZFplayer������FFplay�Ĳ�������
echo                      ����������Դ�����ģʽ������Ƶ����Ƶ
echo ============================================================================
echo ���ڣ���ֱ�ӽ�Ҫ���ŵ���Ƶ���봰�ڻ�����Ҫ���ŵ�����Ƶ������·����
set /p pathin=
cls
echo �����봰�ڴ�С�����򣩣���ֱ�ӻس���Ĭ�ϣ�
set /p sizeX=
if "%sizeX%"=="" goto nX
goto hasX
:nX
set sizeX=%ScreenWidth%
goto hasX
:hasX
cls
echo �����봰�ڴ�С�����򣩣���ֱ�ӻس���Ĭ�ϣ�
set /p sizeY=
if "%sizeY%"=="" goto nY
goto comdset
:nY
set sizeY=%ScreenHeight%
goto comdset
:notitle
set changetitle=Ĭ�ϱ���
goto prestart
:comdset
cls
echo ���ڴ�С��"%sizeX%"*"%sizeY%"
echo �����봰�ڱ��⣺��������������Ƶ������Ϊ���⣩
set /p changetitle=
if "%changetitle%"=="" goto notitle
goto prestart
:resetall
set novideosignal=��
set noaudiosignal=��
set skipsecsignal=0
set loopen=1
set sepadsignal=��
set acpadsignal=��
set threadnumber=1
set autoexit=��
goto menu
:prestart
cls
echo ���ڴ�С��"%sizeX%"*"%sizeY%"
echo ���⣺%changetitle%
echo ��ע�⣬���Ĵ��ڴ�С����������Ƶ������Ĳ��ֽ���ʾΪ��ɫ��
echo ���ȷ����Щ����������ȷ���밴���������...
pause >nul
goto resetall
:menu
cls
echo �߼�����û�п�����ɣ���3/4/7���޷�ʵ�ֶ�Ӧ���ܣ���ֱ������play���в���
echo ע�⣺�߼��˵����ݽ�������Ч��������������ã�
echo --------------------�߼����ܲ˵���-----------------------------
echo 1.ֻ�����Ƶ����ֹ��Ƶ��		��ǰ����״̬��%novideosignal%
echo 2.ֻ�����Ƶ����ֹ��Ƶ��		��ǰ����״̬��%noaudiosignal%
echo 3.��ת��ָ����������ʼ����		��ǰ����״̬����ת%skipsecsignal%��
echo 4.ѭ������n�� 					��ǰ����״̬��%loopen%��
echo 5.��������...����ʾ��ƵƵ�ף����ڽ�ֹ��Ƶʱ���ã���ǰ����״̬��%sepadsignal%
echo 6.��������...����ʾ��Ƶ���Σ����ڽ�ֹ��Ƶʱ���ã���ǰ����״̬��%acpadsignal%
echo 7.�����̸߳���					��ǰ����״̬��%threadnumber%�߳�
echo 8.���Ž����Զ��˳�				��ǰ����״̬��%autoexit%
echo 9.��ʾ����
echo ---------------------------------------------------------------
echo �������ȷ��Ӧ�����ѡ��������play��ʼ���ţ�
echo �κ�ʱ������back�������и߼�������
set /p menucho=�������Ӧָ�
if "%menucho%"=="" goto play
if "%menucho%"=="back" goto resetall
if "%menucho%"=="1" goto novideo
if "%menucho%"=="2" goto noaudio
if "%menucho%"=="3" goto skips
if "%menucho%"=="4" goto loopnum
if "%menucho%"=="5" goto sepadset
if "%menucho%"=="6" goto acpadset
if "%menucho%"=="7" goto thread
if "%menucho%"=="8" goto autoex
if "%menucho%"=="play" goto write
if "%menucho%"=="9" goto helper
echo ָ����벻���ڣ���ֱ����������...
pause
goto menu
:novideo
set novideosignal=��
goto menu
:noaudio
set noaudiosignal=��
goto menu
:skips
cls
set /p skipsecsignal=����Ҫ��ת��������
goto menu
:loopnum
set /p loopen=����ѭ����������������������
goto menu
:sepadset
cls
echo �˹��ܿ�����...
pause
goto menu
:acpadset
cls
echo �˹��ܿ�����...
pause
goto menu
:thread
cls
set /p threadnumber=�����߳��������������������16����
if %threadnumber% LEQ 16 goto menu
goto over
:over
echo �̸߳�������16����Ϊ��Ч���֣�
set threadnumber=1
pause
goto menu
:autoex
set autoexit=��
goto menu
:helper
cls
echo developing...
pause
goto menu
:write
echo ffplay -i %pathin% -x %sizeX% -y %sizeY% -threads %threadnumber% -loop %loopen% -ss %skipsecsignal% -window_title %changetitle% >ZFplay.bat
goto preplay
:preplay
cls
if "%novideosignal%"=="��" goto vnon
if "%noaudiosignal%"=="��" goto anon
if "%autoexit%"=="��" goto atex
echo ���������ʼ���ţ����Ž��������ֶ��˳����Ų�����ʾ����...
pause >nul
goto play
:vnon
echo -vn>>ZFplay.bat
set novideosignal=��
goto preplay
:anon
echo -nodisp>>ZFplay.bat
set noaudiosignal=��
goto preplay
:atex
echo -autoexit>>ZFplay.bat
set autoexit=��
goto preplay
:play
cls
start "" "ZFplay.bat"
echo �����������...
pause >nul
goto cont
:help
'q, ESC'            �˳�
'f'                 ȫ��
'p, SPC'            ��ͣ
'w'                 �л���ʾģʽ(��Ƶ/��Ƶ����/��ƵƵ��)
's'                 ��������һ֡
'left/right'        ����/��� 10 ��
'down/up'           ����/��� 1 ����
'page down/page up' ��ת��ǰһ��/��һ��(���û���½ڣ�����/��� 10 ����)
'mouse click'       ��ת���������λ��(�����������ʾ���ڵ����λ�ü���ٷֱ�)
