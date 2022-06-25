@echo off

rem ================================================================
rem  Salva os favoritos do Internet Explorer, na barra de favoritos
rem ================================================================
rem copia os favoritos atuais para a pasta "favoritos_ie", dentro da pasta do usuario
del /q /f "\\srv-arquivos1\usuarios$\%username%\favoritos_ie\"
COPY /Y "%userprofile%\Favorites\Links\*.*" "\\srv-arquivos1\usuarios$\%username%\favoritos_ie\"