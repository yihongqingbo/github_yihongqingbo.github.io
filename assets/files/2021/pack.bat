
@echo off
:begin
echo ==========================��ѡ������Ҫ�������Ŀ===============================
echo 0 �˳�ϵͳ
echo 1 sony-back
echo 2 sony-api
echo 3 poc-baas
set/p a=��ѡ���Ӧ������:
if "%a%"=="1" goto :T
if "%a%"=="2" goto :S
if "%a%"=="3" goto :N
if "%a%"=="0" goto :end
echo\
echo �����ֵ��������������
echo\ 
goto :begin

:T
::��Ŀ���ڵĸ�Ŀ¼
F:
::��Ŀ���ڵ�Ŀ¼
cd F:\git\sony\pack\SonyBackendManager
::����git
call git pull origin ia-dev
::������ɹ�֮���targetĿ¼
call mvn clean install && explorer target 
::�ļ�������
cd F:\git\sony\pack\SonyBackendManager\target
call rename backoffice.war ROOT.war
pause
goto :begin
 
:S
::��Ŀ���ڵĸ�Ŀ¼
F:
::��Ŀ���ڵ�Ŀ¼
cd F:\git\sony\pack\SonySelectMusicAPI
::����git
call git pull origin ia-dev
call mvn clean install && explorer target 
cd target
call rename musicapi.war ROOT.war

pause
goto :begin
 
:N
::��Ŀ���ڵĸ�Ŀ¼
E:
::��Ŀ���ڵ�Ŀ¼
cd E:\hyperledge\git\pack\pocBaaS
::����git
call git pull origin develop
::���
call mvn clean install && explorer target 
cd target
call rename poc-baas-0.0.1-SNAPSHOT.jar poc-baas.jar

pause
goto :begin
 
:end
exit
