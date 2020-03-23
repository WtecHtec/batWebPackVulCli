
time/t
echo '测试' 
::@echo off
::start cmd /k "cd E:\works\webpackDemo\modlueA &&  npm run build  && taskkill /f /t /im cmd.exe"
::for /r . %%i in (.) do echo %%~pni

@echo off
::设置文件夹名字
SET SourceFile=dist
::判断是否dist的文件夹
if exist %SourceFile% (
::如果存在，删除之前打包好的dist
   rd /s/q  dist
) else (
    echo %SourceFile% is not exist!
)
md %SourceFile%

::遍历当前目录下文件名带有 modlue 的文件夹
@echo off
for /d %%i in (.\modlue*)  do (
     echo %%i 
    :: 打开目录并执行npm 打包
    start cmd /k  "cd %%i   &&  npm run build   && taskkill /f /t /im cmd.exe"
)
time/t
