@REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

set SEVENZIP=C:\"Program Files"\7-Zip\7z.exe
set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable
set PYTHON_EXE=%PYTHON_DIR%\python.exe

if not exist %PYTHON_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/dirkarnez/python-portable/releases/download/v3.10.8/python-3.10.8-amd64-portable.zip" -L -O  &&^
%SEVENZIP% x python-3.10.8-amd64-portable.zip -o"%PYTHON_DIR%" -y &&^
del python-3.10.8-amd64-portable.zip
)

if exist %PYTHON_EXE% (
    echo python %PYTHON_EXE% found
)


set GIT_EXE=%DOWNLOADS_DIR%\PortableGit\bin\git.exe
if not exist %GIT_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe" -L -O  &&^
PortableGit-2.42.0.2-64-bit.7z.exe -o%DOWNLOADS_DIR%\PortableGit -y &&^
del PortableGit-2.42.0.2-64-bit.7z.exe
)

if exist %GIT_EXE% (
    echo git %GIT_EXE% found
)

set GCC_DIR=%DOWNLOADS_DIR%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1
set GCC_EXE=%GCC_DIR%\mingw64\bin\gcc.exe

if not exist %GCC_EXE% (
cd /d "%TEMP%" &&^
%SystemRoot%\System32\curl.exe "https://github.com/brechtsanders/winlibs_mingw/releases/download/11.2.0-12.0.1-9.0.0-r1/winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1.zip" -L -O &&^
%SEVENZIP% x winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1.zip -o"%GCC_DIR%" -y &&^
del winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1.zip
)

if exist %GCC_EXE% (
    echo gcc %GCC_EXE% found
)
