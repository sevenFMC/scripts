[ $# -ne 1 ] && echo "please provide  <destination> <origin> branch name." && exit

cd EzSuiteBackGroundServices 
git checkout conta-digital
git branch -d $1
cd ..

cd EzSuiteOnlineAcquire
git checkout conta-digital
git branch -d $1
cd ..

cd SevenFw
git checkout conta-digital
git branch -d $1
cd ..
