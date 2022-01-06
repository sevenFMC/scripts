
function brch_bgs {
cd EzSuiteBackGroundServices
git reset --hard
git checkout "conta-digital"
git pull
cd ..
}

function brch_acquire {
cd EzSuiteOnlineAcquire
git reset --hard
git checkout "conta-digital"
git pull
cd ..
}

function brch_fw {
cd SevenFw
git reset --hard
git checkout "conta-digital"
git pull
cd ..
}

function brch_iexternal {
cd EzSuiteInterfaceExternal
git reset --hard
git checkout "conta-digital"
git pull
cd ..
}


while getopts "asdf" toggle; do
	case ${toggle} in
		a)
			echo "setting branch at BGS."; brch_bgs 
			;;
		s)
			echo "setting branch at SevenFw"; brch_fw
			;;
		d)
			echo "setting branch at onlineAcquire"; brch_acquire 
			;;
		f)
			echo "setting branch at interfaceExternal"; brch_iexternal
			;;
	esac
done