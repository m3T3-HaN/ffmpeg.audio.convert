@echo off
cls
color 0f
setlocal enableextensions enabledelayedexpansion
chcp 65001 > nul
echo.[107;91m
echo ############################################################################
echo # downloaded klasörü içindeki dosyalar converted klasörüne dönüştürülecek. #
echo ############################################################################[0m
echo.
SET /A x=1
for /f "delims=;" %%f in ('dir %~dp0downloaded /b /a-d-h-s') do (
  SET /A x+=1
  echo Dosya: %%f
  echo Adı: %%~nf
  echo Tipi: %%~xf
  echo No: !x!
  echo Dönüşüm İşlemi:%%~nf
  ffmpeg -i "%%~df%%~pfdownloaded\%%~nf%%~xf" -f mp3 -ab 320000 -vn "%~dp0converted\%%~nf.mp3" -loglevel quiet -nostats>nul
  echo %%~nf dönüştü.
)



echo.[107;91m
echo ######################################################
echo # İşlem Tamamlandı Sonlandırmak için bir tuşa basın. #
echo ######################################################[0m
echo.

endlocal

pause>nul