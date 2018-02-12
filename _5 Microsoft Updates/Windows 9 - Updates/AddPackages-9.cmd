@echo off
echo Online servicing of Windows 8.1 image
echo -------------------------------------------------------------------------------
echo Adding Netfx updates
start "" /d Netfx /max /w Netfx-9.cmd
echo Adding Other updates
start "" /d Other /max /w Other-9.cmd
echo Adding Rollup updates
start "" /d Rollup /max /w Rollup-9.cmd
