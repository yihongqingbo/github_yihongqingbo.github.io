
@echo off
:begin
echo ==========================请选择你需要打包的项目===============================
echo 0 退出系统
echo 1 sony-back
echo 2 sony-api
echo 3 poc-baas
set/p a=请选择对应的数字:
if "%a%"=="1" goto :T
if "%a%"=="2" goto :S
if "%a%"=="3" goto :N
if "%a%"=="0" goto :end
echo\
echo 输入的值有误，请重新输入
echo\ 
goto :begin

:T
::项目所在的根目录
F:
::项目所在的目录
cd F:\git\sony\pack\SonyBackendManager
::更新git
call git pull origin ia-dev
::打包并成功之后打开target目录
call mvn clean install && explorer target 
::文件重命名
cd F:\git\sony\pack\SonyBackendManager\target
call rename backoffice.war ROOT.war
pause
goto :begin
 
:S
::项目所在的根目录
F:
::项目所在的目录
cd F:\git\sony\pack\SonySelectMusicAPI
::更新git
call git pull origin ia-dev
call mvn clean install && explorer target 
cd target
call rename musicapi.war ROOT.war

pause
goto :begin
 
:N
::项目所在的根目录
E:
::项目所在的目录
cd E:\hyperledge\git\pack\pocBaaS
::更新git
call git pull origin develop
::打包
call mvn clean install && explorer target 
cd target
call rename poc-baas-0.0.1-SNAPSHOT.jar poc-baas.jar

pause
goto :begin
 
:end
exit
