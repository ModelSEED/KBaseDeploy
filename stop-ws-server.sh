set_script_dir () {
	pushd . > /dev/null
	SCRIPT_DIR="${BASH_SOURCE[0]}";
	if ([ -h "${SCRIPT_DIR}" ]) then
		while([ -h "${SCRIPT_DIR}" ]) do cd `dirname "$SCRIPT_DIR"`; SCRIPT_PATH=`readlink "${SCRIPT_DIR}"`; done
	fi
	cd `dirname ${SCRIPT_DIR}` > /dev/null
	SCRIPT_DIR=`pwd`;
	popd  > /dev/null
}
set_script_dir
pid_file=$SCRIPT_DIR/ws-service.pid
if [ ! -f $pid_file ] ; then
	echo "No pid file $pid_file found for service workspaceService" 1>&2
	exit 1
fi
pid=`cat $pid_file`
kill $pid
