@REM run as Administrator
@echo off

set DOWNLOADS_DIR=%USERPROFILE%\Downloads

set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.10.8-amd64-portable

set PATH=^
%PYTHON_DIR%;^
%PYTHON_DIR%\Scripts;^
%DOWNLOADS_DIR%\PortableGit\bin;

C:\Windows\System32\taskkill /f /im python.exe

cd /d "%DOWNLOADS_DIR%" &&^
rmdir /s /q tbuild &&^
git clone https://github.com/dirkarnez/tbuild.git &&^
cd tbuild &&^
.\setup.cmd &&^
.\install-packages.cmd &&^
.\install-as-package.cmd &&^
echo tbuild installed &&^
cd /d "%~dp0" &&^
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
