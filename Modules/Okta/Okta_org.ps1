<# Okta_org.ps1 #>
try
{
   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
}
catch
{
   Write-Warning $_.Exception.Message
}

# Verbose will print various informative messages
[Boolean]$oktaVerbose = $true
# define the default Okta Org you want to use, useful if you have more than one.
[String]$oktaDefOrg = "dev1"

[Hashtable]$oktaOrgs = @{
                        dev1 = [Hashtable]@{
                                baseUrl  = [String]"https://dev-secret.okta.com"
                                secToken = [String]"secret"
                                enablePagination = [boolean]$true
                                pageSize = [int]500
                               }
                        prod2 = [Hashtable]@{
                                baseUrl  = [String]"https://yourOtherdomain.okta.com"
                                secToken = [String]"yourOtherApiToken"
                                enablePagination = [boolean]$true
                                pageSize = [int]500
                               }
                        prev = [HashTable]@{
                                baseUrl  = [String]"https://yourDomain.oktapreview.com"
                                secToken = [String]"yourPreviewApiToken"
                                enablePagination = [boolean]$true
                                pageSize = [int]500
                               }
                        }