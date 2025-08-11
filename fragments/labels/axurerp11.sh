axurerp11)
    name="Axure RP 11"
    type="dmg"
    if [[ $(arch) = "arm64" ]]; then
        printlog "Architecture: arm64"
        downloadURL="https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup-arm64.dmg"
    else
        downloadURL="https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup.dmg"
    fi
    expectedTeamID="HUMW6UU796"
    versionKey="CFBundleVersion"
    ;;