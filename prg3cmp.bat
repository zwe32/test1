echo off
set sascmd1="C:\Program Files\SASHome\x86\SASFoundation\9.3\sas.exe" 
set sascfg1 = -CONFIG "C:\Program Files\SASHome\x86\SASFoundation\9.3\nls\en\sasv9.cfg"
set prog=p301a01c

%sascmd1% %prog%.sas %sascfg1%
FindStr "time" %prog%.log > tf

:: Get the number of lines in the file
set LINES=0
for /f "delims==" %%I in (tf) do (
    set /a LINES=LINES+1
)

:: Print the last 10 lines (suggestion to use more courtsey of dmityugov)
set /a LINES=LINES-3
more +%LINES% < tf

