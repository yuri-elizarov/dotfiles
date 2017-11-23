# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

BREW_PREFIX=$(/usr/local/bin/brew --prefix)

# virtualenv environment vars
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
#export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export M2_HOME=

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x $BREW_PREFIX/bin/lesspipe.sh ] && eval "$(lesspipe.sh)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    *)
	PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
	;;
#    *)
#	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#	;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm, rxvt or Eterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*|Eterm*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
	;;
    screen)
	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
	;;
    *)
	;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
  #eval "`dircolors -b`"
  #alias ls='ls --color=auto'
  #alias dir='ls --color=auto --format=vertical'
  #alias vdir='ls --color=auto --format=long'
#fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias android-connect="mtpfs -o allow_other /media/nexus4"
alias android-disconnect="fusermount -u /media/nexus4"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion
fi

# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#export HADOOP_PREFIX="/opt/local/share/java/hadoop-1.2.1"
#export HADOOP_COMMON_HOME=/Users/yuri/work/terapeak/hadoop/hadoop-1.2.1
#export HADOOP_PREFIX=${HADOOP_COMMON_HOME}
#export HADOOP_PREFIX=${HADOOP_COMMON_HOME}
#export HADOOP_CONF_DIR="$HADOOP_COMMON_HOME/conf"
#export HADOOP_MAPRED_HOME="$HADOOP_COMMON_HOME"
#export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home"
#export SCALA_HOME="/usr/local/Cellar/scala/2.10.3"
export MAVEN_OPTS="-Xmx3096m"

# For brew
export PATH="/usr/local/bin:$PATH"
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"
export PIP_RESPECT_VIRTUALENV=true
source $BREW_PREFIX/bin/virtualenvwrapper.sh

syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}


PERL_MB_OPT="--install_base \"/Users/yuri/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yuri/perl5"; export PERL_MM_OPT;
