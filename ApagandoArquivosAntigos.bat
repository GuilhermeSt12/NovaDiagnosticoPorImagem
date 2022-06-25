@echo off
rem UnimedRecepcaoPrincipalFinger

rem Update: 26/07/2019
rem Foi criado este script.
rem O intuito deste script se d� em realizar o backup das configura��es do SPARK e em seguida aplicar as novas configura��es do mesmo

rem 'Variaveis de Data
FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (
set DIA=%%a
set MES=%%b
set ANO=%%c
)

rem /S – Inclui sub diretórios
rem /P D:\Teste\ – Diretório que será analisado
rem /d -20 – Quantidade de dias que deverá ser analisado
rem Filtro por extensão – /M *.pdf
rem Arquivo de log – > D:\Teste\%nowDay%.log – Diretório do log

rem Lista em log os arquivos encontrados
    FORFILES /S /p C:\Users\guilherme\Desktop\Teste\ /d -7 /c "CMD /C echo @FILE @FDATE" > C:\Users\guilherme\Desktop\%ANO%%MES%%DIA%.log

rem Remove os arquivos encontrado
    FORFILES /S /p C:\Users\guilherme\Desktop\Teste\ /d -7 /c "CMD /C DEL @FILE /Q"