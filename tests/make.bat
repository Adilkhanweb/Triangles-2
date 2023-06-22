@echo off
dcc32 -cc gentests.dpr

gentests.exe

dcc32 -cc ..\triangles_rs.dpr
copy ..\triangles_rs.exe triangles_rs.exe >nul 2>&1

call make_answers.bat
