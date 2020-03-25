@echo off
:checkreg
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto hadreg||goto hadentreg
:hadentreg
cls
color CF
echo 你还没有注册！请打开ZFplayer Register.exe并输入序列号完成注册，注册完成后再次打开本软件！
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
title 自动更新
echo 清理临时文件...
del getver.vbs >nul 2 >nul
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
cls
echo 正在检查更新...
echo 获取当前版本号...
set now_ver=30
set /a nowver_p=%now_ver%
echo 完成，当前版本号：%nowver_p%
echo 获取最新版本号...
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
echo 版本更新检查失败！请手动重新打开网页检查最新版本。
pause
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
del getver.vbs >nul 2 >nul
echo 临时文件已清理，按1继续运行主程序，按2退出程序...
choice /c 12
if errorlevel 2 exit
if errorlevel 1 goto cont
pause
exit
:inform
del "%cd%\ZFplayer_last_ver.txt" >nul 2 >nul
cls
echo 已检查到新版本！最新版本%version%
echo 按任意键开始自动更新...
pause >nul
cls
title 正在准备更新...
echo 清理临时文件...
del getver.vbs /q
echo 获取更新日志...
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
title 执行更新程序...
start update.cmd
exit
:cont
color 0F
cls
title ZFplayer - 当前版本：%nowver_p%
echo 最新版本%version%
echo ===========================开发者：zjx-diu==================================
echo                     欢迎使用ZFplayer（基于FFplay的播放器）
echo                      本程序可以以纯净的模式播放音频或视频
echo ============================================================================
echo 现在，请直接将要播放的视频拖入窗口或输入要播放的音视频的完整路径：
set /p pathin=
cls
echo 请输入窗口大小（横向）：（直接回车则默认）
set /p sizeX=
if "%sizeX%"=="" goto nX
goto hasX
:nX
set sizeX=%ScreenWidth%
goto hasX
:hasX
cls
echo 请输入窗口大小（纵向）：（直接回车则默认）
set /p sizeY=
if "%sizeY%"=="" goto nY
goto comdset
:nY
set sizeY=%ScreenHeight%
goto comdset
:notitle
set changetitle=默认标题
goto prestart
:comdset
cls
echo 窗口大小："%sizeX%"*"%sizeY%"
echo 请输入窗口标题：（不输入则以视频名称作为标题）
set /p changetitle=
if "%changetitle%"=="" goto notitle
goto prestart
:resetall
set novideosignal=否
set noaudiosignal=否
set skipsecsignal=0
set loopen=1
set sepadsignal=否
set acpadsignal=否
set threadnumber=1
set autoexit=否
goto menu
:prestart
cls
echo 窗口大小："%sizeX%"*"%sizeY%"
echo 标题：%changetitle%
echo 请注意，更改窗口大小不会拉伸视频，多余的部分将显示为黑色！
echo 如果确定这些参数设置正确，请按任意键继续...
pause >nul
goto resetall
:menu
cls
echo 高级功能没有开发完成，除3/4/7外无法实现对应功能！请直接输入play进行播放
echo 注意：高级菜单内容仅本次生效，请逐个单独设置！
echo --------------------高级功能菜单：-----------------------------
echo 1.只输出音频（禁止视频）		当前设置状态：%novideosignal%
echo 2.只输出视频（禁止音频）		当前设置状态：%noaudiosignal%
echo 3.跳转到指定的秒数开始播放		当前设置状态：跳转%skipsecsignal%秒
echo 4.循环播放n次 					当前设置状态：%loopen%次
echo 5.（开发中...）显示音频频谱（仅在禁止视频时可用）当前设置状态：%sepadsignal%
echo 6.（开发中...）显示音频波形（仅在禁止视频时可用）当前设置状态：%acpadsignal%
echo 7.设置线程个数					当前设置状态：%threadnumber%线程
echo 8.播放结束自动退出				当前设置状态：%autoexit%
echo 9.显示帮助
echo ---------------------------------------------------------------
echo 如果您不确定应该如何选择，请输入play开始播放！
echo 任何时候输入back重置所有高级参数！
set /p menucho=请输入对应指令：
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
echo 指令号码不存在！请直接输入数字...
pause
goto menu
:novideo
set novideosignal=是
goto menu
:noaudio
set noaudiosignal=是
goto menu
:skips
cls
set /p skipsecsignal=输入要跳转的秒数：
goto menu
:loopnum
set /p loopen=输入循环次数（仅限正整数）：
goto menu
:sepadset
cls
echo 此功能开发中...
pause
goto menu
:acpadset
cls
echo 此功能开发中...
pause
goto menu
:thread
cls
set /p threadnumber=输入线程数（仅限正整数，最大16）：
if %threadnumber% LEQ 16 goto menu
goto over
:over
echo 线程个数超出16个或为无效数字！
set threadnumber=1
pause
goto menu
:autoex
set autoexit=是
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
if "%novideosignal%"=="是" goto vnon
if "%noaudiosignal%"=="是" goto anon
if "%autoexit%"=="是" goto atex
echo 按任意键开始播放，播放结束后请手动退出播放参数显示窗口...
pause >nul
goto play
:vnon
echo -vn>>ZFplay.bat
set novideosignal=否
goto preplay
:anon
echo -nodisp>>ZFplay.bat
set noaudiosignal=否
goto preplay
:atex
echo -autoexit>>ZFplay.bat
set autoexit=否
goto preplay
:play
cls
start "" "ZFplay.bat"
echo 按任意键返回...
pause >nul
goto cont
:help
'q, ESC'            退出
'f'                 全屏
'p, SPC'            暂停
'w'                 切换显示模式(视频/音频波形/音频频带)
's'                 步进到下一帧
'left/right'        快退/快进 10 秒
'down/up'           快退/快进 1 分钟
'page down/page up' 跳转到前一章/下一章(如果没有章节，快退/快进 10 分钟)
'mouse click'       跳转到鼠标点击的位置(根据鼠标在显示窗口点击的位置计算百分比)
