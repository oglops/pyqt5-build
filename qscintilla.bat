@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %QSCINTILLADIR%
pushd Qt4Qt5
qmake qscintilla.pro
nmake
nmake install
popd
 
rem python binding
pushd Python
"%PY_LOCATION%\Scripts\python" configure.py
nmake
nmake install
popd

rem designer plugin
pushd designer-Qt4Qt5
qmake designer.pro
nmake
nmake install
popd

popd

