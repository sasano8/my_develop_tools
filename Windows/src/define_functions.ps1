

function global:Get-Server(){
	$folder = [Environment]::ExpandEnvironmentVariables($my_env.data_center_path)
	if((Test-Path $folder) -eq $false){ throw $folder + "‚ª‘¶İ‚µ‚Ü‚¹‚ñB" }
	return ls $folder | ls
}
