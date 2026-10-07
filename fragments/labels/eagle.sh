eagle)
    name="Eagle"
    type="dmg"
    eagleJSON=$(curl -fsL "https://eagle.cool/check-for-update")
    if [[ $(arch) == "arm64" ]]; then
        eagleFile=$(basename "$(getJSONValue "$eagleJSON" "links.arm")")
    else
        eagleFile=$(basename "$(getJSONValue "$eagleJSON" "links.mac")")
    fi
    downloadURL="https://r2-app.eagle.cool/releases/${eagleFile}"
    appNewVersion=$(getJSONValue "$eagleJSON" "version")
    expectedTeamID="H9GFJ9CQWY"
    ;;
