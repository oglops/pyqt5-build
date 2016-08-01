@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

rem set QMAKESPEC=%QTDIR%\mkspecs\%_QMAKESPEC_%

pushd %PYQTDIR%

rem pushd pylupdate
rem del moc_translator.cpp 2> nul
rem del moc_translator.obj 2> nul
rem %QTDIR%\bin\moc.exe -o moc_translator.cpp translator.h
rem popd

set startTime=%time%

echo yes | "%PY_LOCATION%\python" configure.py --spec=%_QMAKESPEC% --qmake=%ADSKQTDIR%\qtbase\bin\qmake.exe LIBDIR_QT="%QTDIR%\lib" INCDIR_QT="%QTDIR%\include" MOC="%QTDIR%\bin\moc.exe" -w --disable QtNfc   --qsci-api --target-py-version=2.7

rem nmake
rem nmake install
jom -j 4
jom install

popd

echo yeah
echo Start Time: %startTime%
echo Finish Time: %time%