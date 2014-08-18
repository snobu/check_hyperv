$team = (Get-NetLbfoTeam).Status


if ($team -match 'Up')
{
    Write-Output 'OK: TeamBroadcom Up'
    exit 0
}

else
{
    Write-Output "CRITICAL: TeamBroadcom running $team"
    exit 2
}