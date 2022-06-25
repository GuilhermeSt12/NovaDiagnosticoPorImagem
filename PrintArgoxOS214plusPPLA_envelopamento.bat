@echo off
rem PrintArgoxOS214plusPPLA_envelopamento

rem Update: 04/07/2019, por Guilherme Santos
rem Esse script mapeia as impressoras de rede de modelo ARGOX que são compartilhadas via USB em suas respectivas máquinas de origem. 
rem Script criado.

@echo "Adicionando impressora: \\MONTUS-01\Argox OS-214 plus PPLA"
rundll32 printui.dll PrintUIEntry /in /n "\\MONTUS-01\Argox OS-214 plus PPLA"