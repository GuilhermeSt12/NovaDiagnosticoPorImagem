@echo off
rem ================================================================
rem  Restaurando backup dos favoritos do Mozilla Firefox v61 / v53
rem ================================================================
rem Update: 11/08/2018 - Guilherme Santos
rem Adicionada a compatibilidade com a v53

rem Update: 06/08/2018
rem Criado o script
IF EXIST "C:\Users\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\" (
		goto :PastaEncontrada
) ELSE (
		goto :PastaNaoEncontrada
)
:PastaEncontrada
cls
	rem azul
	COLOR 9F
		echo Restaurando o backup do Firefox...
		rem restaurando o backup dos favoritos da pasta do usuario para a pasta local do firefox
		cd "%AppData%\Mozilla\Firefox\Profiles\*default*\"
		COPY /Y "\\wolverine\usuarios\%username%\favoritos_firefox\*.*"
		GOTO fim
:PastaNaoEncontrada
cls
	echo A pasta do Mozilla Firefox nao foi encontrada!
	GOTO fim
:fim