davinciresolve)
    # credit: Søren Theilgaard (@theilgaard)
    name="davinciresolve"
    appName="DaVinci Resolve"
    type="pkg"
    appNewVersion=$( curl -fs https://www.blackmagicdesign.com/api/support/us/downloads.json | jq '.downloads[] | select(.name | startswith("DaVinci Resolve"))' | jq ' select(.relatedProductOverride[] =="DaVinci Resolve")' | jq -s 'sort_by(.numericDate) | reverse | .[0].name' |cut -d' ' -f3 | sed 's/.$//')
    downloadURL="https://gravityglobal.blob.core.windows.net/installomator/Resolve/install_resolve_latest.pkg"
    expectedTeamID="9ZGFBWLSYP"
    ;;
