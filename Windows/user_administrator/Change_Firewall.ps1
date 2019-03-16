
# FireWallの有効・無効を切り替えます。

# 変更前の状態確認

Get-NetFirewallProfile

# FireWallの状態を切り替える。

#Get-NetFirewallProfile -Name "Domain" | Set-NetFirewallProfile -Enabled false
Get-NetFirewallProfile -Name "Public" | Set-NetFirewallProfile -Enabled false
Get-NetFirewallProfile -Name "Private" | Set-NetFirewallProfile -Enabled false

# 変更後の状態確認
Get-NetFirewallProfile

