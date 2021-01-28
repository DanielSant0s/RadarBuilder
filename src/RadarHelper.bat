@echo off
title RadarBuilder
echo Radar Builder 1.0
echo Created by Daniel Santos
:SPLIT
echo.
echo.
echo Specify the number of tiles you want to obtain:
echo.
echo GTA San Andreas uses 144 tiles.
echo GTA III and VC uses 64.
echo.
set /p tiles=How many tiles do you want?: 

for /F "delims=" %%G IN ('powershell -command "[math]::Sqrt(%tiles%)"') do set grid=%%G
echo.
echo So you want a grid of %grid%x%grid% square tiles
echo.
echo Choose the resolution of the tiles:
echo Note: ALWAYS use numbers powered by 2.
echo.
echo 128px - Vanilla resolution of radar tiles.
echo 256px - Most of mods use it. Recommended for best 1080p viewing.
echo 512px - Ultra high for tiles, may be slow to load and aliased for 1080p or less.
echo.
set /p tileres=What is the resolution of the tiles?: 


echo Starting Split...
echo.
convert Merged/*.png -crop %grid%x%grid%-0-0@ +repage +adjoin Splitted/radar.png
convert.exe Splitted/*.png -resize %tileres%x%tileres% Splitted/radar.png
renp_folder.exe
pause
