
$o = '..\out'

# output�t�H���_�̊m�F ���݂��Ȃ��ꍇ�͏������I��
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
# �\�t�g�E�F�A�ꗗ�Ɠ��e����v���Ă��Ȃ�����
Get-WmiObject Win32_Product | Export-Csv -Encoding Default $o\install_softwares.csv



# ip address
Get-NetIPAddress | Export-Csv -Encoding Default $o\ip_address.csv

#NetAdapter
#Windows7 ���Ή��H
Get-NetAdapter | Export-Csv -Encoding Default $o\network_adapter.csv

#NetAdapterBinding
#Windows7 ���Ή��H
Get-NetAdapterBinding | Export-Csv -Encoding Default $o\network_adapter_binding.csv

# �v�����^�[�ꗗ
# Windows2008�ł͓��삵�Ȃ�
Get-Printer | Export-Csv -Encoding Default $o\printers.csv

Get-PrinterDriver | Export-Csv -Encoding Default $o\PrinterDrivers.csv
Get-PrinterPort | Export-Csv -Encoding Default $o\PrinterPorts.csv


# FirewareProfile
Get-NetFirewallProfile | Export-Csv -Encoding Default $o\firewall_profile.csv

# �T�[�r�X�ꗗ
get-service | Export-Csv -Encoding Default $o\services.csv

# ���ϐ��ꗗ
ls env: | Export-Csv -Encoding Default $o\variables.csv


#hosts
cp C:\Windows\System32\drivers\etc\hosts $o\hosts


# �f�o�C�X�ꗗ
Get-WmiObject Win32_PnpEntity | Export-Csv -Encoding Default $o\devices.csv

#�h���C�o�ꗗ
driverquery


# �T�[�o�̂ݎ��s�\�Ǝv����
get-windowsFeature | Export-Csv -Encoding Default $o\Features.csv




#���O�I���A�J�E���g���m�F�ł���炵�������W����K�v�����邩�H�H
#gwmi win32_service -Filter "startname='LocalSystem'"


# �󂫗e��
Get-PSDrive -PSProvider FileSystem | Export-Csv -Encoding Default $o\disk_volume.csv

# �A�N�Z�X���擾
pwd | Get-Acl | Export-Csv -Encoding Default $o\access.csv

# �X�P�W���[���[
Get-ScheduledTask | Export-Csv -Encoding Default $o\scheduled_tasks.csv

# ��L�X�P�W���[���R�}���h�����p�ł��Ȃ��ꍇ�ȉ��𗘗p����B
# at

# ���s�\��̃^�X�N�ꗗ
#Get-ScheduledTask | Where {$_.State -eq 'Ready'} | Get-ScheduledTaskInfo | where {$_.nextruntime -ne $null} | select taskpath,taskname,nextruntime | Sort-Object taskname

# �C�x���g���O
#Get-EventLog -list | Export-Csv -Encoding Default $o\events.csv

# �C�x���g���O�ڍ�
#Get-EventLog System | Export-Csv -Encoding Default $o\events_system.csv

# �v���_�N�g�L�[�擾
# �擾�ł��Ȃ�����
#(Get-WmiObject -query �eselect * from SoftwareLicensingService�f).OA3xOriginalProductKey

# �p�b�`�ꗗ
Get-WMIObject Win32_QuickFixEngineering | Export-Csv -Encoding Default $o\windows_patch.csv
















