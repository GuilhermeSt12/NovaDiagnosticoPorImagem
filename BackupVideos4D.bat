@echo off
rem Update: 27/06/2019 por Guilherme Santos
rem Incluído o mapeamento do usuário "balcaous".
rem Update: 13/07/2018 por Guilherme Santos


rem =====================================
rem 1. Aqui eu coleto a data e a hora atual.
rem =====================================
FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (
set DIA=%%a
set MES=%%b
set ANO=%%c
)
FOR /F "tokens=1,2,3 delims=:, " %%a in ("%TIME%") do (
set H=%%a
set M=%%b
set S=%%c
)
set H=0%H%
set H=%H:~-2%
set FORMATO=%ANO%%MES%%DIA%_%H%_%M%_%S%_userBackup

rem =====================================
rem 2. Salva o dia e horário do backup no LOG
rem =====================================
echo Tentativa de backup realizada dia %dia%-%mes%-%ano% as %H%:%M%:%S% >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"

rem =====================================
rem 3. Inicio do Script de backup
rem =====================================

rem 1) Exclue qualquer mapeamento na unidade Z: e Y:/;
echo Excluindo qualquer mapeamento na Unidade Z:...
net use Z: /delete /yes
echo Excluindo qualquer mapeamento na Unidade Y:...
net use Y: /delete /yes
rem pause


rem 2) Mapeia as pastas de origem, como unidade Z:/ e Y:;
echo Mapeando a Unidade Z:...
net use Z: \\192.168.5.176\c$\Users\balcaous2\Videos
rem Aguarda 5 segundos...
ping -n 5 127.0.0.1 > nul
echo Mapeando a Unidade Y:...
net use Y: \\192.168.5.176\c$\Users\balcaous\Videos
rem Aguarda 5 segundos...
ping -n 5 127.0.0.1 > nul

rem pause
cls

rem 3) Realiza a copia do conteudo da pasta de origem -> para a pasta de destino e a insere no log;
echo Copiando arquivos...
xcopy Z:\*.* /y "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\" >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"
xcopy Y:\*.* /y "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\" >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"
rem pause
cls

rem 4) Move o conte�do rec�m-copiado para a pasta de Backup local <oculta> na m�quina de origem e a insere no log;
echo Movendo arquivos...
move /Y Z:\*.* Z:\videos_antigos >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"
move /Y Y:\*.* Z:\videos_antigos >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"
echo .. >> "E:\[BACKUP] Gravacoes Dr. Eduardo Fonseca\Videos4DHistoryBackup_Log.txt"
rem pause
cls

rem 5) Exclue o mapeamento da unidade Z:/ da pasta na m�quina destino;
echo Excluindo o mapeamento da Unidade Z: e Y:...
net use Z: /delete /yes
net use Y: /delete /yes
rem pause
cls