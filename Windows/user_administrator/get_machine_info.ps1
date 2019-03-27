
$o = '..\out'

# outputフォルダの確認 存在しない場合は処理を終了
ls $o -ErrorAction Stop

# computer name
Get-WmiObject Win32_ComputerSystem | Export-Csv -Encoding Default $o\computer_system.csv

# local user 
Get-WmiObject Win32_UserAccount | ? { $_.LocalAccount -eq $true } | Export-Csv -Encoding Default $o\local_accounts.csv
Get-LocalUser | Export-Csv -Encoding Default $o\local_accounts.csv


# local group
Get-WmiObject Win32_Group | ? { $_.LocalAccount -eq $true } | Export-Csv -Encoding Default $o\local_groups.csv
Get-LocalGroup


# local group member
Get-LocalGroup | Get-LocalGroupMember


# install software
# ソフトウェア一覧と内容が一致していなかった
Get-WmiObject Win32_Product | Export-Csv -Encoding Default $o\install_softwares.csv



# ip address
Get-NetIPAddress | Export-Csv -Encoding Default $o\ip_address.csv

#NetAdapter
#Windows7 未対応？
Get-NetAdapter | Export-Csv -Encoding Default $o\network_adapter.csv

#NetAdapterBinding
#Windows7 未対応？
Get-NetAdapterBinding | Export-Csv -Encoding Default $o\network_adapter_binding.csv

# プリンター一覧
# Windows2008では動作しない
Get-Printer | Export-Csv -Encoding Default $o\printers.csv

Get-PrinterDriver | Export-Csv -Encoding Default $o\PrinterDrivers.csv
Get-PrinterPort | Export-Csv -Encoding Default $o\PrinterPorts.csv


# FirewareProfile
Get-NetFirewallProfile | Export-Csv -Encoding Default $o\firewall_profile.csv

# サービス一覧
get-service | Export-Csv -Encoding Default $o\services.csv

# 環境変数一覧
ls env: | Export-Csv -Encoding Default $o\variables.csv


#hosts
cp C:\Windows\System32\drivers\etc\hosts $o\hosts


# デバイス一覧
Get-WmiObject Win32_PnpEntity | Export-Csv -Encoding Default $o\devices.csv

#ドライバ一覧
driverquery


# サーバのみ実行可能と思われる
get-windowsFeature | Export-Csv -Encoding Default $o\Features.csv




#ログオンアカウントを確認できるらしいが収集する必要性あるか？？
#gwmi win32_service -Filter "startname='LocalSystem'"


# 空き容量
Get-PSDrive -PSProvider FileSystem | Export-Csv -Encoding Default $o\disk_volume.csv

# アクセス権取得
pwd | Get-Acl | Export-Csv -Encoding Default $o\access.csv

# スケジューラー
Get-ScheduledTask | Export-Csv -Encoding Default $o\scheduled_tasks.csv

# 上記スケジューラコマンドが利用できない場合以下を利用する。
# at

# 実行予定のタスク一覧
#Get-ScheduledTask | Where {$_.State -eq 'Ready'} | Get-ScheduledTaskInfo | where {$_.nextruntime -ne $null} | select taskpath,taskname,nextruntime | Sort-Object taskname

# イベントログ
#Get-EventLog -list | Export-Csv -Encoding Default $o\events.csv

# イベントログ詳細
#Get-EventLog System | Export-Csv -Encoding Default $o\events_system.csv

# プロダクトキー取得
# 取得できなかった
#(Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey

# プロダクトキー取得(wmic版）
wmic path SoftwareLicensingService get OA3xOriginalProductKey | Select-Object -Index 2

# パッチ一覧
Get-WMIObject Win32_QuickFixEngineering | Export-Csv -Encoding Default $o\windows_patch.csv
















