

$global:my_env = cat .\propeties.json | ConvertFrom-Json

#環境変数を展開した値をmy_envに設定したい。
#jsonは階層構造を持てるから、再帰的でないと駄目
%{
	foreach($x in $my_env){
		$($x | Get-Member -MemberType *Property ).Name
	} 
}
