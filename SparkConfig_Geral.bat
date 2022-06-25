@echo off
rem UnimedRecepcaoPrincipalFinger

rem Update: 26/07/2019
rem Foi criado este script.
rem O intuito deste script se d� em realizar o backup das configura��es do SPARK e em seguida aplicar as novas configura��es do mesmo


IF NOT EXIST "%appdata%\Spark\spark.properties_backup" (
	rem Faz o backup do arquivo antigo
	ren "%appdata%\Spark\spark.properties" "spark.properties_backup"
	rem Substitui o arquivo antigo pelo padr�o
	COPY /Y "\\wolverine\setores\publico\#SCRIPTS\TodosOsSetores\spark.properties" "%appdata%\Spark\"
) 

rem Aguarda 2 segundos... 
ping -n 2 127.0.0.1 >nul