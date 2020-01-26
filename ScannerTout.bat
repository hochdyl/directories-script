@ECHO OFF
REM    Scan de toutes les classes dans le fichier DB CLASSES


IF NOT EXIST Logs (
  echo Erreur 10 : Repertoire 'Logs' manquant
  md Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%
  echo Repertoire 'Logs' cree
  pause
)

IF NOT EXIST Logs\%date:~6,4%-%date:~3,2%-%date:~0,2% (
  md Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%
)

echo =====%date:~0,2%-%date:~3,2%-%date:~6,4%=%time:~0,2%:%time:~3,2%:%time:~6,2%===== >> Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\done-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt
echo =====%date:~0,2%-%date:~3,2%-%date:~6,4%=%time:~0,2%:%time:~3,2%:%time:~6,2%===== >> Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\fail-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt


set fichierlogsdone=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\done-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt
set fichierlogsfail=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\fail-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt


IF NOT EXIST Sous-Programmes (
  echo Erreur 06 : Repertoire 'Sous-Programmes' manquant
  echo Erreur 06 : Repertoire 'Sous-Programmes' manquant >> %fichierlogsfail%
  md Sous-Programmes
  echo Repertoire 'Sous-Programmes' cree
  echo Repertoire 'Sous-Programmes' cree >> %fichierlogsdone%
  pause
)

IF NOT EXIST DB (
  echo Erreur 07 : Repertoire 'DB' manquant
  echo Erreur 07 : Repertoire 'DB' manquant >> %fichierlogsfail%
  md DB
  echo Repertoire 'DB' cree
  echo Repertoire 'DB' cree >> %fichierlogsdone%
  pause
)

IF NOT EXIST Users (
  echo Erreur 08 : Repertoire 'Users' manquant
  echo Erreur 08 : Repertoire 'Users' manquant >> %fichierlogsfail%
  md Users
  echo Repertoire 'Users' cree
  echo Repertoire 'Users' cree >> %fichierlogsdone%
  pause
)

IF NOT EXIST DB\Classes.txt (
  echo Erreur 01 : Fichier DB 'Classes' manquant
  echo Erreur 01 : Fichier DB 'Classes' manquant >> %fichierlogsfail%
  echo.>"DB\Classes.txt"
  echo Fichier DB Classes.txt cree
  echo Fichier DB Classes.txt cree >> %fichierlogsdone%
  pause
)

IF NOT EXIST Sous-Programmes\CreerCompte.bat (
  echo Erreur fatale 03 : Sous-progamme 'CreerCompte' manquant
  echo Erreur fatale 03 : Sous-progamme 'CreerCompte' manquant >> %fichierlogsfail%
  GOTO EOF
)

IF NOT EXIST Sous-Programmes\ScannerClasse.bat (
  echo Erreur fatale 04 : Sous-progamme 'ScannerClasse' manquant
  echo Erreur fatale 04 : Sous-progamme 'ScannerClasse' manquant >> %fichierlogsfail%
  GOTO EOF
)


CALL :verifVide DB\Classes.txt
:verifVide
if %~z1 == 0 (
  echo Erreur fatale 09 : Le fichier DB 'Classes' est vide
  echo Erreur fatale 09 : Le fichier DB 'Classes' est vide >> %fichierlogsfail%
  GOTO EOF
)


FOR /f "delims=; tokens=1" %%m in (DB\Classes.txt) do (
  echo Classe trouvee : %%m
)

echo Voulez vous lancer le scan ?
pause

echo Debut du scan

FOR /f "delims=; tokens=1" %%m in (DB\Classes.txt) do (
  CALL Sous-Programmes\ScannerClasse %%m 
)


echo =================================
echo Scan termine


:EOF
echo ===============FIN LOGS=============== >> %fichierlogsdone%
echo ===============FIN LOGS=============== >> %fichierlogsfail%


pause