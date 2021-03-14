(cat ~/.cache/wal/sequences)
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git virtualenv)
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

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

export SPACEMACSDIR=${HOME}/.config/emacsen
case `uname` in
	Darwin)
		# ???
		export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
		export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
		export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
		export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"
		# Sometimes the audio daemon on macOS just stops and this restarts it
		alias raudio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"
		alias reboot="launchctl reboot"
		;;
	Linux)
		# Are we on WSLv2?
		# https://stackoverflow.com/a/43618657
		if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
			# WSL
			export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
			export LIBGL_ALWAYS_INDIRECT=1
			export $(dbus-launch)
			source ${HOME}/.keychain/zjp-windows-sh
			alias emacs="setsid emacs"
		else
			# Linux
			source ${HOME}/.keychain/memetoo-sh
		fi
		;;
esac

alias vim=nvim
export PATH="$PATH:${HOME}/.local/bin:${HOME}/git/neofetch"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias biblatex=biber

conda activate
