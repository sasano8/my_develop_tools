


Function UpGreade(){
	choco upgrade chocolatey
	return $?
}

public Function Execute(){

# Web経由でスクリプト（文字列）を取得し、インストールする。
powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# 環境変数設定しなくてもいいかも？？

# powershellを立ち上げなおす


# 処理に成功したら環境変数を設定する。
if($? -eq $True){
	#コマンドプロンプトで環境変数を設定すると、PowerShellでは有効になりません。（再起動が必要です。）
	#SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
	
	$oldSystemPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
	$oldSystemPath += ";c:\work"
	[System.Environment]::SetEnvironmentVariable("Path", $oldSystemPath, "Machine")

    # upgrade
    choco upgrade chocolatey

}



}
