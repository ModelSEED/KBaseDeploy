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
ACTIVEPERL=`which perl`
if [ $ACTIVEPERL != "/home/chenry/perl5/perlbrew/perls/perl-5.16.0/bin/perl" ]; then
	if [ -e "/home/chenry/perl5/perlbrew/etc/bashrc" ]; then
		echo "Sourcing perlbrew!"
		source /home/chenry/perl5/perlbrew/etc/bashrc
	fi 
fi
source $SCRIPT_DIR/user-env.sh
set_script_dir
perl $SCRIPT_DIR/../KBaseFBAModeling/scripts/KBaseFBAScheduler.pl $SCRIPT_DIR "$@"
