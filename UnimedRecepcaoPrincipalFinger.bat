@echo off
rem UnimedRecepcaoPrincipalFinger

rem Update: 08/07/2019
rem Foi criado este script.
rem O intuito deste script é configurar o JAVA para o finger da UNIMED para todos os usuários/guichês da recepção principal.

rem ===================================
rem  Configurando o JAVA para UNIMED
rem ===================================

IF NOT EXIST "%systemdrive%\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security_bak" (
	echo Configurando o Java para a UNIMED...
	ren %systemdrive%\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security security_bak
	mkdir "%systemdrive%\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security"
	COPY /Y "\\srv-arquivos1\FS\MATRIZ\PUBLICO\#SCRIPTS\recepcaoprincipal\java-unimed\security\*.*" "%systemdrive%\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security\"
	echo ===================
	echo Unimed configurada!
	echo ===================
) ELSE (
		echo ======================
		echo Unimed ja configurada!
		echo ======================
)

rem Aguarda 2 segundos... 
ping -n 2 127.0.0.1 >nul