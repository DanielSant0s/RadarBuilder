<# :
:: Batch/PowerShell hybrid
@echo off
setlocal
set "POWERSHELL_BAT_ARGS=%*"
if defined POWERSHELL_BAT_ARGS set "POWERSHELL_BAT_ARGS=%POWERSHELL_BAT_ARGS:"=\"%"
endlocal & powershell -NoLogo -NoProfile -Command "$_ = $input; Invoke-Expression $( '$input = $_; $_ = \"\"; $args = @( &{ $args } %POWERSHELL_BAT_ARGS% );' + [String]::Join( [char]10, $( Get-Content \"%~f0\" ) ) )"

for /R ./Splitted %%i in (*) do (
 if not "%%~ni" == "organize" (
  md "./Splited/%%~ni" && move "%%~i" "./Splited/%%~ni"
 )
)

pause
:: Batch code goes above
goto :EOF
#>
dir | rename-item -NewName {$_.name -replace "-",""}