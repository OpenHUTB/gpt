:: Copyright Epic Games, Inc. All Rights Reserved.
@echo off

:: 使杀死node.exe后不出现“请按任意键继续. . .”
@echo off<nul 3>nul

pushd %~dp0

call setup.bat

title Cirrus

::运行 node 服务器
::如果使用前端web服务器运行并在loalhost外部访问，则传入  --publicIp=<ip_of_machine>
node cirrus %*

popd
pause
