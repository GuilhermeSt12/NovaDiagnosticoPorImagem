@echo off
rem ErgoPetBackups

rem Update: 29/12/2020, por Guilherme Santos
rem A unidade de backup (F:) irá apenas manter os backups criados nos últimos 5 dias para evitar uma possível falta de armazenamento na unidade.

rem Update: 23/07/2020, por Guilherme Santos
rem A unidade de backup (F:) irá apenas manter os backups criados nos últimos 15 dias para evitar uma possível falta de armazenamento na unidade.

rem Update: 25/03/2020, por Guilherme Santos e Lohan Serpa
rem A unidade de backup (F:) irá apenas manter os backups criados nos últimos 30 dias para evitar uma possível falta de armazenamento na unidade.
rem Incluida a verificacao do backup diario, o que evita que o mesmo seja feito mais de uma vez/dia.

rem Update: 27/06/2019, por Guilherme Santos
rem Corrigido alguns erros de sintaxe no código.
rem O código deixou de ser executado mensalmente para diariamente, quando o computador estiver ocioso por mais de 5h.

rem Update: 22/12/2018, por Guilherme Santos
rem Script criado.

rem seta as variaveis
set DIA=%date:~0,2%
set MES=%date:~3,2%
set ANO=%date:~6,10%

rem =====================================
rem Cria a pasta "ErgoCardioBackups" na pasta da Unidade "G", CASO ela não exista.
rem =====================================
IF NOT EXIST "g:\ErgoPetBackups\" (
		echo Criando a pasta de Backup...
		mkdir "g:\ErgoPetBackups\"
) ELSE (
echo ...
		echo Pasta de Backup ja existe...)
echo ...

rem =====================================
rem Aqui iremos verificar se existe algum backup feito no dia atual.
rem =====================================

	rem quero que ele procure em g:\ErgoPetBackups 
	rem -s (inclui subpastas)
	rem -d -15 (eu quero qualquer coisa com mais de X dias de idade:)
	rem -m *.FDB (só quero apagar os arquivos que terminam com .FDB)
	rem -c "cmd /c del /f /q @path" (E, finalmente, o comando que desejo executar nos arquivos encontrados, no caso é o DEL)
	forfiles -p "g:\ErgoPetBackups" -d -5 -m *.FDB -c "cmd /c del /f /q @path"
	
IF EXIST "g:\ErgoPetBackups\%ANO%%MES%%DIA%_ERGOPC13.FDB" (
		echo Ja foi realizado backup hoje %dia%-%mes%-%ano%, as %TIME% nova tentativa cancelada. >> g:\ErgoPetBackups\ErgoPetBackups_Log.txt
	) ELSE (
	echo Backup INICIADO dia %dia%-%mes%-%ano% as %TIME% ... >> g:\ErgoPetBackups\ErgoPetBackups_Log.txt
	xcopy /d /y /s "C:\Program Files (x86)\Micromed\ErgoPC\DB\ERGOPC13.FDB" g:\ErgoPetBackups\
	rename g:\ErgoPetBackups\ERGOPC13.FDB %ANO%%MES%%DIA%_ERGOPC13.FDB
	rem Salva o dia e horario do backup no LOG, esta linha vem acrescentado um OK, o que informa no LOG que neste dia o backup foi feito
	echo 	Backup CONCLUIDO dia %dia%-%mes%-%ano% as %TIME% ... >> g:\ErgoPetBackups\ErgoPetBackups_Log.txt
	echo ...)


rem =====================================
rem Aguarda 5 segundos...
rem =====================================
ping -n 5 127.0.0.1 > nul