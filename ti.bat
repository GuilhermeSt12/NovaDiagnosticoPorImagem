@echo off

rem setando as variaveis
set pasta_usuario_srv = srv-arquivos1\usuarios$\%username%

rem ==================================================
rem Restaurando StickyNotes Pessoais
rem Editado 08/07/2019 às 18:33 por Guilherme Santos
rem ==================================================
echo Iniciando backup das notinhas...
call \\SRV-DC00\c$\Windows\SYSVOL\domain\scripts\Logon\StickNotesRestore_Logon.bat

cls

rem ==================================================
rem Script para fazer backup do Spark (Mensal)
rem Editado 24/02/2018 às 11:56 por Guilherme Santos
rem ==================================================
echo Iniciando backup do Spark...
call \\SRV-DC00\c$\Windows\SYSVOL\domain\scripts\Logon\SparkHistoryBackup.bat

cls

rem ==================================================
rem Script para verificar se existe o atalho padrao da UNIMED no Internet Explorer.
rem Editado 04/08/2018 às 09.43 por Guilherme Santos e Lohan Serpa
rem ==================================================

rem Se não tiver a pasta favoritos_ie na pasta do usuario, ele irá criá-la copiando os favoritos padrões.
	if not exist "\\%pasta_usuario_srv%\favoritos_ie\" (
	mkdir "\\%pasta_usuario_srv%\favoritos_ie
	rem copia da pasta do Publico, os favoritos para a pasta do AD do Windows
	COPY /Y "\\srv-arquivos1\FS\MATRIZ\PUBLICO\#SCRIPTS\favoritos_ie\*.*" "\\%pasta_usuario_srv%\favoritos_ie\"
	del /q /f "%userprofile%\Favorites\Links\"
	rem copia da pasta do usuario do AD os favoritos para a pasta local do windows
	COPY /Y "\\%pasta_usuario_srv%\favoritos_ie\*.*" "%userprofile%\Favorites\Links\"
             ) else ( 
		rem se existir a pasta favoritos_ie na pasta do usuario, ele ira traze-la para os favoritos na pasta local do windows
		COPY /Y "\\%pasta_usuario_srv%\favoritos_ie\*.*" "%userprofile%\Favorites\Links\"
)


cls

rem ================================================================
rem  Coletando informacoes da maquina
rem ================================================================
echo Coletando informacoes da maquina...
call \\SRV-DC00\c$\Windows\SYSVOL\domain\scripts\Logon\ComputersInfo.bat

cls


rem ==================================================
rem Script para fazer backup das configurações Spark e também restaurar sua configuração
rem Editado 26/07/2019 às 19:35 por Guilherme Santos
rem ==================================================
echo Iniciando backup das configuracoes do Spark...
call \\SRV-DC00\c$\Windows\SYSVOL\domain\scripts\Logon\SparkConfig_Geral.bat

cls