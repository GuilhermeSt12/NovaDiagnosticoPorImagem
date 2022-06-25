@echo off
rem ================================================================
rem  Criando log do backup das USs
rem  Este script DEVE ser executado dentro da pasta do backup das máquinas VOLUSON, para gerar seu relatório em .txt.
rem ================================================================
rem Update: 22/08/2018 - Guilherme Santos
rem Criado o script

set /p NomeTxt=Digite o nome do arquivo de saida: 

dir > ..\%NomeTxt%.txt