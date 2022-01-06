[ $# -ne 2 ] && echo "please pick projects with -[asdf] and provide branch name." && exit

branchName="$2"

function newbrch_bgs {
cd EzSuiteBackGroundServices 
git checkout conta-digital && 
git pull && 
git checkout -b "$1"
cd ..
}

function newbrch_acquire {
cd EzSuiteOnlineAcquire
git checkout conta-digital && 
git pull && 
git checkout -b "$1"
cd ..
}

function newbrch_fw {
cd SevenFw
git checkout conta-digital && 
git pull && 
git checkout -b "$1"
cd ..
}

function newbrch_iexternal {
cd SevenFw
git checkout conta-digital && 
git pull && 
git checkout -b "$1"
}

while getopts "asdf" toggle; do
	case ${toggle} in
		a)
			echo "creating feature branch at BGS."; newbrch_bgs "$branchName"
			;;
		s)
			echo "creating feature branch at SevenFw"; newbrch_fw "$branchName"
			;;
		d)
			echo "creating feature branch at onlineAcquire"; newbrch_acquire "$branchName"
			;;
		f)
			echo "creating feature branch at interfaceExternal"; newbrch_iexternal "$branchName"
			;;
	esac
done