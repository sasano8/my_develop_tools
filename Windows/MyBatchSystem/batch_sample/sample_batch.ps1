
if ($False) {

	#最新のファイルをローカルにコピーする

	#$MyInvocation.MyCommand.Path
	$MyName = $MyInvocation.MyCommand.Name

	ls "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\$MyName"

	#Copy myself to Startup
	cp $MyInvocation.MyCommand.Path "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\$MyName"

	#いつもバッチファイルの置き場が分からなくなるので、ショートカットを作成させたい

}

#共通変数
$result

#前準備

##Change Execution Plicy for PowerShell

#管理者権限の確認
$result = (net localgroup Administrators) -contains $env:username
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

$result = Test-NetConnection 192.168.0.100 -Port 8080 -InformationLevel Quiet

if($result -eq $false){
	throw "プロキシサーバと疎通できません。"
	Read-Host "続行するには何かキーを押してください "
}

$tmp = Get-Item -path Registry::"\HKEY_CURRENT_USER\Software\Microsoft\Office\Excel\Addins\TagetikExcelNETClient"
if($tmp.GetValue("LoadBehavior") -ne 3) { 
  Echo "Tagetikのレジストリの値がおかしいため、3に変更します。"; 
	Set-ItemProperty -Path $tmp.PSPath -name LoadBehavior -Value 3
		
	echo $tmp
}

Get-Process -id $PID

echo "テストが完了しました。"


