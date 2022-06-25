
rem ===================
rem  Salva as notinhas
rem ===================
taskkill /IM StikyNot.exe
COPY /Y "%AppData%\Microsoft\Sticky Notes\StickyNotes.snt" "\\srv-arquivos1\usuarios$\%username%\notas\StickyNotes.snt"