@ECHO OFF
REM    Creation du repertoire de l'eleve recu

set fichierlogsdone=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\done-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt
set fichierlogsfail=Logs\%date:~6,4%-%date:~3,2%-%date:~0,2%\fail-%date:~6,4%-%date:~3,2%-%date:~0,2%-log.txt

set nom=%1%
set prenom=%2%
set age=%3%
set sexe=%4%
set profession=%5%
set departement=%6%
set laClasse=%7%
set longname=%nom%-%prenom%-%age%-%sexe%-%profession%-%departement%
set shortname=%nom:~0,4%%prenom:~0,3%
set shortnamedoublon=%nom:~0,4%%prenom:~0,3%1
set shortnametriplon=%nom:~0,4%%prenom:~0,3%2


IF EXIST Users\%shortname% (
  GOTO verifDoublons
) ELSE (
  md Users\%shortname%
  echo %laClasse% - SUCCES : Repertoire cree %longname% >> %fichierlogsdone%
)
  GOTO EoF

:verifDoublons
)
IF EXIST Users\%shortnamedoublon% (
  GOTO verifTriplon
) ELSE (
  md Users\%shortnamedoublon%
  echo %laClasse% - SUCCES : Repertoire premier doublon cree %longname% >> %fichierlogsdone%
)
  GOTO EoF

:verifTriplon
)
IF EXIST Users\%shortnametriplon% (
  echo %laClasse% - Erreur 05 : Repertoire existant %longname% >> %fichierlogsfail%
  echo %laClasse% - Erreur 05 : Repertoire existant %nom% %prenom%
) ELSE (
  md Users\%shortnametriplon%
  echo %laClasse% - SUCCES : Repertoire deuxieme doublon cree %longname% >> %fichierlogsdone%
)

:EoF