@echo off

echo Iniciando Docker Compose...  // Muestra un mensaje de que Docker Compose está siendo iniciado.

cd "%userprofile%\Desktop\my-app-folder" || cd "%userprofile%\Escritorio\my-app-folder"  // Cambia al directorio donde se encuentra la carpeta de la aplicación.

"%ProgramFiles%\Docker\docker-compose.exe" up  // Inicia Docker Compose.

if %errorlevel% equ 0 (  // Verifica si Docker Compose se inició correctamente.
    echo Docker Compose se ha iniciado correctamente.
) else (  // Si no se inició correctamente, muestra un mensaje de error.
    echo Se ha producido un error al iniciar Docker Compose. Verifica que tengas permisos de administrador y que la carpeta de la aplicación exista.
)

pause  // Espera a que el usuario presione una tecla antes de cerrar la ventana.