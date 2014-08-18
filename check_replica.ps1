$Critical = $False
$Warning = $False

$Replica = Get-VM | Measure-VMReplication -ErrorAction SilentlyContinue | 
                    Select Name, State, Health, AvgLatency, @{l="AvgReplSize";e={[Math]::Round($_.AvgReplSize/1MB, 1)}}

foreach ($vm in $Replica) {
    Write-Host $vm.Name: $vm.Health, '/', $vm.State, '/', "AvgReplSize:", $vm.AvgReplSize, 'MB', '/', AvgLatency: $vm.AvgLatency    
    if ($vm.Health -eq 'Warning')
    {
        Write-Host WARNING: VM Replica $vm.Name : $vm.Health
        $Warning = $True
    }
    if ($vm.Health -eq 'Critical')
    {
        Write-Host CRITICAL: VM Replica $vm.Name : $vm.Health
        $Critical = $True 
    }
} #ForEach

if ($Critical)
{ 
    exit 2
}
elseif ($Warning)
{ 
    exit 1
}
else
{
    exit 0 #clean exit
}