@echo off
echo ����uninst���ɽ��ע��״̬��ֱ�ӻس���ʼע��...
set /p cho=
if "%cho%"=="uninst" goto unin
goto chek
:chek
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto ok||goto nook
:nook
cls
echo ���������к������ע�ᣡ
set /p regst=
if "%regst%"=="zjxdiu" goto regi
echo ���кŴ�������������...
pause
goto chek
:regi
cls
echo ����ע��...
echo REGEDIT4 >temp.reg
echo [HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist] >>temp.reg
echo "Hadregist"=dword:00000001 >>temp.reg
regedit /s temp.reg
del temp.reg >nul
reg query HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist /v Hadregist >nul 2>nul&&goto ok||goto nxt
:nxt
cls
echo ע��ʧ�ܣ�����ע���д��״̬...
pause
exit
:ok
echo �Ѿ�ע����ɣ������˳�...
ping 127.0.0.1 -n 11 >nul
exit
:unin
cls
echo ���������ʼж��...
pause >nul
echo REGEDIT4 >temp.reg
echo [-HKEY_CURRENT_USER\Software\ZFplayer\Regist\regist\] >>temp.reg
regedit /s temp.reg
del temp.reg >nul
del D:\ffmpeg /s /q
echo ж����ɣ�
pause
exit