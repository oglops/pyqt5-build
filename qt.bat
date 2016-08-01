@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %QTDIR%

call %DXSDK_DIR%\utilities\bin\dx_setenv.cmd

rem echo y | configure -opensource -platform %_QMAKESPEC_% -release -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -mp 

set startTime=%time%

echo y | configure -opensource -platform %_QMAKESPEC_% -release -icu -opengl dynamic -openssl -qt-zlib -plugin-sql-mysql -plugin-sql-psql -plugin-sql-odbc -nomake examples -nomake tests



rem nmake clean
rem nmake

jom clean
jom -j 4
popd

echo yeah
echo Start Time: %startTime%
echo Finish Time: %time%