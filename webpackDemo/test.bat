
time/t
echo '����' 
::@echo off
::start cmd /k "cd E:\works\webpackDemo\modlueA &&  npm run build  && taskkill /f /t /im cmd.exe"
::for /r . %%i in (.) do echo %%~pni

@echo off
::�����ļ�������
SET SourceFile=dist
::�ж��Ƿ�dist���ļ���
if exist %SourceFile% (
::������ڣ�ɾ��֮ǰ����õ�dist
   rd /s/q  dist
) else (
    echo %SourceFile% is not exist!
)
md %SourceFile%

::������ǰĿ¼���ļ������� modlue ���ļ���
@echo off
for /d %%i in (.\modlue*)  do (
     echo %%i 
    :: ��Ŀ¼��ִ��npm ���
    start cmd /k  "cd %%i   &&  npm run build   && taskkill /f /t /im cmd.exe"
)
time/t