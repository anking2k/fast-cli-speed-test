# Specify the output file for the results of the speed test
$outputFile = "C:\Users\Andre King\Desktop\FastSpeedTest\speed_results.txt"

# Short function for the actual speed test
function Check-Speed {
    $result = fast --upload --json
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $jsonObject = $result | ConvertFrom-Json
    $downloadSpeed = $jsonObject.downloadSpeed
    $uploadSpeed = $jsonObject.uploadSpeed
    $latency = $jsonObject.latency

    # Time to manipulate the output string that will be written to the output file
    $output = "$timestamp - Download: $downloadSpeed Mbps, Upload: $uploadSpeed Mbps, Latency: $latency ms"
    Write-Output $output
    $output | Out-File -FilePath $outputFile -Append
}

# Loop to run every xx seconds
while ($true) {
    Check-Speed
    Start-Sleep -Seconds 45
}
