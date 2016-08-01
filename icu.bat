@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

REM Building ICU
RD /s /q %ICU_SOURCE%\lib
RD /s /q %ICU_SOURCE%\bin
RD /s /q %ICU_DIST%

SET PATH=%PATH%;C:\cygwin64\bin

pushd %ICU_SOURCE%

dos2unix *
dos2unix -f configure

rem bash runConfigureICU Cygwin/MSVC -prefix=%ICU_DIST%
for /F %%P in ('cygpath -u %ICU_DIST%') do bash runConfigureICU Cygwin/MSVC -prefix=%%P

make clean
make && make install

popd