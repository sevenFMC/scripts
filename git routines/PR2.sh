[ $# -ne 3 ] && printf "please select projects with -[asdf] \nand provide <destination branch> and <PR title>" &&
exit

GITTOKEN="INSIRA SEU TOKEN AQUI"

FSTRING='{"head": "%s", "base": "%s", "title": "%s" }'

brchDest="$2"
prTitle="$3"


function pr_create {
	cd $3
	PAYLOAD_JSON=$(printf "$FSTRING" "$(git branch --show)" "$1" "$2") &&
	echo "json out: " "$PAYLOAD_JSON"
	RESULT_JSON=$(curl -su "sevenFMC:$GITTOKEN" "$4" \
		--data-raw  "$PAYLOAD_JSON" \
		| jq '.html_url')
    ( [ -n "$RESULT_JSON" ] && echo "$3 PR: " "$RESULT_JSON" ) || echo "failed to create $3 PR"
	cd ..
}

while getopts "asdf" toggle; do
	case ${toggle} in
		a)
			echo "creating PR at BGS."; pr_create "$brchDest" "$prTitle" EzSuiteBackGroundServices "https://api.github.com/repos/Seven-Brasil-Informatica/EzSuiteBackGroundServices/pulls"
			;;
		s)
			echo "creating PR at SevenFw"; pr_create "$brchDest" "$prTitle" SevenFw "https://api.github.com/repos/Seven-Brasil-Informatica/SevenFw/pulls" 

			;;
		d)
			echo "creating PR at onlineAcquire"; pr_create "$brchDest" "$prTitle" EzSuiteOnlineAcquire "https://api.github.com/repos/Seven-Brasil-Informatica/EzSuiteOnlineAcquire/pulls" 

			;;
		f)
			echo "creating PR at interfaceExternal"; pr_create "$brchDest" "$prTitle" ezSuiteInterfaceExternal "https://api.github.com/repos/Seven-Brasil-Informatica/EzSuiteInterfaceExternal/pulls" 

			;;
	esac
done


