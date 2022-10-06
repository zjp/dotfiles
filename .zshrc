OS=`uname -o 2>/dev/null`
if [ ! $? -eq 0 ]; then
	# Pick up Linux and Darwin on old versions
	OS=`uname -s`
fi
ARCH=`arch`

case $OS in
	Msys | Cygwin)
		# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
		# Initialization code that may require console input (password prompts, [y/n]
		# confirmations, etc.) must go above this block; everything else may go below.
		if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
			source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
		fi
		source ~/powerlevel10k/powerlevel10k.zsh-theme
		# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
		[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
		autoload -U compinit
		compinit
		export PATH="$(/usr/bin/cygpath -u "C:\Program Files (x86)\GnuPG\bin"):$PATH"
		export GPG_TTY=$TTY
		eval $(ssh-agent) 2>/dev/null 1>/dev/null
		;;
	Darwin | Linux | GNU\/Linux)
		# Prefer oh-my-zsh on *nixes
		export ZSH="${HOME}/.oh-my-zsh"
		ZSH_THEME="zjp"
		plugins=(git virtualenv keychain gpg-agent)
		zstyle :omz:plugins:keychain agents ssh,gpg
		zstyle :omz:plugins:keychain identities id_rsa
		source $ZSH/oh-my-zsh.sh
		;;
	# TODO: *BSD
esac

export VIRTUAL_ENV_DISABLE_PROMPT=0

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

export SPACEMACSDIR=${HOME}/.config/emacsen

case $OS in
	Darwin)
		case $ARCH in
			arm64)
				HOMEBREW_PREFIX=/opt/homebrew
			;;
			x86_64)
				HOMEBREW_PREFIX=/usr/local
			;;
		esac
		HOMEBREW_BIN=$HOMEBREW_PREFIX/bin
		export PATH=$HOMEBREW_BIN:$PATH
		[ -e $HOMEBREW_BIN/gls ] && alias ls="gls --color --group-directories-first"
		# ???
		export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
		export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
		export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
		export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"
		# Sometimes the audio daemon on macOS just stops and this restarts it
		alias raudio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"
		alias reboot="launchctl reboot"
		[ `command -v setsid` ] && alias zathura="${HOMEBREW_PREFIX}/opt/util-linux/bin/setsid zathura"
		PATH="/Users/zjp/perl5/bin${PATH:+:${PATH}}"; export PATH;
		PERL5LIB="/Users/zjp/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
		PERL_LOCAL_LIB_ROOT="/Users/zjp/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
		PERL_MB_OPT="--install_base \"/Users/zjp/perl5\""; export PERL_MB_OPT;
		PERL_MM_OPT="INSTALL_BASE=/Users/zjp/perl5"; export PERL_MM_OPT;
		# Swagger-Codegen for RBVI
		export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
		export PATH=${JAVA_HOME}/bin:$PATH
		;;
	GNU\/Linux | Linux)
		# Are we on WSLv2?
		# https://stackoverflow.com/a/43618657
		if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
			# WSL
			source ${HOME}/.keychain/zjp-windows-sh
			alias emacs="setsid emacs"
		else
			# Linux
			source ${HOME}/.keychain/memetoo-sh
		fi
		alias ls="ls --color --group-directories-first"
		;;
	Msys | Cygwin)
		;;
esac

[ `command -v nvim` ] && alias vim=nvim
[ `command -v biber` ] && alias biblatex=biber
export PATH="$PATH:${HOME}/.local/bin:${HOME}/git/neofetch"
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
# Make the dotfiles alias act like the regular git command
# https://stackoverflow.com/a/41872586
compdef dotfiles=git
# https://stackoverflow.com/a/17589263
compdef _files dotfiles
# https://stackoverflow.com/a/41872586
setopt complete_aliases
alias cdrbvi="cd ~/git/rbvi"
alias rgf="rg -l"
alias dirsize="du -h -d 1 | tail -n 1"
alias gspp="git stash && git pull && git stash pop"
export PIPENV_VENV_IN_PROJECT="enabled"

# TODO: is opt/anaconda3 portable? brew has opt on arm and /usr/local on x64
if [ -e ~/opt/anaconda3 ]; then
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/Users/zjp/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/Users/zjp/opt/anaconda3/etc/profile.d/conda.sh" ]; then
	        . "/Users/zjp/opt/anaconda3/etc/profile.d/conda.sh"
	    else
	        export PATH="/Users/zjp/opt/anaconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
	conda deactivate # Don't turn conda on by default...
fi 
