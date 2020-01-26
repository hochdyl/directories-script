@ECHO OFF


set fichierlogsdone=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\done-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt


echo Voulez-vous vraiment effacer les repertoires dans Users ?
pause 


FOR /D %%f in (Users\*) DO (
del /q %%f
rd /S /Q %%f
)


IF NOT EXIST Logs\%date:~6,4%-%date:~3,2%-%date:~0,2% (
  md Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%
)


echo ===%date:~0,2%-%date:~3,2%-%date:~6,4%===%time:~0,2%:%time:~3,2%:%time:~6,2%=== >> %fichierlogsdone%
echo Repertoire 'Users' effacer le %date:~0,2%-%date:~3,2%-%date:~6,4% a %time:~0,2%:%time:~3,2%:%time:~6,2% >> %fichierlogsdone%
echo ===============FIN LOGS=============== >> %fichierlogsdone%


echo =================================
echo Les utilisateurs ont bien ete supprimes

pause

