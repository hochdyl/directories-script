@ECHO OFF
REM    Scan de tout les eleves dans le classe recu en parametre


set fichierlogsdone=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\done-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt
set fichierlogsfail=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\fail-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt


set laClasse=%1%


IF NOT EXIST DB\%laClasse%.txt (
  echo Erreur 02 : Fichier DB '%laClasse%' manquant
  echo Erreur 02 : Fichier DB '%laClasse%' manquant >> %fichierlogsfail%
  echo.>"DB\%laClasse%.txt"
  echo Fichier DB %laClasse%.txt cree
  echo Fichier DB %laClasse%.txt cree >> %fichierlogsdone%
  pause
) ELSE (
  FOR /f "delims=; tokens=1,2,3,4,5,6" %%m in (DB\%laClasse%.txt) do (
    CALL Sous-Programmes\CreerCompte %%m %%n %%o %%p %%q %%r %laClasse%
  )
)



