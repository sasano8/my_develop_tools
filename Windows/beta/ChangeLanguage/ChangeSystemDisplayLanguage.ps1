#--------------------------------------------------------------------------------- 
#The sample scripts are not supported under any Microsoft standard support 
#program or service. The sample scripts are provided AS IS without warranty  
#of any kind. Microsoft further disclaims all implied warranties including,  
#without limitation, any implied warranties of merchantability or of fitness for 
#a particular purpose. The entire risk arising out of the use or performance of  
#the sample scripts and documentation remains with you. In no event shall 
#Microsoft, its authors, or anyone else involved in the creation, production, or 
#delivery of the scripts be liable for any damages whatsoever (including, 
#without limitation, damages for loss of business profits, business interruption, 
#loss of business information, or other pecuniary loss) arising out of the use 
#of or inability to use the sample scripts or documentation, even if Microsoft 
#has been advised of the possibility of such damages 
#--------------------------------------------------------------------------------- 

#requires -Version 2.0

<#
 	.SYNOPSIS
       This script can be change the system display language in Windows.
    .DESCRIPTION
       This script can be change the system display language in Windows.
    .PARAMETER  AvaliableLanguage
		List all of installed system language in Windows.
	.PARAMETER	LanguageTag
        Specifies the installed system language.
	.EXAMPLE
        C:\PS> C:\Script\ChangeSystemDisplayLanguage.ps1 -AvailiableLanguage

        ID InstalledLanguageTag
        -- --------------------
         1 en-US

		This example shows how to list all of isntalled system language in Windows.
	.EXAMPLE
        C:\PS> C:\Script\ChangeSystemDisplayLanguage.ps1 -LanguageTag "zh-CN"

        Successfully change the system display language.

        Restart the computer.
        It will take effect after logoff the current user, do you want to logoff right now?
        [Y] Yes  [N] No  [?] Help (default is "Y"):

        This example shows how to change the system display language in Windows.
#>

[CmdletBinding(DefaultParameterSetName='SetLanguage')]
Param
(
    [Parameter(Mandatory=$true,ParameterSetName='AvaliableLanguage')]
    [Switch]$AvailableLanguage,
    [Parameter(Mandatory=$true,ParameterSetName='SetLanguage')]
    [String]$LanguageTag
)

Function GetChoice
{
    #Prompt message
    $Caption = "Restart the computer."
    $Message = "It will take effect after logoff the current user, do you want to logoff right now?"
    $Choices = [System.Management.Automation.Host.ChoiceDescription[]]`
    @("&Yes","&No")

    [Int]$DefaultChoice = 0

    $ChoiceRTN = $Host.UI.PromptForChoice($Caption, $Message, $Choices, $DefaultChoice)
	
    Switch ($ChoiceRTN)
    {
        0 {Logoff}
        1 {break}
    }
}

Function CheckInstalledLanguage
{
    #Check for installed language packs
    $GetLanguagePacks = Invoke-Expression -Command "dism.exe /online /Get-intl"
    $strLngTag = $GetLanguagePacks | Select-String -Pattern "Installed"
    $InstalledLngTag = $strLngTag | Foreach{$_.ToString().Replace("Installed language(s):","").Trim()}

    $InstalledLngTag
}

If($AvailableLanguage)
{
    $ID = 1
    CheckInstalledLanguage | Foreach{New-Object -TypeName PSObject -Property @{'ID' = $ID++; 'InstalledLanguageTag' = $_}}|Format-Table -AutoSize
}


If($LanguageTag)
{
    $InstalledLngTags = CheckInstalledLanguage

    Foreach($LngTag in $InstalledLngTags)
    {
        If($LngTag.ToLower() -eq $LanguageTag.ToLower())
        {
            Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name "PreferredUILanguages" -Value $SetLanguage
            Write-Host "Successfully change the system display language."
            GetChoice
        }
        Else
        {
            Write-Host "Please make sure you input the correct language tag or this language is installed."
        }
    }
}
