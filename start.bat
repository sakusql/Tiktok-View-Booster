@echo off
cls

title WeMod Pro Unlocker - Installer Automatisé

color 0A

echo ##########################################################
echo #                                                        #
echo #               TIKTOK VIEWS BOOSTER SETUP               #
echo #                                                        #
echo #                       Par Saku                         #
echo ##########################################################
echo.
call :wait

echo Vérification de l'installation de Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Python n'est pas installé. Veuillez installer Python et réessayer.
    echo ==========================================================
    call :wait
    exit /b
)

color 0B
echo.
echo [INFO] Préparation à l'installation des modules Python requis...
echo ==========================================================
call :wait

echo [INFO] Mise à niveau de pip vers la dernière version...
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Échec de la mise à niveau de pip. Veuillez vérifier votre connexion Internet ou l'installation de pip.
    echo ==========================================================
    call :wait
    exit /b
)

echo.
echo [INFO] Installation des modules Python requis :
echo          - colorama
echo          - pystyle
echo          - requests
echo          - datetime
echo ==========================================================
python -m pip install colorama pystyle requests datetime
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Échec de l'installation des modules Python. Veuillez vérifier votre configuration pip ou votre connexion Internet.
    echo ==========================================================
    call :wait
    exit /b
)

color 0A
echo.
echo [SUCCÈS] Les modules Python requis ont été installés avec succès !
echo ==========================================================
call :wait

if not exist Tiktok-Views-Booster.py (
    color 0C
    echo [ERREUR] Tiktok-Views-Booster.py n'a pas été trouvé dans le répertoire actuel.
    echo ==========================================================
    call :wait
    exit /b
)

color 0E
echo.
echo [INFO] Tous les modules nécessaires sont installés et à jour.
echo Préparation au lancement de WeMod Pro Unlocker...
echo ==========================================================
call :wait

cls
echo Lancement de Tiktok-Views-Booster...
python Tiktok-Views-Booster.py
if %errorlevel% neq 0 (
    color 0C
    echo [ERREUR] Échec du lancement de Tiktok-Views-Booster.
    echo ==========================================================
    call :wait
    exit /b
)

color 0A
echo.
echo [SUCCÈS] Tiktok-Views-Booster s'est terminé avec succès !
echo ==========================================================
call :wait
echo.
echo [INFO] Appuyez sur une touche pour fermer cette fenêtre...
pause >nul
exit /b

:wait
ping 127.0.0.1 -n 3 >nul
goto :eof
