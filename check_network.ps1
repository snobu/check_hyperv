$TeamName = (Get-NetLbfoTeam).Name
$TeamStatus = (Get-NetLbfoTeam).Status


if ($TeamStatus -match 'Up')
{
    Write-Output "OK: NIC Team $TeamName UP"
    exit 0
}
else
{
    Write-Output "CRITICAL: NIC Team $TeamName running $TeamStatus"
    exit 2
}
