Describe "ContosoEntraConfig" -Tag "Privilege", "Contoso" {
    It "TC.0001: Entra Group 'AAD-DefaultUserGroup' should have more than 10 members" {

        $groupId = "dda6f06f-03c2-4ad0-abce-2d5df0c760d4"

        try {
            $memberCount = Get-MgGroupTransitiveMemberCount -GroupId $groupId -ConsistencyLevel eventual
        }
        catch {
            Write-Error $_.Exception.Message
        }

        # Test if the group exists and has members
        $memberCount | Should -BeGreaterThan 10
    }
}