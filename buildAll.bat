@echo off

pushd %~d0

call "setup.bat"
call "sip.bat"
call "icu.bat"
call "qt.bat"
call "qscintilla.bat"
call "pyqt.bat"

popd
