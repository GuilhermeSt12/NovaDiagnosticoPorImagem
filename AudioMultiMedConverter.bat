@echo off
rem AudioMultiMedConverter

rem Na pasta do Multimed em nosso servidor existe muitos arquivos de audio que não são mais utilizados, ocupando espaço desnecessário. Este script tem por principal objetivo
rem coletar TODOS os nomes desses arquivos e inserí-los em um arquivo de menor tamanho em uma outra pasta.
rem Update: 14/06/2019
rem Criado o Script.

rem Pasta onde estão os arquivos que serão convertidos.
set minhaPasta=C:\#Scripts\assinaturas_gui\

rem Pasta onde os arquivos convertidos serão copiados, tem que ter a barra no final "\".
set pastaDestino=C:\#Scripts\assinaturas_gui\teste\

rem Extensão dos arquivos que queremos colocar nos arquivos convertidos.
set tipo=

rem Arquivo txt que o processo vai ler com o nome dos arquivos.
set meuArquivo=C:\#Scripts\assinaturas_gui\teste\#NOMES.txt




rem Inicio da verificação.
IF EXIST "%meuArquivo%" (
	echo == Ja existe um arquivo com os nomes, IREMOS UTILIZA-LO. ==
    pause
) ELSE (
    echo == Nao existe nenhum arquivo "#NOMES.TXT", iremos cria-lo e utiliza-lo. ==
    pause
	cd %minhaPasta%
    dir /b > %pastaDestino%#NOMES.txt
    echo == Arquivo "#NOMES.txt" criado com sucesso. ==
    cls
    pause
)

for /F "tokens=*" %%A in (%meuArquivo%) do (
    echo > %pastaDestino%%%A%tipo%
    )

)
rem Somente para ver o resultado da cópia dos arquivos, se não quiser remova.

echo == FIM ==
pause