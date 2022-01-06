[ $# -ne 2 ] && echo "please pick projects affected with -[asdf]+ and provide <new> branch name." &&
exit

branchName="$2"

function brch_toDev () {
cd "$1"
git checkout develop &&
git pull &&
git checkout -b "$2" &&
git merge "origin/conta-digital" &&
git push origin "$2"
cd ..

}

while getopts "asdf" toggle; do
	case ${toggle} in
		a)
			echo "branch to-develop at BGS."; brch_toDev EzSuiteBackGroundServices "$branchName"
			;;
		s)
			echo "branch at SevenFw";  brch_toDev SevenFw "$branchName"
			;;
		d)
			echo "branch at onlineAcquire"; brch_toDev EzSuiteOnlineAcquire "$branchName"
			;;
		f)
			echo "branch at interfaceExternal"; brch_toDev EzSuiteInterfaceExternal"$branchName"
			;;
	esac
done
