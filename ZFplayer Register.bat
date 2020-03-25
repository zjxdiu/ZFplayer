@echo off
echo 输入uninst即可解除注册状态，直接回车开始注册...
set /p cho=
if "%cho%"=="uninst" goto unin
goto chek
:chek
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto ok||goto nook
:nook
cls
echo 请输入序列号以完成注册！
set /p regst=
if "%regst%"=="zjxdiu" goto regi
echo 序列号错误！请重新输入...
pause
goto chek
:regi
cls
echo 正在注册...
echo REGEDIT4 >temp.reg
echo [HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist] >>temp.reg
echo "Hadregist"=dword:00000001 >>temp.reg
regedit /s temp.reg
del temp.reg >nul
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto ok||goto nxt
:nxt
cls
echo 注册失败！请检查注册表写入状态...
pause
exit
:ok
echo 已经注册完成！即将退出...
ping 127.0.0.1 -n 11 >nul
exit
:unin
cls
echo 按任意键开始卸载...
pause >nul
echo REGEDIT4 >temp.reg
echo [-HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist\] >>temp.reg
regedit /s temp.reg
del temp.reg >nul
del D:\ffmpeg /s /q
echo 卸载完成！
pause
exit