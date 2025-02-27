davinciresolvestudio)
    name="davinciresolvestudio"
    appName="DaVinci Resolve Studio"
    type="pkgInDmgInZip"
    json_data=$(curl -fs 'https://www.blackmagicdesign.com/api/support/us/downloads.json')
    LATEST=$(echo "$json_data" | jq -r '
        .downloads[]
        | select(.urls."Mac OS X" != null)
        | select(.urls."Mac OS X"[].product == "davinci-resolve-studio")
        | .urls."Mac OS X"[0] 
        | {version: "\(.major).\(.minor).\(.releaseNum)", downloadId: .downloadId, numeric: (.major * 10000 + .minor * 100 + .releaseNum)}
        | @json' \
        | jq -sr 'sort_by(.numeric) | reverse | .[0]')			
    appNewVersion=$(echo "$LATEST" | jq -r '.version')
    DOWNLOAD_ID=$(echo "$LATEST" | jq -r '.downloadId')
    downloadURL=$( curl --location "https://www.blackmagicdesign.com/api/register/us/download/$DOWNLOAD_ID" --header 'Content-Type: application/json;charset=UTF-8' --header 'User-Agent: Mozilla/5.0 (X11; Linux)' --data '{"country": "us", "product": "DaVinci Resolve Studio", "platform": "Mac OS X"}')
    expectedTeamID="9ZGFBWLSYP"
    ;;