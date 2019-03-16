

# AWSではIEがデフォルトで利用できない設定になっているため、下記の設定を行う。
# Internet Explorer タイルをクリックするとデスクトップで開く　が0

function Execute(){
	
	Set-ItemProperty "Registry::HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" -name "ApplicationTileImmersiveActivation" -value 0

}

function Test(){

	$result = (Get-Item -path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main").GetValue("ApplicationTileImmersiveActivation")
	return ($result -ne 0)

}