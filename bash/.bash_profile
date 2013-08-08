# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  PATH=~/bin:~/work/sctest/materials/testing/bin:"${PATH}"
fi

# do the same with MANPATH
if [ -d ~/man ]; then
  MANPATH=~/man:
  export MANPATH
fi

# Paranoid mode ON
##export HISTFILE="~/.bash_history"
#export HISTSIZE="100000000000000000"
#export HISTFILESIZE="10000000000000000"
#readonly HISTFILE
#readonly HISTSIZE
#readonly HISTFILESIZE
# Paranoid mode OFF
