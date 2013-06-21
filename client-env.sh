env_push() {
    eval value=\$$1
    if [[ $value = "" ]]; then
        export $1=$2
    elif [ -d "$2" ]; then
        tmp=$(echo $value | tr ':' '\n' | awk '$0 != "'"$2"'"' | paste -sd: -)
        if [[ $tmp = "" ]]; then export $1=$2; else export $1=$2:$tmp; fi
    fi
}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
env_push PERL5LIB /home/chenry/kbase/KBaseClient/lib
env_push PERL5LIB /home/chenry/kbase/KBaseClient/local/lib/perl5/
env_push PERL5LIB /home/chenry/kbase/KBaseClient/local/lib/perl5/x86_64-linux
env_push PERL5LIB /home/chenry/kbase/KBaseClient/local/lib/perl5/x86_64-linux/auto
export PERL5LIB
env_push PATH /home/chenry/kbase/KBaseClient/bin
export PATH