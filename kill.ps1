# 필수 프로세스 목록
$essentialProcesses = @("explorer", "powershell", "svchost", "System", "Registry", "smss", "csrss", "wininit", "winlogon", "services", "lsass","AutoHotKey","telegram","logioptionsplus")

# 모든 프로세스 가져오기
$allProcesses = Get-Process

foreach ($process in $allProcesses) {
    # 프로세스 이름이 필수 프로세스 목록에 없으면 종료
    if ($essentialProcesses -notcontains $process.ProcessName) {
        try {
            Stop-Process -Id $process.Id -Force
            Write-Host "종료됨: $($process.ProcessName)"
        } catch {
            Write-Host "종료 실패: $($process.ProcessName) - $($_.Exception.Message)"
        }
    }
}
