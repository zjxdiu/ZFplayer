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
echo ϵͳ�汾������Ҫ���밲װ���Vista�汾...
pause
exit
:inst
cls
title ��Դ���...
color F0
echo ���ڼ����Դ...
if exist "%CD%\ffmpeg\bin\ffplay*.exe" goto ok
echo ��Դȱʧ������������...
pause
exit
:ok
cls
color 0F
title ������...
echo ��ӭʹ��ZFplayer��װ����
echo ����������Զ��������׼��������
echo ��Ҫ�˳�����ֱ�ӹرճ���...
pause
cls
color 0F
title ������...
echo ��ʼ����׼������...
echo �����ļ�...
md D:\ffmpeg
xcopy "%cd%\ffmpeg" D:\ffmpeg /s
echo ���û�������...
setx path "D:\ffmpeg\bin"
echo ׼��������ɣ���������˳�...
pause >nul
exit