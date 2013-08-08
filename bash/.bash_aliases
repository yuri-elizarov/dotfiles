# some misc aliases and functions

# Proxy
#if [ `hostname -d` == "linux-systeme.org" ]; then
#  export http_proxy="http://yme:uthvfybz@yme79:3128"
#  export http_proxy="http://10.8.0.1:3000"
#  export https_proxy="$http_proxy"
#  export ftp_proxy="$http_proxy"
#  export no_proxy=".,192.168.$,10.8.0$,localhost,127.0$"
#  export HTTP_PROXY="$http_proxy"
#  export HTTPS_PROXY="$https_proxy"
#  export FTP_PROXY="$ftp_proxy"
#  export NO_PROXY="$no_proxy"
#fi

# Set notify if you want to be asynchronously notified
# about background job completion.
set -o notify

alias lesser="less -S -r"

alias ls="ls --color=force"

# directory and file listing
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias v='ls -lsahF'
alias vd='ls -lsadhF'

# Some more alias to avoid making mistakes:                                                           
alias rm='rm -i'                                                                                    
alias cp='cp -i'                                                                                    
alias mv='mv -i'                                                                                    

# I am lazy
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# I type too fast
alias cD='cd'
alias Cd='cd'

# misc
alias q='exit'
alias mem='cat /proc/meminfo'
alias nslookup='nslookup -sil $1'
alias traceroute='traceroute -I -F $1'
alias cls='clear'
alias h='history'
alias j="jobs -l"
alias pu="pushd"
alias po="popd"
alias ver='uname -a'
alias checkkernel="lynx --dump http://www.kernel.org/kdist/finger_banner"
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'

# Terminal Emulation
alias TERMVT102='export TERM="vt102"'
alias TERMXTERM='export TERM="xterm"'
alias TERMLINUX='export TERM="linux"'

# dpkg -l readable
alias dpkg="COLUMNS=150 /usr/bin/dpkg $*"

# Use "logout" to leave the shell.
#ignoreeof=10

alias grep="grep --color=auto"



# extract compressed tar-file
function xzip() {
    if [ $# = "1" ]; then
	tar xvzpof $1
    else
	echo "Usage: xzip <filename>"
    fi
}

# list contents of compressed tar-file
function lszip() {
    if [ $# = "1" ]; then
	tar tzf $1
    else
	echo "Usage: lszip <filename>"
    fi
}

# list infos of rpm-package
function irpm() {
    if [ $# = "1" ]; then
	rpm -pqi $1
	    else
	echo "Usage: irpm <filename>"
    fi
}

# extract rpm-package
function xrpm() {
    if [ $# = "1" ]; then
	rpm2cpio < $1 | cpio -ivumd
    else
	echo "Usage: xrpm <filename>"
    fi
}

# Csh compatability:
alias unsetenv=unset
function setenv () {
    export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
function add-alias () {
    local name=$1 value="$2"
    echo alias $name=\'$value\' >>~/.bash_aliases
    eval alias $name=\'$value\'
    alias $name
}

# "repeat" command. Like: repeat 10 echo foo
function repeat () {
    if [ "$1" == "" -o "$2" == "" ]; then
      echo "Usage: repeat 10 echo foo"
    else
      local count="$1" i;
      shift;
      for i in $(seq 1 "$count");
      do
        eval "$@";
      done
    fi
}

