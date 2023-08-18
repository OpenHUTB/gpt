:: Copyright Epic Games, Inc. All Rights Reserved.
@echo off

:: 使杀死node.exe后不出现“请按任意键继续. . .”
@echo off<nul 3>nul

pushd %~dp0

call setup.bat

title Cirrus

::Run node server
::If running with frontend web server and accessing outside of localhost pass in --publicIp=<ip_of_machine>
node cirrus %*

popd
pause
