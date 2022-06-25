rem ================================================================
rem  Limpando a pasta "Scanner" do setor de Guias
rem ================================================================
rem Update: 05/09/2018 - Guilherme Santos > A linha a seguir foi alterada:
rem >>del /f /q %DiretorioArquivos%\*.dmp 
rem foi alterada por esta:
rem >>MOVE /Y "%DiretorioArquivos%\*.dmp" "%DiretorioArquivosDestino%\"
rem ================================================================
rem Update: 03/09/2018 - Guilherme Santos > Criado o script 
rem ================================================================

rem setando variaveis
set DiretorioArquivos="\\srv-arquivos1\FS\MATRIZ\GUIAS\scanner"
set DiretorioArquivosDestino="\\srv-arquivos1\FS\MATRIZ\GUIAS\scanner\antigos\%date:~6,10%\%date:~3,2%\%date:~0,2%

IF not exist %DiretorioArquivos%\%date:~0,2%-%date:~3,2%-%date:~6,10%.dmp (
@echo Primeira execucao do dia
@echo Limpando arquivos .JPG, .TIF e PDF da pasta Scanner.
@echo Aguarde ...

rem cria a pasta aonde os arquivos serao movidos, separada por ano/mes
mkdir %DiretorioArquivosDestino%
rem move os arquivos para sua respectiva pasta do ano/mes
MOVE /Y "%DiretorioArquivos%\*.jpg" "%DiretorioArquivosDestino%\"
MOVE /Y "%DiretorioArquivos%\*.tif" "%DiretorioArquivosDestino%\"
MOVE /Y "%DiretorioArquivos%\*.pdf" "%DiretorioArquivosDestino%\"
MOVE /Y "%DiretorioArquivos%\*.dmp" "%DiretorioArquivosDestino%\"
rem cria o arquivo temporario do dia
dir . > %date:~0,2%-%date:~3,2%-%date:~6,10%.dmp
)