env_push() {
    eval value=\$$1
    if [[ $value = "" ]]; then
        export $1=$2
    elif [ -d "$2" ]; then
        tmp=$(echo $value | tr ':' '\n' | awk '$0 != "'"$2"'"' | paste -sd: -)
        if [[ $tmp = "" ]]; then export $1=$2; else export $1=$2:$tmp; fi
    fi
}
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
ARCHNAME=`perl -V:archname`
ARCHNAME=`echo $ARCHNAME | awk '{ print substr( $0, 11,length($0)-12 ) }'`
set_script_dir
export KB_DEPLOYMENT_CONFIG=$SCRIPT_DIR/config.ini
env_push PERL5LIB $SCRIPT_DIR/local/lib/perl5/$ARCHNAME
env_push PERL5LIB $SCRIPT_DIR/local/lib/perl5/$ARCHNAME/auto
env_push PERL5LIB $SCRIPT_DIR/local/lib/perl5
env_push PERL5LIB $SCRIPT_DIR/../kb_seed/lib
env_push PERL5LIB $SCRIPT_DIR/../idserver/lib
env_push PERL5LIB $SCRIPT_DIR/../cluster_service/client/perl/Bio-KBase-ClusterService-0.02/lib
env_push PERL5LIB $SCRIPT_DIR/../KBaseFBAModeling/lib
env_push PERL5LIB $SCRIPT_DIR/../workspace_service/lib
export PERL5LIB
source $SCRIPT_DIR/../KBaseClient/user-env.sh
set_script_dir
source $SCRIPT_DIR/../ModelSEED/user-env.sh
set_script_dir