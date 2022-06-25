@echo off
rem ================================================================
rem Esse script altera o arquivo "astraia.exe.properties"
rem das pastas:
rem "C:\Program Files (x86)\Astraia\Obgyn\.astraia"
rem "C:\Program Files (x86)\Astraia\.astraia" 
rem por outro arquivo definido anteriormente.
rem ================================================================
rem Update: 04/12/2018 - Guilherme Santos
rem Criado o script

rem Modo de utilização deste script:
rem 1) Este script será inserido no script de logon do setor de T.I.
rem 2) Vá até o computador das salas de US e logue como um usuário do setor de T.I.
rem 3) O AD deverá entrar nas pastas do Astraia, fazer backup do arquivo de configuração e jogar o arquivo atualizado. Feito isso, todo o processo deverá ser registrado em um .log.
rem 4) Abra o astraia no computador de Ultrassom e verifique se o Astraia está funcionando.
rem 5) Desligue o computador.
rem 6) Desative o script no script de logon.

rem SETANDO VARIAVEIS
set ASTRAIA_OB="%programfiles(x86)%\Astraia\Obgyn\.astraia"
set ASTRAIA_DIR="%programfiles(x86)%\Astraia\.astraia"
set ASTRAIA_ARQ=astraia.exe.properties
set PASTAPUBLICA="\\192.168.5.250\Setores\Publico\#SCRIPTS"


rem 1) Exclue qualquer mapeamento da unidade Z:/;
echo Excluindo qualquer mapeamento na Unidade Z:...
net use Z: /delete /yes
ping -n 5 127.0.0.1 > nul
cls


rem 2) Mapeia a pasta de origem, como unidade Z:/;
echo Mapeando a Unidade Z: temporariamente...
net use Z: %PASTAPUBLICA%
rem Aguarda 5 segundos...
ping -n 5 127.0.0.1 > nul
cls



		echo Verificando se existe o diretorio %ASTRAIA_OB% no disco C...
			IF EXIST %ASTRAIA_OB% (
				rem criando o backup
				rename %ASTRAIA_OB%\%ASTRAIA_ARQ% %ASTRAIA_ARQ%_old
				rem copiando o arquivo atualizado da pasta publica e registrando no log
				echo "%computername% | %date% | %time%" %ASTRAIA_OB% >> %PASTAPUBLICA%\%ASTRAIA_ARQ%.log
				COPY Z:\%ASTRAIA_ARQ% /y %ASTRAIA_OB% >> %PASTAPUBLICA%\%ASTRAIA_ARQ%.log
		)
		ping -n 5 127.0.0.1 > nul

		echo Verificando se existe o diretorio %ASTRAIA_DIR% no disco C...
			IF EXIST %ASTRAIA_DIR% (
				rem criando o backup
				rename %ASTRAIA_DIR%\%ASTRAIA_ARQ% %ASTRAIA_ARQ%_old
				rem copiando o arquivo atualizado da pasta publica e registrando no log
				echo "%computername% | %date% | %time%" %ASTRAIA_DIR% >> %PASTAPUBLICA%\%ASTRAIA_ARQ%.log
				COPY Z:\%ASTRAIA_ARQ% /y %ASTRAIA_DIR% >> %PASTAPUBLICA%\%ASTRAIA_ARQ%.log
		)
		ping -n 5 127.0.0.1 > nul



rem Exclue o mapeamento da unidade Z:/ da pasta na máquina destino;
echo Excluindo o mapeamento da Unidade Z:...
ping -n 5 127.0.0.1 > nul
net use Z: /delete /yes
cls


cd %programfiles(x86)%\Astraia\
start astraia.exe
pause