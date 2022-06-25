@echo off
rem UnimedRecepcaoPrincipalFinger

rem Update: 26/07/2019
rem Foi criado este script.
rem O intuito deste script se dá em realizar o backup das configurações do SPARK e em seguida aplicar as novas configurações do mesmo


IF NOT EXIST "%appdata%\Spark\spark.properties_backup" (
	rem Faz o backup do arquivo antigo
	ren "%appdata%\Spark\spark.properties" "spark.properties_backup"
	rem Substitui o arquivo antigo pelo padrão
	COPY /Y "\\wolverine\setores\publico\#SCRIPTS\TodosOsSetores\spark.properties" "%appdata%\Spark\"
) 

rem Aguarda 2 segundos... 
ping -n 2 127.0.0.1 >nul