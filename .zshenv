case `uname` in
	Darwin)
		export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig/:$PKG_CONFIG_PATH
		;;
	Linux)
		# Are we on WSLv2?
		# https://stackoverflow.com/a/43618657
		if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
			# WSL
			export XDG_RUNTIME_DIR=/tmp/runtime-zjp/
		else
			# Linux
		fi
		keychain ~/.ssh/id_rsa
		export SPACEMACSDIR=/home/zjp/.config/emacsen
		;;
esac
