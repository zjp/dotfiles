#!/bin/sh
case `uname` in
	Darwin)
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	;;
	Linux)
		# Are we on WSL or bare metal Linux?
		if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
			# WSL
			ln -s /mnt/c/Users/zpear $HOME/winhome
			sudo apt install -y zsh
		else
			# Linux
			case `uname -a | cut -d' ' -f2` in
				zjp-nixos)
					;;
				zjp-guix)
					;;
				zjp-memetoo)
					;;
			esac
		fi
	;;
esac
cd $HOME
rsync -a zjp@homelab.lan:/home/zjp/.ssh/* .ssh/
chmod 0600 $HOME/.ssh/id*
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME clone --bare git@github.com:zjp/dotfiles.git .dotfiles.git
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout
source .zshrc
source .zshenv
dotfiles submodule init
dotfiles submodule update
mkdir -p git/cloned-as-collaborator
mkdir git/cloned-as-package
mkdir git/personal
mkdir lab
