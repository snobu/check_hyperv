$megacli = Invoke-Command -Command {c:\megacli\megacli64.exe -LDInfo -Lall -aALL}
$grep = $megacli | Select-String 'Optimal' -AllMatches
$count = $grep.Matches.Count

if ($count -eq 2)
{
    Write-Output 'All arrays Optimal'
    exit 0
}

else
{
    Write-Output 'One or more arrays DEGRADED. Call the fire brigade!'
    exit 2
}