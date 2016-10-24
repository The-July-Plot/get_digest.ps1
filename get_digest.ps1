###############
# nettx.co.uk #
###############

#TODO: handel Errors
#TODO: Clear $vars after run


function Show-Menu
{
     
     param (
           [string]$Title = '
 _______          __ ___________       
 \      \   _____/  |\__    ___/__  ___
 /   |   \_/ __ \   __\|    |  \  \/  /
/    |    \  ___/|  |  |    |   >    < 
\____|__  /\___  >__|  |____|  /__/\_ \
        \/     \/                    \/ 
       Get hash digest tool
     thomas.moore@edrington.com
                    '
     )
     
     cls
     Write-Host "$Title"
     Write-Host "Press '1' to get md5"
     Write-Host "Press '2' to get SHA1"
     Write-Host "press '3' to get both"
     Write-Host "Or double tap ENTER to exit..."
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {

$File = Read-Host "Enter the full path of the file to be hashed" 
$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$hash_md5 = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($File)))
$hash1_md5 = $hash_md5 -replace ‘[-]’,''
write-Host 
""
$hash1_md5
""
#$hash1_md5 = "test"

Read-host "press any key to contine..."

                }'2'{
$hash1_sha1 = ""               
$File = Read-Host "Enter the full path of the file to be hashed" 
$sha1 = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
$hash_sha1 = [System.BitConverter]::ToString($sha1.ComputeHash([System.IO.File]::ReadAllBytes($File)))
$hash1_sha1 = $hash_sha1 -replace ‘[-]’,''
write-Host
""
$hash1_sha1
""
Read-host "press any key to contine..."
                               
                }'3'{
                
$File = Read-Host "Enter the full path of the file to be hashed"               
$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$hash_md5 = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($File)))
$hash1_md5 = $hash_md5 -replace ‘[-]’,''


$sha1 = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
$hash_sha1 = [System.BitConverter]::ToString($sha1.ComputeHash([System.IO.File]::ReadAllBytes($File)))
$hash1_sha1 = $hash_sha1 -replace ‘[-]’,''

Write-Host "
MD5:" $hash1_md5
Write-Host "
SHA1:" $hash1_sha1


Read-host "press any key to contine..."
               
                }'q'{
                return
                }
          }
}
until($input -eq '')
