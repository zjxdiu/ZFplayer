@echo off
:checksys
ver | find "4.0." > NUL &&  goto gg
ver | find "4.10." > NUL &&  goto gg
ver | find "4.90." > NUL &&  goto gg
ver | find "3.51." > NUL &&  goto gg
ver | find "5.0." > NUL &&  goto gg
ver | find "5.1." > NUL &&  goto gg
ver | find "5.2." > NUL &&  goto gg
goto inst
:gg
echo 系统版本不符合要求！请安装最低Vista版本...
pause
exit
:inst
cls
title 资源检查...
color F0
echo 正在检查资源...
if exist "%CD%\ffmpeg\bin\ffplay*.exe" goto ok
echo 资源缺失！请重新下载...
pause
exit
:ok
cls
color 0F
title 进行中...
echo 欢迎使用ZFplayer安装器！
echo 本程序可以自动完成所有准备工作。
echo 如要退出，请直接关闭程序...
pause
cls
color 0F
title 进行中...
echo 开始进行准备工作...
echo 复制文件...
md D:\ffmpeg
xcopy "%cd%\ffmpeg" D:\ffmpeg /s
echo 设置环境变量...
setx path "D:\ffmpeg\bin"
echo 准备工作完成！按任意键退出...
pause >nul
exit