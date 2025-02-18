@echo off

:leiaute
mode 48
color 0a
title Automate
reg query HKCU\Console /v WindowPosition  1>nul 2>nul
if %errorlevel% equ 1 (
	reg add HKCU\Console /v WindowPosition /t REG_DWORD /d 0
	start "" %~f0
	exit
)

:inicio
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩烝烝烝烝烝烝烝炳栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩 INICIALIZANDO 栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩樛樛樛樛樛樛樛樂栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
set startpath=%~d0%~p0
cd /d %startpath%

:variaveis
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩 CRIANDO VARIAVEIS 栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
reg query "HKLM\Hardware\Description\system\CentralProcessor\0" | find /i "x86" > nul && set OSX=x86 || set OSX=x64
reg query "HKLM\Hardware\Description\system\CentralProcessor\0" | find /i "x86" > nul && set OS=32BIT || set OS=64BIT
reg query "HKLM\Hardware\Description\system\CentralProcessor\0" | find /i "x86" > nul && set WINOS=win32 || set WINOS=win64
rem echo Variavel com o tipo do sistema: Criada!

rem for /f "tokens=4 delims= " %%R in ('systeminfo ^| findstr /I /C:"sica total"') do call set RAM=%%R
rem set RAM=%RAM:.=%
rem echo Variavel com a mem�ria ram: Criada!

SET STARTEDGE=5
set AFTERDOWNLOAD=60
set ESPERANDO_DOWNLOAD_COMECAR=10
set TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE1=10
set TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE2=05
set TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE3=20
rem echo Variavel com o tempo de espera: Criada!

ver | findstr /i "5\.1\." > nul
if %errorlevel% equ 0 set SYSTEM=xp

ver | findstr /i "6\.0\." > nul
if %errorlevel% equ 0 set SYSTEM=vista

ver | findstr /i "6\.1\." > nul
if %errorlevel% equ 0 set SYSTEM=seven

ver | findstr /i "10\.0\." > nul
if %errorlevel% equ 0 set SYSTEM=10
rem echo Variavel com o sistema operacional: Criada!

reg query HKU\S-1-5-19 1>nul 2>nul
if %errorlevel% equ 1 set ELEVATE=Usuario
if %errorlevel% neq 1 set ELEVATE=Administrador
rem echo Variavel com o tipo de permiss�es: Criada!

set P1=%~1
rem echo Variavel com o perfil de instala艫o: Criada!

for /f "tokens=3 delims= " %%A in ('reg query HKCU\SOFTWARE\Microsoft\Edge\BLBeacon /v version') do set EdgeVersion=%%A
rem echo Variavel com a vers�o do Microsoft Edge: Criada!

:copyright
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩栩�
echo 裁栩栩栩栩栩� CREATED BY JEFERSON 栩栩栩栩栩栩�
echo 裁栩栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�

:resetvariables
set PERFIL=
set PROXIMO=
set INCREMENTO=
set MYSQLOPTION=

:profiles
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩�
echo 裁栩栩栩� SELECIONE O PERFIL DESEJADO 栩栩栩栩�
echo 裁栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 裁桎烝烝炳栩烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩�
echo 裁�  00  栩�          Padroniza��o          栩�
echo 裁�  01  栩�            Clientes            栩�
echo 裁�  02  栩�      DIY - Do It Yourself      栩�
echo 裁�  03  栩�             Update             栩�
echo 裁桀樛樛樂栩樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�

if not defined P1 goto escolha
set PERFIL=%P1%
goto automate

:escolha
if not defined P1 choice /N /C 1234567890 /M "浜 Digite a op��o desejada: "
if %errorlevel% equ 1 set PERFIL=10 12 13 14 19 20 21 22 23 24 25 26 27 31 33 34 90 91 98
if %errorlevel% equ 2 set PERFIL=09 & rem do it yourself
if %errorlevel% equ 3 set PERFIL=bu & rem bat update
if %errorlevel% equ 4 cls && goto copyright
if %errorlevel% equ 5 cls && goto copyright
if %errorlevel% equ 6 cls && goto copyright
if %errorlevel% equ 7 cls && goto copyright
if %errorlevel% equ 8 cls && goto copyright
if %errorlevel% equ 9 cls && goto copyright
if %errorlevel% equ 10 set PERFIL=13 14 90 91 98

if not defined P1 choice /N /C SN /M "藩 Deseja prosseguir? [S,N]: "
if %errorlevel% equ 1 goto automate
if %errorlevel% equ 2 cls && goto copyright

:automate
if not defined P1 set P1=%PERFIL%
call set PROXIMO=%%PERFIL:~%INCREMENTO%,2%%
if not defined PROXIMO goto fim
set /A INCREMENTO=INCREMENTO+3
goto %PROXIMO%

:09
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩栩�
echo 裁栩栩栩栩栩� CREATED BY JEFERSON 栩栩栩栩栩栩�
echo 裁栩栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 裁桎烝烝炳栩烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩�
echo 裁�  10  栩�      Elevar as Permiss�es      栩�
echo 裁�  11  栩� Ativar o Usu�rio Administrador 栩�
echo 裁�  12  栩�   Criar Ponto de Restaura��o   栩�
echo 裁�  13  栩�  Criar a Estrutura das Pastas  栩�
echo 裁�  14  栩�       Copiar os Arquivos       栩�
echo 裁�  15  栩�       Desativar Firewall       栩�
echo 裁�  16  栩�   Renomear Adaptador de Rede   栩�
echo 裁�  17  栩�    Desativar Windows Update    栩�
echo 裁�  18  栩�              7-Zip             栩�
echo 裁�  19  栩�           Antivirus            栩�
echo 裁�  20  栩�            Any Desk            栩�
echo 裁�  21  栩�        Avast Antivirus         栩�
echo 裁�  22  栩�           FolderSize           栩�
echo 裁�  23  栩�          GoogleChrome          栩�
echo 裁�  24  栩�              Java              栩�
echo 裁�  25  栩�             K-Lite             栩�
echo 裁�  26  栩�          Libre Office          栩�
echo 裁�  27  栩�           Light Shot           栩�
echo 裁�  28  栩�             Office             栩�
echo 裁�  29  栩�     Office 16.013801.20266     栩�
echo 裁�  30  栩�           PowerShell           栩�
echo 裁�  31  栩�           TeamViewer           栩�
echo 裁�  32  栩�            UltraVNC            栩�
echo 裁�  33  栩�            VCRedist            栩�
echo 裁�  34  栩�             Winrar             栩�
echo 裁桀樛樛樂栩樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
echo 浜 Exemplo: 11 24 30 ... (Separar por espa�os)
set /p PERFIL=藩 Selecione: 
set P1=
set INCREMENTO=

goto automate

:10
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝炳栩栩栩�
echo 裁栩栩栩 EXECUTANDO COMO ADMINISTRADOR 栩栩栩杠
echo 裁栩栩栩樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樂栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
set "path_bat=%~f0"
set "elevar_cmd=%~d0%~p0\configuracoes\programas\vbscript\elevate_cmd.vbs"

if %ELEVATE% equ Usuario (
	setlocal EnableDelayedExpansion
	cscript //NoLogo "!elevar_cmd!" /File:"!path_bat!" "%P1%"
	exit
)

goto automate

:11
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩烝烝烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩�
echo 裁栩栩栩栩栩 USU�RIO ADMINISTRADOR 栩栩栩栩栩杠
echo 裁栩栩栩栩栩樛樛樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
for /f "tokens=3" %%A in ('net user administrador^| findstr /I /C:"Conta ativa"') do set ADMIN=%%A
if %ADMIN% equ N�o (
	net user %USERNAME% /active:no
	net user administrador /active:yes
	net user administrador *
)

goto automate

:12
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩�
echo 裁栩栩� CRIANDO UM PONTO DE RESTAURACAO 栩栩栩�
echo 裁栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if %SYSTEM% neq 10 wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Automate", 100, 12 && goto automate

if %SYSTEM% equ 10 (
	PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description "Automate" -RestorePointType "MODIFY_SETTINGS"; " ' " -Verb RunAs}"

	:powershell
	for /f "tokens=1" %%T in ('tasklist^| findstr /I /C:"powershell"') do set TASK=%%T
	if not defined TASK goto automate
	set TASK=
	goto powershell
)

:13
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩�
echo 裁栩栩栩� CRIANDO ESTRUTURA DE PASTAS 栩栩栩栩�
echo 裁栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
mkdir "c:\config"
mkdir "c:\config\temp"
mkdir "c:\config\drivers"
mkdir "c:\config\imagens"
mkdir "c:\config\programas"
cacls "c:\config" /e /p Todos:f > nul

goto automate

:14
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩 COPIANDO ARQUIVOS 栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
copy ".\configuracoes\atalhos\*.*" "C:%HOMEPATH%\..\Public\Desktop" > nul

goto automate

:15
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 FIREWALL 栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
netsh firewall set opmode disable > nul
netsh advfirewall set allprofiles state off > nul
netsh advfirewall firewall set rule group="Descoberta de Rede" new enable=Yes > nul

goto automate

:16
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩桎烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩� REDE 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩栩桀樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
for /f "tokens=4 delims= " %%N in ('netsh interface show interface ^| findstr /I /C:"Conectado"') do set NETWORK=%%N
for /f "tokens=3 delims=SPACE" %%N in ('netsh interface show interface ^| findstr /I /C:"Conectado"') do set ADAPTER=%%N

set NETWORK=%NETWORK:~0,1%
set NETWORKADAPTER=%NETWORK%%ADAPTER%

netsh interface set interface name="%NETWORKADAPTER%" newname="Ethernet" > nul
rem netsh int tcp set global chimney=enabled
rem netsh int tcp set global rss=enabled
rem netsh int tcp set global autotuning=normal
rem netsh int tcp set global autotuninglevel=normal

goto automate

:17
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝炳栩栩�
echo 裁栩栩 DESATIVAR ATUALIZACOES DO WINDOWS 栩栩杠
echo 裁栩栩樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樂栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v AUOptions /t REG_DWORD /d 2
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1

goto automate

:18
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩烝烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩 7 ZIP 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩栩樛樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Seven Zip\%OS%\sevenzip.exe" /S
if %errorlevel% equ 1 echo 7-ZIP >> "c:\config\log.txt"

if %System%==xp reg import ".\configuracoes\registros\7z_XP.reg" && goto automate
reg import ".\configuracoes\registros\7z_%OS%.reg"

goto automate

:19
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 ANTIVIRUS 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if %SYSTEM%==10 powershell -Command Add-MpPreference -ExclusionPath "c:\config"
rem if %SYSTEM%==10 powershell -Command Add-MpPreference -ExclusionExtension ".automate"
rem if %SYSTEM%==10 powershell -Command Add-MpPreference -ExclusionProcess "automate.exe"
rem if %SYSTEM%==10 powershell -Command Remove-MpPreference -ExclusionExtension ".automate"

if %errorlevel% equ 1 echo ANTIVIRUS >> "c:\config\log.txt"

goto automate

:20
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩桎烝烝烝烝栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩� ANYDESK 栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩桀樛樛樛樛栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\AnyDesk\AnyDesk.exe" --install "C:\Program Files\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent
if %errorlevel% equ 1 echo ANYDESK >> "c:\config\log.txt"

goto automate

:21
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩烝烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩 AVAST 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩栩樛樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Avast\avast.exe" /silent
if %errorlevel% equ 1 echo AVAST >> "c:\config\log.txt"

goto automate

:22
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� FOLDER SIZE 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Folder Size\%OS%\foldersize.msi" /qb
if %errorlevel% equ 1 echo FOLDER SIZE >> "c:\config\log.txt"

goto automate

:23
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩烝烝烝烝烝烝烝炳栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩 GOOGLE CHROME 栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩樛樛樛樛樛樛樛樂栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Google\%OS%\%SYSTEM%\chrome.exe"
if %errorlevel% equ 1 echo GOOGLE CHROME >> "c:\config\log.txt"

goto automate

:24
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩桎烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩� JAVA 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩栩桀樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Java\%OS%\java.exe" /s
if %errorlevel% equ 1 echo JAVA >> "c:\config\log.txt"

goto automate

:25
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩烝烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩 KLITE 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩栩樛樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\K-Lite\klite.exe" /silent
if %errorlevel% equ 1 echo K-LITE >> "c:\config\log.txt"

goto automate

:26
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩烝烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩 LIBRE OFFICE 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩樛樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if %OS%==32BIT ".\programas\Libre Office\%OS%\libreoffice.msi" /qb REGISTER_ALL_MSO_TYPES=0 UI_LANGS=pt_BR ISCHECKFORPRODUCTUPDATES=0 REBOOTYESNO=No QUICKSTART=0 ADDLOCAL=ALL VC_REDIST=0
if %OS%==64BIT ".\programas\Libre Office\%OS%\libreoffice.msi" /qb REGISTER_ALL_MSO_TYPES=0 UI_LANGS=pt_BR ISCHECKFORPRODUCTUPDATES=0 REBOOTYESNO=No QUICKSTART=0 ADDLOCAL=ALL VC_REDIST=0
if %errorlevel% equ 1 echo LIBRE OFFICE >> "c:\config\padrao\log.txt"
xcopy ".\configuracoes\programas\libreoffice" "%userprofile%\Dados de aplicativos\LibreOffice\4\user" /E /I /C /H /R /K /Y

goto automate

:27
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 LIGHTSHOT 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Lightshot\setup-lightshot.exe" /sp /silent /supressmsgboxes
if %errorlevel% equ 1 echo LIGHTSHOT >> "c:\config\log.txt"

goto automate

:28
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩烝烝烝烝栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩 OFFICE 栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩栩樛樛樛樛栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
cd ".\programas\Microsoft Office\"
".\setup.exe"
if %errorlevel% equ 1 echo OFFICE >> "c:\config\log.txt"

cd /d %startpath%

:office
for /f %%T in ('wmic process get name^| findstr /I /C:"setup32"') do set TASK=%%T
if not defined TASK goto automate
set TASK=
goto office

:29
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩�
echo 裁栩栩栩栩� OFFICE 16.0.13801.20266 栩栩栩栩栩�
echo 裁栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
for /f "tokens=9 delims=\" %%a in ('reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Common\Identity\Identities\ ^| findstr /i "LiveId"') do reg add HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Privacy\SettingsStore\%%a /v DisconnectedState /t REG_DWORD /d 2 /f > nul
reg add HKLM\SOFTWARE\Policies\Microsoft\Office\16.0\Common\OfficeUpdate /v EnableAutomaticUpdates /t REG_DWORD /d 0 /f > nul
reg add HKLM\SOFTWARE\Policies\Microsoft\Office\16.0\Common\OfficeUpdate /v HideEnableDisableUpdates /t REG_DWORD /d 1 /f > nul

"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2rclient.exe" /update user updatetoversion=16.0.13801.20266

:office_update
for /f %%T in ('wmic process get ExecutablePath^| findstr /I /C:"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2rclient.exe"') do set TASK=%%T
if not defined TASK goto automate
set TASK=
goto office_update

:30
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩 REMOTE POWERSHELL 栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
powershell -command Enable-PSRemoting -Force

goto automate

:31
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� TEAM VIEWER 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Team Viewer\%OS%\teamviewer.exe" /S
if %errorlevel% equ 1 echo TEAM VIEWER >> "c:\config\log.txt"

goto automate

:32
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 ULTRA VNC 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Ultra VNC\%OS%\uvnc.exe" /verysilent /supressmsgboxes /nocancel /norestart /loadinf=".\configuracoes\programas\uvnc\ultravnc.inf"
if %errorlevel% equ 1 echo ULTRA VNC >> "c:\config\log.txt"

goto automate

:33
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 VC REDIST 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\Visual C++\%OS%\vcredist.exe" /install /quiet /norestart
if %errorlevel% equ 1 echo VISUAL C++ >> "c:\config\log.txt"

goto automate

:34
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩桎烝烝烝炳栩栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩� WINRAR 栩栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩桀樛樛樛樂栩栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
".\programas\WinRAR\%OS%\winrar.exe" /S
if %errorlevel% equ 1 echo WINRAR >> "c:\config\log.txt"

goto automate

												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=- �REA DEDICADA -=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-= PARA PADRONIZA巴O =-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer

:90
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩烝烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩 PADRONIZA��O 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩樛樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�

powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
powercfg /change monitor-timeout-ac 20
powercfg /change monitor-timeout-dc 0
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 0
powercfg /h /size %60 > nul

rem Botao de Desligar
powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3

rem Botao de Suspens�o
powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0

rem Fechamento de Tampa
powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

:91
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩烝烝烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩�
echo 裁栩栩栩栩栩 ADICIONANDO REGISTROS 栩栩栩栩栩杠
echo 裁栩栩栩栩栩樛樛樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
for /f "tokens=* delims=" %%a in (.\configuracoes\registros\regini.txt) do (
	reg add %%a /f
	echo %%a [1 5 9 17] >> c:\config\temp\regini.txt
)

regini "c:\config\temp\regini.txt"
reg import ".\configuracoes\registros\padrao.reg" > nul
copy ".\configuracoes\teclado_ms_dos\*.*" "c:\windows\system32" > nul

goto automate


												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=- �REA DEDICADA -=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=- PARA EXCLUS�O -=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer
												rem =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= mer

:98
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 EXCLUINDO 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if exist "c:\config\log.txt" notepad "c:\config\log.txt"
if exist "c:\config\log.txt" del /s /q "c:\config\log.txt" > nul

rd c:\config\temp\ /s /q > nul

goto automate

:99
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� REINICIANDO 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
shutdown -r -t 00

goto automate

:bu
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩桎烝烝烝烝烝烝烝烝栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩� AUTOMATE UPDATE 栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩桀樛樛樛樛樛樛樛樛栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
set urlEdgeDriver=https://msedgedriver.azureedge.net/%EdgeVersion%/edgedriver_%WINOS%.zip
set urlConfiguracoes=https://1drv.ms/u/s!Aq-KETGA-Cp5uko0RWdm4WiqrgPr?e=yK3Rj8

set urlSevenZipx64=https://sourceforge.net/projects/sevenzip/files/latest/download
set urlAnyDesk=https://anydesk.com/pt/downloads/thank-you?dv=win_exe
set urlAvast=https://www.avast.com/pt-br/download-thank-you.php?product=FAV-AVAST^&locale=pt-br^&direct=1
set urlFolderSize=https://sourceforge.net/projects/foldersize/files/latest/download
set urlChromeV49=https://1drv.ms/u/s!Aq-KETGA-Cp5tywiJo33G09VVmjE?e=CmgKKw
set urlJavaX86=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246472_2dee051a5d0647d5be72a7c0abff270e
set urlJavaX64=https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e
set urlLightshot=https://app.prntscr.com/build/setup-lightshot.exe
set urlMicrosoftOffice=https://tb.rg-adguard.net/dl.php?go=a24fe64a
set urlTeamViewerX86=https://download.teamviewer.com/download/TeamViewer_Setup.exe
set urlTeamViewerX64=https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe
set urlVirtualAge=https://www30.bhan.com.br/jti50/ua-client.windows.exe
set urlVCredistX86=https://aka.ms/vs/17/release/vc_redist.x86.exe
set urlVCredistX64=https://aka.ms/vs/17/release/vc_redist.x64.exe
set urlWinrarX86=https://www.win-rar.com/postdownload.html?^&L=0^&Version=32bit
set urlWinrarX64=https://www.win-rar.com/postdownload.html?^&L=0^&Version=64bit

set urlChromeX86=https://www.google.com/chrome/thank-you.html?statcb=1^&standalone=1^&platform=win^&defaultbrowser=1
set urlChromeX64=https://www.google.com/chrome/thank-you.html?statcb=1^&standalone=1^&platform=win64^&defaultbrowser=1
set urlKLiteMega=https://codecguide.com/download_k-lite_codec_pack_mega.htm
set urlLibreX86=https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/?type=win-x86^&lang=pt-BR
set urlLibreX64=https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/?type=win-x64^&lang=pt-BR
set urlUltraVNC=https://uvnc.com/downloads/ultravnc.html

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩�
echo 裁栩栩栩� CRIANDO ESTRUTURA DE PASTAS 栩栩栩栩�
echo 裁栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if not exist ".\backups\" mkdir backups > nul
if not exist ".\configuracoes\" mkdir configuracoes > nul
if not exist ".\drivers\" mkdir drivers > nul
if not exist ".\programas\" mkdir programas > nul

cd .\programas\ > nul
if not exist ".\Seven Zip\32BIT\" mkdir "Seven Zip\32BIT" > nul
if not exist ".\Seven Zip\64BIT\" mkdir "Seven Zip\64BIT" > nul
if not exist ".\AnyDesk\" mkdir "AnyDesk" > nul
if not exist ".\Avast\" mkdir "Avast" > nul
if not exist ".\Folder Size\32BIT\" mkdir "Folder Size\32BIT" > nul
if not exist ".\Folder Size\64BIT\" mkdir "Folder Size\64BIT" > nul
if not exist ".\Google\32BIT\xp\" mkdir Google\32BIT\xp > nul
if not exist ".\Google\32BIT\vista\" mkdir Google\32BIT\vista > nul
if not exist ".\Google\32BIT\seven\" mkdir Google\32BIT\seven > nul
if not exist ".\Google\64BIT\seven\" mkdir Google\64BIT\seven > nul
if not exist ".\Google\64BIT\10\" mkdir Google\64BIT\10 > nul
if not exist ".\Java\32BIT\" mkdir "Java\32BIT" > nul
if not exist ".\Java\64BIT\" mkdir "Java\64BIT" > nul
if not exist ".\K-Lite\" mkdir "K-Lite" > nul
if not exist "Libre Office\32BIT" mkdir "Libre Office\32BIT" > nul
if not exist "Libre Office\64BIT" mkdir "Libre Office\64BIT" > nul
if not exist ".\Lightshot\" mkdir "Lightshot" > nul
if not exist ".\Microsoft Office\" mkdir "Microsoft Office" > nul
if not exist ".\Team Viewer\32BIT\" mkdir "Team Viewer\32BIT" > nul
if not exist ".\Team Viewer\64BIT\" mkdir "Team Viewer\64BIT" > nul
if not exist ".\Ultra VNC\32BIT\" mkdir "Ultra VNC\32BIT" > nul
if not exist ".\Ultra VNC\64BIT\" mkdir "Ultra VNC\64BIT" > nul
if not exist ".\Virtual Age\" mkdir "Virtual Age" > nul
if not exist ".\Visual C++\32BIT\" mkdir "Visual C++\32BIT" > nul
if not exist ".\Visual C++\64BIT\" mkdir "Visual C++\64BIT" > nul
if not exist ".\WinRAR\32BIT" mkdir "WinRAR\32BIT" > nul
if not exist ".\WinRAR\64BIT" mkdir "WinRAR\64BIT" > nul
cd..

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩栩�
echo 裁栩栩栩栩栩� INICIANDO NAVEGADOR 栩栩栩栩栩栩�
echo 裁栩栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
start msedge -inprivate
timeout %STARTEDGE% > nul

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩栩�
echo 裁栩栩栩栩栩� BAIXANDO UTILIDADES 栩栩栩栩栩栩�
echo 裁栩栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if not exist "C:\config\drivers\browser\msedgedriver.exe" start msedge -inprivate "https://msedgedriver.azureedge.net/%EdgeVersion%/edgedriver_%WINOS%.zip" > nul
if exist "C:\config\drivers\browser\msedgedriver.exe" goto download_configuracoes

:waiting_download_utilities
if not exist "%userprofile%\Downloads\edgedriver_win64.zip" goto waiting_download_utilities

"%ProgramFiles%\WinRAR\winrar.exe" x -Y "%userprofile%\Downloads\edgedriver_win64.zip" "C:\config\drivers\browser\" > nul
if %errorlevel% equ 1 echo DOWNLOAD EDGE DRIVER - %urlEdgeDriver% >> "c:\config\log.txt"
rmdir "C:\config\drivers\browser\Driver_Notes" /s /q

:download_configuracoes
start msedge -inprivate "https://1drv.ms/u/s!Aq-KETGA-Cp5uksXfuJK5KJwzcaA?e=eLpcsl" > nul

:waiting_download_utilities2
if not exist "%userprofile%\Downloads\configuracoes.rar" goto waiting_download_utilities2
"%ProgramFiles%\WinRAR\winrar.exe" x -Y "%userprofile%\Downloads\configuracoes.rar" ".\configuracoes\" /y > nul
if %errorlevel% equ 1 echo DOWNLOAD CONFIGURACOES - %urlConfiguracoes% >> "c:\config\log.txt"

rem echo 浜様様様様様様様様様様様様様様様様様様様様様様�
rem echo 裁栩栩烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝烝炳栩栩�
rem echo 裁栩栩 ADICIONANDO VARIAVEIS DE AMBIENTE 栩栩杠
rem echo 裁栩栩樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樛樂栩栩�
rem echo 藩様様様様様様様様様様様様様様様様様様様様様様�
rem chrome -incognito
rem if %errorlevel% equ 9009 SETX PATH "%PATH%;C:\Program Files\Google\Chrome\Application"

:continue_update
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩烝烝烝烝烝烝烝烝烝炳栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩 BAIXANDO ARQUIVOS 栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩樛樛樛樛樛樛樛樛樛樂栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
start msedge -inprivate "https://sourceforge.net/projects/sevenzip/files/latest/download" > nul
start msedge -inprivate "https://anydesk.com/pt/downloads/thank-you?dv=win_exe" > nul
start msedge -inprivate "https://www.avast.com/pt-br/download-thank-you.php?product=FAV-AVAST&locale=pt-br&direct=1" > nul
start msedge -inprivate "https://sourceforge.net/projects/foldersize/files/latest/download" > nul
start msedge -inprivate "https://1drv.ms/u/s!Aq-KETGA-Cp5tywiJo33G09VVmjE?e=CmgKKw" > nul
start msedge -inprivate "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246472_2dee051a5d0647d5be72a7c0abff270e" > nul
start msedge -inprivate "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=246474_2dee051a5d0647d5be72a7c0abff270e" > nul
start msedge -inprivate "https://app.prntscr.com/build/setup-lightshot.exe" > nul
start msedge -inprivate "https://download.teamviewer.com/download/TeamViewer_Setup.exe" > nul
start msedge -inprivate "https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe" > nul
start msedge -inprivate "https://www30.bhan.com.br/jti50/ua-client.windows.exe" > nul
start msedge -inprivate "https://aka.ms/vs/17/release/vc_redist.x86.exe" > nul
start msedge -inprivate "https://aka.ms/vs/17/release/vc_redist.x64.exe" > nul
start msedge -inprivate "https://www.win-rar.com/postdownload.html?&L=0&Version=32bit" > nul
start msedge -inprivate "https://www.win-rar.com/postdownload.html?&L=0&Version=64bit" > nul
timeout %ESPERANDO_DOWNLOAD_COMECAR% > nul

for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL=%%b
set /a ESPERAR_ATE = MINUTO_ATUAL + TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE1
if %ESPERAR_ATE% geq 60 set /a ESPERAR_ATE = ESPERAR_ATE - 60

:waiting_downloads
for /f "tokens=*" %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr N..o') do del "%%A" /f > nul
for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL_NO_LOOP=%%b
if %MINUTO_ATUAL_NO_LOOP% equ %ESPERAR_ATE% (
	taskkill /f /im msedge* 1>nul 2>nul
	del C:%homepath%\Downloads\*.crdownload /f > nul
)

for /f %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr ".crdownload"') do goto waiting_downloads

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� PROCESSANDO 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
set /a SevenZipVersion=1
set /a FolderSizeVersion=2

for /f "tokens=2 delims=-" %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr "FolderSize"') do set FolderSizeVersion=%%A
for /f "tokens=5 delims=\-" %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr "7z"') do set SevenZipVersion=%%A
set /a SevenZipVersion = %SevenZipVersion:~2%

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩�
echo 裁栩栩栩� BAIXANDO ARQUIVOS - PARTE 2 栩栩栩栩�
echo 裁栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
start msedge -inprivate "https://www.7-zip.org/a/7z%SevenZipVersion%.exe" > nul
start msedge -inprivate "http://sourceforge.net/projects/foldersize/files/foldersize/%FolderSizeVersion%/FolderSize-%FolderSizeVersion%-x64.msi/download" > nul
timeout %ESPERANDO_DOWNLOAD_COMECAR% > nul

for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL=%%b
set /a ESPERAR_ATE = MINUTO_ATUAL + TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE2
if %ESPERAR_ATE% geq 60 set /a ESPERAR_ATE = ESPERAR_ATE - 60

:waiting_downloads_part2
for /f "tokens=*" %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr N..o') do del "%%A" /f > nul
for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL_NO_LOOP=%%b
if %MINUTO_ATUAL_NO_LOOP% equ %ESPERAR_ATE% (
	taskkill /f /im msedge* 1>nul 2>nul
	del C:%homepath%\Downloads\*.crdownload /f > nul
)

for /f %%A in ('dir C:%homepath%\Downloads /s /b ^| findstr ".crdownload"') do goto waiting_downloads_part2

taskkill /f /im msedge* 1>nul 2>nul

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩�
echo 裁栩栩栩� BAIXANDO ARQUIVOS - PARTE 3 栩栩栩栩�
echo 裁栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
rem start /wait "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "url" -x "xpath1,xpath2,xpath3" -i "True or False"
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://www.google.com/chrome/thank-you.html?statcb=1&standalone=1&platform=win&defaultbrowser=1" -x "/html/body/div[3]/section[1]/div/div/div/div/div[4]/p/a" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://www.google.com/chrome/thank-you.html?statcb=1&standalone=1&platform=win64&defaultbrowser=1" -x "/html/body/div[3]/section[1]/div/div/div/div/div[4]/p/a" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://codecguide.com/download_k-lite_codec_pack_mega.htm" -x "/html/body/div/div[2]/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td[2]/a" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/?type=win-x86&lang=pt-BR" -x "//*[@id='content1']/div/article/div[1]/div/div[1]/div/a[1]/span" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/?type=win-x64&lang=pt-BR" -x "//*[@id='content1']/div/article/div[1]/div/div[1]/div/a[1]/span" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://tb.rg-adguard.net/dl.php?go=a24fe64a" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://uvnc.com/downloads/ultravnc.html" -x "//tr[@class='cat-list-row0'][1]/td/a,remove_ads://tr[@class='cat-list-row0'][1]/td/a,//*[@id='sp-component']/div/div[2]/div[2]/div[2]/table/tbody/tr/td/table/tbody/tr[3]/td[2]/a,//*[@id='jd_agreeForm']/input[1],//*[@id='jd_license_submit']" -i "False" > nul
start "" ".\configuracoes\programas\automate\autopy-downloader.exe" -s "https://uvnc.com/downloads/ultravnc.html" -x "//tr[@class='cat-list-row0'][1]/td/a,remove_ads://tr[@class='cat-list-row0'][1]/td/a,//*[@id='sp-component']/div/div[2]/div[2]/div[1]/table/tbody/tr/td/table/tbody/tr[3]/td[2]/a,//*[@id='jd_agreeForm']/input[1],//*[@id='jd_license_submit']" -i "False" > nul
timeout %ESPERANDO_DOWNLOAD_COMECAR% > nul

for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL=%%b
set /a ESPERAR_ATE = MINUTO_ATUAL + TEMPO_DE_ESPERA_MAXIMO_MINUTOS_PARTE3
if %ESPERAR_ATE% geq 60 set /a ESPERAR_ATE = ESPERAR_ATE - 60

:waiting_downloads_part3
for /f "tokens=1-3 delims=: " %%a in ('echo %time%') do set MINUTO_ATUAL_NO_LOOP=%%b
if %MINUTO_ATUAL_NO_LOOP% equ %ESPERAR_ATE% (
	taskkill /f /im msedge* 1>nul 2>nul
	del C:%homepath%\Downloads\*.crdownload /f > nul
)

for /f %%T in ('wmic process get name^| findstr /I /C:"msedgedriver.exe"') do set TASK=%%T
if not defined TASK goto automate_downloaded
set TASK=
goto waiting_downloads_part3

:automate_downloaded
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� PROCESSANDO 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
set /a JavaVersion=3
set /a KLiteVersion=4
set /a LibreVersion=5
set /a UltraVNCVersion=6
set /a WinRARVersion=7

for /f %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "K-Lite"') do set KLiteVersion=%%A.exe
for /f "tokens=4 delims=._" %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "K-Lite"') do set KLiteVersion=%%A
for /f "tokens=3 delims=-." %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "winrar"') do set WinRARVersion=%%A
for /f "tokens=2 delims=_" %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "LibreOffice"') do set LibreVersion=%%A
for /f "tokens=1-3 delims=-" %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "jre"') do set JavaVersion=%%A-%%B-%%C-
for /f "tokens=2-4 delims=_" %%A in ('dir C:%homepath%\Downloads /b /a-d ^| findstr "UltraVNC"') do set UltraVNCVersion=%%A_%%B_%%C

echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩桎烝烝烝烝烝烝栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩� ATUALIZANDO 栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩桀樛樛樛樛樛樛栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
copy "%userprofile%\Downloads\7z%SevenZipVersion%.exe" "%startpath%programas\Seven Zip\32BIT\sevenzip.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE 7-ZIP X86 >> "c:\config\log.txt"

copy "%userprofile%\Downloads\7z%SevenZipVersion%-x64.exe" "%startpath%programas\Seven Zip\64BIT\sevenzip.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE 7-ZIP X64 - %urlSevenZipx64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\AnyDesk.exe" "%startpath%programas\AnyDesk\anydesk.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE ANYDESK - %urlAnyDesk% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\avast_free_antivirus_setup_offline.exe" "%startpath%programas\Avast\avast.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE AVAST - %urlAvast% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x86.msi" "%startpath%programas\Folder Size\32BIT\foldersize.msi" /y > nul
if %errorlevel% equ 1 echo UPDATE FOLDERSIZE X86 - %urlFolderSize% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x64.msi" "%startpath%programas\Folder Size\64BIT\foldersize.msi" /y > nul
if %errorlevel% equ 1 echo UPDATE FOLDERSIZE X64 >> "c:\config\log.txt"

copy "%userprofile%\Downloads\chrome.exe" "%startpath%programas\Google\32BIT\xp\chrome.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE CHROME WINDOWS XP - %urlChromeV49% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\chrome.exe" "%startpath%programas\Google\32BIT\vista\chrome.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE CHROME WINDOWS VISTA - %urlChromeV49% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\ChromeStandaloneSetup.exe" "%startpath%programas\Google\32BIT\seven\chrome.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE CHROME WINDOWS 7 X86 - %urlChromeX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\ChromeStandaloneSetup64.exe" "%startpath%programas\Google\64BIT\seven\chrome.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE CHROME WINDOWS 7 X64 - %urlChromeX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\ChromeStandaloneSetup64.exe" "%startpath%programas\Google\64BIT\10\chrome.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE CHROME WINDOWS 10 X64 - %urlChromeX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\%JavaVersion%i586.exe" "%startpath%programas\Java\32BIT\java.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE JAVA X86 - %urlJavaX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\%JavaVersion%x64.exe" "%startpath%programas\Java\64BIT\java.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE JAVA X64 - %urlJavaX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\K-Lite_Codec_Pack_%KLiteVersion%_Mega.exe" "%startpath%programas\K-Lite\klite.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE K-LITE - %urlKLiteMega% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x86.msi" "%startpath%programas\Libre Office\LibreOffice_%LibreVersion%_Win_x86.msi" /y > nul
if %errorlevel% equ 1 echo UPDATE LIBREOFFICE X86 - %urlLibreX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x64.msi" "%startpath%programas\Libre Office\LibreOffice_%LibreVersion%_Win_x64.msi" /y > nul
if %errorlevel% equ 1 echo UPDATE LIBREOFFICE X64 - %urlLibreX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\setup-lightshot.exe" "%startpath%programas\Lightshot\setup-lightshot.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE LIGHTSHOT - %urlLightshot% >> "c:\config\log.txt"

"%ProgramFiles%\WinRAR\winrar.exe" x -Y "%userprofile%\Downloads\O365ProPlusRetail.img" "%startpath%programas\Microsoft Office\" > nul
if %errorlevel% equ 1 echo UPDATE OFFICE - %urlMicrosoftOffice% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\TeamViewer_Setup.exe" "%startpath%programas\Team Viewer\32BIT\teamviewer.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE TEAMVIEWER X86 - %urlTeamViewerX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\TeamViewer_Setup.exe" "%startpath%programas\Team Viewer\64BIT\teamviewer.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE TEAMVIEWER X64 - %urlTeamViewerX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X86_Setup.exe" "%startpath%programas\Ultra VNC\32BIT\ultravnc.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE ULTRAVNC X86 - %urlUltraVNC% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X64_Setup.exe" "%startpath%programas\Ultra VNC\64BIT\ultravnc.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE ULTRAVNC X64 - %urlUltraVNC% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\ua-client.windows.exe" "%startpath%programas\Virtual Age\virtualage.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE VIRTUALAGE - %urlVirtualAge% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\VC_redist.x86.exe" "%startpath%programas\Visual C++\32BIT\vcredist.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE VISUAL C++ X86 - %urlVCredistX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\VC_redist.x64.exe" "%startpath%programas\Visual C++\64BIT\vcredist.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE VISUAL C++ X64 - %urlVCredistX64% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\winrar-x32-%WinRARVersion%.exe" "%startpath%programas\WinRAR\32BIT\winrar.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE WINRAR X86 - %urlWinrarX86% >> "c:\config\log.txt"

copy "%userprofile%\Downloads\winrar-x64-%WinRARVersion%.exe" "%startpath%programas\WinRAR\64BIT\winrar.exe" /y > nul
if %errorlevel% equ 1 echo UPDATE WINRAR X64 - %urlWinrarX64% >> "c:\config\log.txt"

:bu_excluir
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩烝烝烝烝烝炳栩栩栩栩栩栩栩栩�
echo 裁栩栩栩栩栩栩栩栩 EXCLUINDO 栩栩栩栩栩栩栩栩杠
echo 裁栩栩栩栩栩栩栩栩樛樛樛樛樛樂栩栩栩栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
if exist "%userprofile%\Downloads\edgedriver_win64.zip" del "%userprofile%\Downloads\edgedriver_win64.zip" /f > nul
if exist "%userprofile%\Downloads\configuracoes.rar" del "%userprofile%\Downloads\configuracoes.rar" /f > nul

if exist "%userprofile%\Downloads\7z%SevenZipVersion%.exe" del "%userprofile%\Downloads\7z%SevenZipVersion%.exe" /f > nul
if exist "%userprofile%\Downloads\7z%SevenZipVersion%-x64.exe" del "%userprofile%\Downloads\7z%SevenZipVersion%-x64.exe" /f > nul
if exist "%userprofile%\Downloads\AnyDesk.exe" del "%userprofile%\Downloads\AnyDesk.exe" /f > nul
if exist "%userprofile%\Downloads\avast_free_antivirus_setup_offline.exe" del "%userprofile%\Downloads\avast_free_antivirus_setup_offline.exe" /f > nul
if exist "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x86.msi" del "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x86.msi" /f > nul
if exist "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x64.msi" del "%userprofile%\Downloads\FolderSize-%FolderSizeVersion%-x64.msi" /f > nul
if exist "%userprofile%\Downloads\chrome.exe" del "%userprofile%\Downloads\chrome.exe" /f > nul
if exist "%userprofile%\Downloads\ChromeStandaloneSetup.exe" del "%userprofile%\Downloads\ChromeStandaloneSetup.exe" /f > nul
if exist "%userprofile%\Downloads\ChromeStandaloneSetup64.exe" del "%userprofile%\Downloads\ChromeStandaloneSetup64.exe" /f > nul
if exist "%userprofile%\Downloads\%JavaVersion%i586.exe" del "%userprofile%\Downloads\%JavaVersion%i586.exe" /f > nul
if exist "%userprofile%\Downloads\%JavaVersion%x64.exe" del "%userprofile%\Downloads\%JavaVersion%x64.exe" /f > nul
if exist "%userprofile%\Downloads\K-Lite_Codec_Pack_%KLiteVersion%_Mega.exe" del "%userprofile%\Downloads\K-Lite_Codec_Pack_%KLiteVersion%_Mega.exe" /f > nul
if exist "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x86.msi" del "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x86.msi" /f > nul
if exist "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x64.msi" del "%userprofile%\Downloads\LibreOffice_%LibreVersion%_Win_x64.msi" /f > nul
if exist "%userprofile%\Downloads\setup-lightshot.exe" del "%userprofile%\Downloads\setup-lightshot.exe" /f > nul
if exist "%userprofile%\Downloads\O365ProPlusRetail.img" del "%userprofile%\Downloads\O365ProPlusRetail.img" /f > nul
if exist "%userprofile%\Downloads\TeamViewer_Setup.exe" del "%userprofile%\Downloads\TeamViewer_Setup.exe" /f > nul
if exist "%userprofile%\Downloads\TeamViewer_Setup_x64.exe" del "%userprofile%\Downloads\TeamViewer_Setup_x64.exe" /f > nul
if exist "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X86_Setup.exe" del "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X86_Setup.exe" /f > nul
if exist "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X64_Setup.exe" del "%userprofile%\Downloads\UltraVNC_%UltraVNCVersion%_X64_Setup.exe" /f > nul
if exist "%userprofile%\Downloads\ua-client.windows.exe" del "%userprofile%\Downloads\ua-client.windows.exe" /f > nul
if exist "%userprofile%\Downloads\VC_redist.x86.exe" del "%userprofile%\Downloads\VC_redist.x86.exe" /f > nul
if exist "%userprofile%\Downloads\VC_redist.x64.exe" del "%userprofile%\Downloads\VC_redist.x64.exe" /f > nul
if exist "%userprofile%\Downloads\winrar-x32-%WinRARVersion%.exe" del "%userprofile%\Downloads\winrar-x32-%WinRARVersion%.exe" /f > nul
if exist "%userprofile%\Downloads\winrar-x64-%WinRARVersion%.exe" del "%userprofile%\Downloads\winrar-x64-%WinRARVersion%.exe" /f > nul

taskkill /f /im msedge* 1>nul 2>nul
if exist "c:\config\log.txt" notepad "c:\config\log.txt"
if exist "c:\config\log.txt" del /s /q "c:\config\log.txt" > nul

goto fim

:fim
echo 浜様様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩桎烝烝烝烝烝烝烝烝烝烝烝烝栩栩栩栩栩�
echo 裁栩栩栩栩� JERBINHO DO WHATERZAPER 栩栩栩栩栩�
echo 裁栩栩栩栩桀樛樛樛樛樛樛樛樛樛樛樛樛栩栩栩栩栩�
echo 藩様様様様様様様様様様様様様様様様様様様様様様�
%SYSTEMROOT%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
pause
exit
