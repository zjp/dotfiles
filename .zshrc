(cat ~/.cache/wal/sequences)

# Are we on WSLv2?
MICROSOFT_KERNEL=$(uname -a | grep 'microsoft')
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git virtualenv)
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/anaconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias vim=nvim
export PATH="$PATH:${HOME}/.local/bin:${HOME}/git/neofetch"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# ???
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"
alias biblatex=biber

case `uname` in 
	Darwin)
		# Sometimes the audio daemon on macOS just stops
		alias raudio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"
		;;
	Linux)
		;;
esac

# Check for a Microsoft kernel (indicates WSLv2)
#if [ -n $MICROSOFT_KERNEL ]; then
#	export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0 
#	export LIBGL_ALWAYS_INDIRECT=1
#fi

case `uname` in 
	Linux)
		keychain ~/.ssh/id_rsa
		. ~/.keychain/memetoo-sh
	;;
esac
