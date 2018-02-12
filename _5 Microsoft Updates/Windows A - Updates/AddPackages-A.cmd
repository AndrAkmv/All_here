@echo off
echo Online servicing of Windows 10 image
echo -------------------------------------------------------------------------------
echo Adding Netfx updates
start "" /d Netfx /max /w Netfx-A.cmd
echo Adding Rollup updates
start "" /d Rollup /max /w Rollup-A.cmd
