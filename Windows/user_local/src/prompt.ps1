function prompt {

   $previous_result = $?

   #カレントディレクトリをウィンドウタイトルにする
   (Get-Host).UI.RawUI.WindowTitle = "Windows PowerShell " + $pwd

   #debianのbashのような感じで表示
   #カレントディレクトリを取得
   $idx = $pwd.ProviderPath.LastIndexof("\") + 1
   $cdn = $pwd.ProviderPath.Remove(0, $idx)

   #プロンプトにセットする文字   
   #$val = $env:UserName + "@" + $env:UserDomain + ":" + $cdn + "> "

   $val = $cdn + ">"   

   # 成功失敗時でターミナルの状態を変更する。
   if ($previous_result) {
        Write-Host $val -NoNewLine -ForegroundColor "Green"
    } else {
        Write-Host $val -NoNewLine -ForegroundColor "Red"    
    }
    
    return " "
   
}

#消音
Set-PSReadlineOption -BellStyle None

$tmp = Get-Date -Format "yyyymmddmmss"
$log_name = $env:USERPROFILE + "\log$tmp.log"

# ログを出力
Start-Transcript $log_name 

