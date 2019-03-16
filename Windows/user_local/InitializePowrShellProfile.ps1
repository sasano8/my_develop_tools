
#PowerShellのユーザプロファイルが作成されていない場合、新たに作成します。

if(Test-Path $profile){
	throw "already exist $profile";
    exit
}

$script= cat ./src/prompt.ps1

New-Item -path $profile -type file -force

echo $script >> $profile

. $profile

