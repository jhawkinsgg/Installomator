pabrowser)
    name="Prisma Access Browser"
    type="pkg"
    if [[ $(arch) != "i386" ]]; then
        printlog "Architecture: arm64 (not i386)"
        _archParam="arm64"
    else
        printlog "Architecture: i386"
        _archParam="x64"
    fi
    _appcast=$(curl -s "https://releases.talon-sec.com/api/v1/appcast.xml?appid=%7Bdfef2477-4f0e-454b-bc0d-03ce61074e4c%7D&platform=mac&architecture=${_archParam}&channel=packaged")
    downloadURL=$(echo "$_appcast" | grep -Eo 'url="(.*)"' | cut -d '"' -f2 | tail -n1)
    appNewVersion=$(echo "$_appcast" | grep -Eo 'sparkle:shortVersionString="(.*)"' | cut -d '"' -f2 | tail -n1)
    expectedTeamID="XZMH593AYG"
    ;;
