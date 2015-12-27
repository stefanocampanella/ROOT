# /etc/profile.d/ROOT.sh
export ROOTSYS=/usr
export LD_LIBRARY_PATH=$ROOTSYS/lib/root:$PYTHIA8/lib:$LD_LIBRARY_PATH
#export PYTHONPATH=$ROOTSYS/lib/root:$PYTHONPATH
if [ $PYTHONPATH ]
then
	export PYTHONPATH=$ROOTSYS/lib/root:$PYTHONPATH
else
	export PYTHONPATH=$ROOTSYS/lib/root
fi
