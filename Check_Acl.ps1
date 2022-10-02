#
$volPath = "\\192.168.0.130\volmulti"
$folders = Get-ChildItem $volPath
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DEMO\Domain Admins","FullControl","Allow")
$arrayFullPath = @()
$arrayFolderName = @()
foreach ($f in $folders){
    $acl = Get-Acl $f.FullName
    if ($acl.Access.Count -eq 1){
        if ($AccessRule.IdentityReference -in $acl.Access[0].IdentityReference){
            Write-Host "$($f.FullName) only have $($AccessRule.IdentityReference) ACL"
            $arrayFullPath += $f.FullName
            $arrayFolderName += $f.Name
        }
    }
}
