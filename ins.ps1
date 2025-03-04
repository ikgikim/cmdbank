# 설치할 프로그램 목록
$programs = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "Notepad++.Notepad++",
    "qbittorrent.qbittorrent",
    "Bandisoft.Bandizip",
    "voidtools.Everything",
    "KeePassXCTeam.KeePassXC",
    "SMPlayer.SMPlayer",
    "Python.Python.3.9",
    "AIMP.AIMP",
    "DuckDuckGo.DesktopBrowser",
    "Telegram.TelegramDesktop",
    "Kakao.KakaoTalk",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Obsidian.Obsidian"
)

foreach ($program in $programs) {
    # 프로그램이 이미 설치되어 있는지 확인
    $installed = winget list | Select-String -Pattern $program

    if ($installed) {
        Write-Host "$program은(는) 이미 설치되어 있습니다."
    } else {
        # 프로그램 설치
        Write-Host "$program을(를) 설치 중입니다..."
        winget install $program -y
    }
}
