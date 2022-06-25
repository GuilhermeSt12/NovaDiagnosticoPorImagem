@echo off
rem ErgoCardioBackups

rem Update: 27/06/2019, por Guilherme Santos
rem Corrigido alguns erros de sintaxe no c�digo.
rem O c�digo deixou de ser executado mensalmente para diariamente, quando o computador estiver ocioso por mais de 5h. 

rem Update: 22/12/2018
rem Script criado.

rem seta as variaveis
set DIA=%date:~0,2%
set MES=%date:~3,2%
set ANO=%date:~6,10%

rem =====================================
rem Cria a pasta "ErgoCardioBackups" na pasta da Unidade "F", CASO ela n�o exista.
rem =====================================
IF NOT EXIST "f:\ErgoCardioBackups\" (
	pause
		echo Criando a pasta de Backup...
		mkdir "f:\ErgoCardioBackups\"
) ELSE (
echo ...
		echo Pasta de Backup ja existe...)
echo ...

rem =====================================
rem Aqui iremos verificar se existe algum backup feito no dia atual.
rem =====================================

	echo Fazendo backup diario...
	mkdir "f:\ErgoCardioBackups\%ANO%%MES%%DIA%_ErgoCardioBackups"
	echo Backup INICIADO dia %dia%-%mes%-%ano% as %TIME% ... >> f:\ErgoCardioBackups\ErgoCardioBackups_Log.txt
	xcopy /d /y /s "C:\Program Files (x86)\Micromed\ErgoPC\DB\*.*" f:\ErgoCardioBackups\%ANO%%MES%%DIA%_ErgoCardioBackups\
	rem Salva o dia e horário do backup no LOG, esta linha vem acrescentado um OK, o que informa no LOG que neste dia o backup foi feito
	echo 	Backup CONCLUIDO dia %dia%-%mes%-%ano% as %TIME% ... >> f:\ErgoCardioBackups\ErgoCardioBackups_Log.txt
	echo ...)

rem =====================================
rem Aguarda 5 segundos...
rem =====================================
ping -n 5 127.0.0.1 > nul