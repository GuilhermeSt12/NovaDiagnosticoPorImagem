@echo off

rem ================================================================
rem  Coletando informacoes da maquina
rem ================================================================
rem Update: 26/01/2019 - Guilherme Santos
rem Adicionado informacoes do HD e Saude dele, Sistema Operacional, Service Pack e Arquitetura.
rem Update: 20/08/2018 - Guilherme Santos
rem Criado o script

rem documentacao for: http://batchscript.blogspot.com/2012/12/aprenda-o-for-de-uma-vez-por-todas.html

rem Local aonde serao enviados os arquivos com as informacoes coletadas.
rem O arquivo tera o nome da maquina local, esta, que está enviando as informacoes.
set ArquivoSaida="\\srv-arquivos1\FS\MATRIZ\PUBLICO\#SCRIPTS\ComputersInfo\%computername%.txt"

rem se ja existir algum arquivo de mesmo nome, remova-o. Desta forma, o arquivo estará sempre atualizado com a ultima versao.
if exist %ArquivoSaida% del %ArquivoSaida%

rem coleta as informacoes da maquina local via WMIC e armazeno em uma variavel
echo Coletando dados sobre o Nome da maquina...
for /f "delims== tokens=2" %%i in ('wmic CPU get SystemName /value') do SET NomeMaquina=%%i
echo Coletando dados sobre a Marca...
for /f "delims== tokens=2" %%i in ('wmic computersystem get Manufacturer /value') do SET Marca=%%i
echo Coletando dados sobre o Modelo...
for /f "delims== tokens=2" %%i in ('wmic computersystem get Model /value') do SET Modelo=%%i
echo Coletando dados sobre o Processador...
for /f "delims== tokens=2" %%i in ('wmic cpu get Name /value') do SET Processador=%%i
echo Coletando dados sobre a Memoria...
for /f "delims== tokens=2" %%i in ('wmic computersystem get TotalPhysicalMemory /value') do SET Memoria=%%i
echo Coletando dados sobre o Sistema Operacional...
for /f "delims== tokens=2" %%i in ('wmic os get Caption /value') do SET Os=%%i
echo Coletando dados sobre o Service Pack...
for /f "delims== tokens=2" %%i in ('wmic os get csdversion /value') do SET ServicePack=%%i
echo Coletando dados sobre a Arquitetura...
for /f "delims== tokens=2" %%i in ('wmic os get osarchitecture /value') do SET Arquitetura=%%i


rem guarda as informacoes no arquivo de saida
echo Nome da Maquina: %NomeMaquina% >> %ArquivoSaida%
echo Marca: %Marca% >> %ArquivoSaida%
echo Modelo: %Modelo% >> %ArquivoSaida%
echo Processador: %Processador% >> %ArquivoSaida%
echo Memoria: %Memoria% >> %ArquivoSaida%
echo OS: %Os% >> %ArquivoSaida%
echo Service Pack: %ServicePack% >> %ArquivoSaida%
echo Arquitetura: %Arquitetura% >> %ArquivoSaida%
echo HD: >> %ArquivoSaida%

rem Coletando dados do HD
echo Coletando dados sobre O HD...
for /f "delims== tokens=2" %%i in ('wmic diskdrive list brief /format:list') do echo %%i >> %ArquivoSaida%
rem WMIC LOGICALDISK GET Name,Size,FreeSpace | find /i "C:"

echo Saude do(s) HD(s): >> %ArquivoSaida%
for /f "delims== tokens=2" %%i in ('wmic diskdrive get status /format:list') do echo %%i >> %ArquivoSaida%

rem Coletando dados da Rede
echo Coletando dados sobre a(s) Placa(s) de Rede...
ipconfig /all >> %ArquivoSaida%

echo Coleta OK.