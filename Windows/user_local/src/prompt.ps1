function prompt {

   $previous_result = $?

   #�J�����g�f�B���N�g�����E�B���h�E�^�C�g���ɂ���
   (Get-Host).UI.RawUI.WindowTitle = "Windows PowerShell " + $pwd

   #debian��bash�̂悤�Ȋ����ŕ\��
   #�J�����g�f�B���N�g�����擾
   $idx = $pwd.ProviderPath.LastIndexof("\") + 1
   $cdn = $pwd.ProviderPath.Remove(0, $idx)

   #�v�����v�g�ɃZ�b�g���镶��   
   #$val = $env:UserName + "@" + $env:UserDomain + ":" + $cdn + "> "

   $val = $cdn + ">"   

   # �������s���Ń^�[�~�i���̏�Ԃ�ύX����B
   if ($previous_result) {
        Write-Host $val -NoNewLine -ForegroundColor "Green"
    } else {
        Write-Host $val -NoNewLine -ForegroundColor "Red"    
    }
    
    return " "
   
}

#����
Set-PSReadlineOption -BellStyle None

$tmp = Get-Date -Format "yyyymmddmmss"
$log_name = $env:USERPROFILE + "\log$tmp.log"

# ���O���o��
Start-Transcript $log_name 

