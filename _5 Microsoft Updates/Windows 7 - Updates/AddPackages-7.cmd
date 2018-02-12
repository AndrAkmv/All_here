@echo off
echo Online servicing of Windows 7 image
echo -------------------------------------------------------------------------------
echo Adding Convenience update
start "" /d Conven /max /w Conven-7.cmd
echo Adding Internet Explorer
start "" /d Internet /max /w Internet-7.cmd
echo Adding Other updates
start "" /d Other /max /w Other-7.cmd
echo Adding Rollup updates
start "" /d Rollup /max /w Rollup-7.cmd
