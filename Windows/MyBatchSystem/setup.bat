echo off
REM ===================================
REM �����N������o�b�`��STARTUP�ɔz�u����B
REM ===================================

REM ===================================
REM �N�����ɌĂяo���o�b�`�t�@�C�����i�[���ꂽ�t�H���_���w�肷��
REM ===================================
set TARGET_FOLDER="%CD%\batch_custom\MyStartBath.ps1"
ECHO "�N�����ɌĂяo���X�N���v�g���i�[���ꂽ�t�H���_���w�肵�Ă��������B(���ۂ̓t�H���_����Ȃ��ăt�@�C���ɂȂ��Ă���̂ł��Â�C��)"
ECHO [�K��l=%TARGET_FOLDER%]
set /P TARGET_FOLDER="target folder:"

REM ===================================
REM �N���p�o�b�`��z�u����
REM ===================================
SET COPY_ORIGIN_FILE_NAME="my_batch_start.bat"
SET COPY_ORIGIN_FILE="%CD%\%COPY_ORIGIN_FILE_NAME%"
SET COPY_DEST_FOLDER="%homepath%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
SET OUTPUT_PATH=%COPY_DEST_FOLDER%\%COPY_ORIGIN_FILE_NAME%


REM ===================================
REM �o�b�`���쐬����
REM ===================================
ECHO REM ============================ > %OUTPUT_PATH%
ECHO REM GENERATED CODE               >> %OUTPUT_PATH%
ECHO SET TARGET_FOLDER=%TARGET_FOLDER% >> %OUTPUT_PATH%
ECHO REM ============================ >> %OUTPUT_PATH%

TYPE %COPY_ORIGIN_FILE% >> %OUTPUT_PATH%
CD %COPY_DEST_FOLDER%
START .