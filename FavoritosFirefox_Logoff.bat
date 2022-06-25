@echo off
rem ================================================================
rem  Fazendo backup dos favoritos do Mozilla Firefox v61 / v53
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
		echo Localizando 'places.sqlite'...
		cd "%AppData%\Mozilla\Firefox\Profiles\*default*"
			rem se não existir a pasta "favoritos_firefox" na pasta do usuário, cria-la.
			IF NOT EXIST "\\wolverine\usuarios\%username%\favoritos_firefox\" (
			mkdir "\\wolverine\usuarios\%username%\favoritos_firefox"
			)
		echo Copiando o 'places.sqlite' para a pasta do usuario...
		COPY /Y places.sqlite "\\wolverine\usuarios\%username%\favoritos_firefox\"
		GOTO fim
:PastaNaoEncontrada
cls
rem letra vermelha
COLOR 5D
	echo A pasta do Mozilla Firefox nao foi encontrada!
	GOTO fim
:fim