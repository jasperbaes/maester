# Generated on 04/16/2025 21:38:23 by .\build\orca\Update-OrcaTests.ps1

using module ".\orcaClass.psm1"

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingEmptyCatchBlock', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSPossibleIncorrectComparisonWithNull', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingCmdletAliases', '')]
param()


<#

ORCA-240

External in Outlook

#>



class ORCA240 : ORCACheck
{
    <#
    
        CONSTRUCTOR with Check Header Data
    
    #>

    ORCA240()
    {

        $this.Control=240
        $this.Services=[ORCAService]::EOP
        $this.Area="Outlook"
        $this.Name="External Tags"
        $this.PassText="Outlook is configured to display external tags for external emails."
        $this.FailRecommendation="Configure external tags to highlight emails which are sent from external."
        $this.Importance="External tags show users email that is coming from external. EOP & MDO works with native client side integration to clearly highlight external emails. This allows you to train users to identify these emails so that they can be more suspicious about the email contents."
        $this.ChiValue=[ORCACHI]::VeryHigh
        $this.Links= @{
            "Native external in Outlook"="https://techcommunity.microsoft.com/t5/exchange-team-blog/native-external-sender-callouts-on-email-in-outlook/ba-p/2250098"
            "Set External in Outlook (Set-ExternalInOutlook)"="https://learn.microsoft.com/en-us/powershell/module/exchange/set-externalinoutlook?view=exchange-ps"
        }
    }

    <#
    
        RESULTS
    
    #>

    GetResults($Config)
    {

        # Check objects
        $ConfigObject = [ORCACheckConfig]::new()
        $ConfigObject.ConfigItem="ExternalInOutlook"
        $ConfigObject.ConfigData=$Config["ExternalInOutlook"].Enabled

        if($Config["ExternalInOutlook"].Enabled -eq $True)
        {
            $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Pass")
        } else {
            $ConfigObject.SetResult([ORCAConfigLevel]::Standard,"Fail")
        }

        $this.AddConfig($ConfigObject)

    }

}
