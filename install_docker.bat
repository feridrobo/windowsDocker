@echo off
echo Descargando archivos necesarios para Docker y Docker Compose...

:: Descargar Docker Engine
powershell.exe -Command "& {Invoke-WebRequest -UseBasicParsing -Uri 'https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe' -OutFile 'DockerInstaller.exe'}"

:: Descargar Docker Compose
powershell.exe -Command "& {Invoke-WebRequest -UseBasicParsing -Uri 'https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Windows-x86_64.exe' -OutFile 'docker-compose.exe'}"

echo Instalando Docker y Docker Compose...

:: Instalar Docker Engine
start /wait DockerInstaller.exe /S

if %errorlevel% equ 0 (
    echo Docker Engine se ha instalado correctamente.
) else (
    echo Se ha producido un error al instalar Docker Engine. Verifica que tengas permisos de administrador y que la descarga se haya completado correctamente.
    goto :END_SCRIPT
)

:: Mover Docker Compose a la carpeta de instalación de Docker
move docker-compose.exe "C:\Program Files\Docker\"

if %errorlevel% equ 0 (
    echo Docker Compose se ha instalado correctamente.
) else (
    echo Se ha producido un error al mover Docker Compose a la carpeta de instalación de Docker. Verifica que tengas permisos de administrador y que la descarga se haya completado correctamente.
    goto :END_SCRIPT
)

echo Docker y Docker Compose se han instalado correctamente.

:END_SCRIPT
pause