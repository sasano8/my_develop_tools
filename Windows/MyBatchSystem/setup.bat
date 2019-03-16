echo off
REM ===================================
REM 自動起動するバッチをSTARTUPに配置する。
REM ===================================

REM ===================================
REM 起動時に呼び出すバッチファイルが格納されたフォルダを指定する
REM ===================================
set TARGET_FOLDER="%CD%\batch_custom\MyStartBath.ps1"
ECHO "起動時に呼び出すスクリプトが格納されたフォルダを指定してください。(実際はフォルダじゃなくてファイルになっているのでいづれ修正)"
ECHO [規定値=%TARGET_FOLDER%]
set /P TARGET_FOLDER="target folder:"

REM ===================================
REM 起動用バッチを配置する
REM ===================================
SET COPY_ORIGIN_FILE_NAME="my_batch_start.bat"
SET COPY_ORIGIN_FILE="%CD%\%COPY_ORIGIN_FILE_NAME%"
SET COPY_DEST_FOLDER="%homepath%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
SET OUTPUT_PATH=%COPY_DEST_FOLDER%\%COPY_ORIGIN_FILE_NAME%


REM ===================================
REM バッチを作成する
REM ===================================
ECHO REM ============================ > %OUTPUT_PATH%
ECHO REM GENERATED CODE               >> %OUTPUT_PATH%
ECHO SET TARGET_FOLDER=%TARGET_FOLDER% >> %OUTPUT_PATH%
ECHO REM ============================ >> %OUTPUT_PATH%

TYPE %COPY_ORIGIN_FILE% >> %OUTPUT_PATH%
CD %COPY_DEST_FOLDER%
START .