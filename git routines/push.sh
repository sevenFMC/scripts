[ $# -ne 1 ] && echo "please specify affected projects with -[asdf] options" &&
exit -1;

function brchpush {
    cd $1
    git push origin "$(git branch --show-current)"
    cd ..
}

while getopts "asdf" toggle; do
	case ${toggle} in
		a)
			echo "pushing BGS."; brchpush  EzSuiteBackGroundServices
			;;
		s)
			echo "pushing SevenFw"; brchpush  SevenFw 
			;;
		d)
			echo "pushing onlineAcquire"; brchpush EzSuiteOnlineAcquire
			;;
		f)
			echo "pushing interfaceExternal"; brchpush EzSuiteInterfaceExternal
			;;
	esac
done