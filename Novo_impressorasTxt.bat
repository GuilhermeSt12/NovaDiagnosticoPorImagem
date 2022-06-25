@echo off
rem ================================================================
rem  Esse script altera o arquivo impressoras.txt da unidade C por um arquivo definido anteriormente.
rem ================================================================
rem Update: 14/11/2018 - Guilherme Santos
rem Criado o script


rem cria um backup txt atual
echo Criando backup do impressoras.txt...
cd c:
rename c:\impressoras.txt impressoras_old.txt
ping -n 5 127.0.0.1 > nul
cls

rem 1) Exclue qualquer mapeamento da unidade Z:/;
echo Excluindo qualquer mapeamento na Unidade Z:...
net use Z: /delete /yes
ping -n 5 127.0.0.1 > nul
cls

rem 2) Mapeia a pasta de origem, como unidade Z:/;
echo Mapeando a Unidade Z: temporariamente...
net use Z: \\192.168.5.250\Setores\Publico\#SCRIPTS
rem Aguarda 5 segundos...
ping -n 5 127.0.0.1 > nul
cls

rem inserir o txt novo na unidade C e no appdata
echo Copiando o impressoras.txt para a Unidade C...
COPY Z:\impressoras.txt /y c:\
ping -n 5 127.0.0.1 > nul
cls

echo Verificando se existe o impressoras.txt no Virtual Store...
IF EXIST "C:\Users\%username%\AppData\Local\VirtualStore\impressoras.txt" (
		rename C:\Users\%username%\AppData\Local\VirtualStore\impressoras.txt impressoras_old.txt
		COPY Z:\impressoras.txt /y C:\Users\%username%\AppData\Local\VirtualStore\
		
) 
ping -n 5 127.0.0.1 > nul
cls

rem Exclue o mapeamento da unidade Z:/ da pasta na máquina destino;
echo Excluindo o mapeamento da Unidade Z:...
ping -n 5 127.0.0.1 > nul
net use Z: /delete /yes
cls