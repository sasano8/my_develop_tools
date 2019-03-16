

function global:Get-Server(){
	$folder = [Environment]::ExpandEnvironmentVariables($my_env.data_center_path)
	if((Test-Path $folder) -eq $false){ throw $folder + "が存在しません。" }
	return ls $folder | ls
}
