@echo off
rem StickNotesBackup_Logon

rem Update: 20/08/2019
rem Foi criado este script.
rem Alterado o local do servidor de arquivos. De Wolverine para SRV-ARQUIVOS1

rem Update: 08/07/2019
rem Foi criado este script.
rem O intuito dele é fazer o backup das notinhas pessoais dos usuários no Logoff e no Logon, recuperá-las.

rem ===================================
rem   Restaurando StickyNotes Pessoais
rem ===================================
rem mata o processo das notinhas;
	taskkill /IM StikyNot.exe

rem ##Cria a pasta do Sticky Notes na pasta do AppData, se for o primeiro acesso do usuario.
IF NOT EXIST "%AppData%\Microsoft\Sticky Notes" (
		echo Criando a pasta Stick Notes no appdata do usuario...
		mkdir "%AppData%\Microsoft\Sticky Notes"
		echo ...
) ELSE (
		echo Pasta "Stick notes" ja existe...)
		echo ...

rem ##Cria a pasta do Sticky Notes na pasta do pessoal do usuário, CASO ela não exista.
IF NOT EXIST "\\srv-arquivos1\usuarios$\%username%\notas" (
		echo Criando a pasta NOTAS na pasta pessoal...
		mkdir "\\srv-arquivos1\usuarios$\%username%\notas"
		echo ...
) ELSE (
		echo Pasta "NOTAS" ja existe...)
		echo ...

rem Copia as notinhas da pasta pessoal do usuário para a pasta APPDATA do mesmo
echo Copiando as notinhas para a pasta APPDATA...
COPY /Y "\\srv-arquivos1\usuarios$\%username%\notas\stickynotes.snt" "%AppData%\Microsoft\Sticky Notes\"
echo ...

rem Aguarda 1 segundo... 
ping -n 1 127.0.0.1 >nul