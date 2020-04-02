" If you got this file off of the lab share, you will need to run
" :PluginInstall! before my plugins become available. 
"""""""""""""""""
" Basic options "
"""""""""""""""""
set number        " Turn on line numbers
set tabstop=4     " number of columns occupied by a previously existing tab
set shiftwidth=4  " number of columns occupied by a tab character
set noexpandtab   " If the tab key is pressed, don't insert spaces...
set softtabstop=4 " ...but, consider several spaces in a row to be tabs
set autoindent    " Indent a new line the same amount as the line just typed
if has("nvim")
	set fcs=eob:\     " Make blank line indicator invisible whitespace
endif
set mouse=n       " Resize buffers with the mouse, faster than the keyboard
set background=light " Make neovim read colors correctly from pywal
syntax enable     " Enable syntax highlighting

"""""""""""""""""""""""""""""
" Filetype specific options "
"""""""""""""""""""""""""""""
" ARM Assembly (for CS 388 / Embedded Systems)
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
" THIS IS A TEST

""""""""""
" Vundle "
""""""""""
filetype off 
" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/
call vundle#begin()
" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Temporary(?) Plugins and their Justifications
" Plugin 'ARM9/arm-syntax-vim' " (for CS 388 / Embedded Systems)

" All plugins must be added before the following line 
call vundle#end()
let g:airline_powerline_fonts = 1 " Required to use Powerline glyphs in airline
filetype plugin indent on " allows auto-indenting depending on file type


