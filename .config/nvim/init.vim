" If you got this file off of the lab share, you will need to run
" :PlugInstall! before my plugins become available. 
"""""""""""""""""
" Basic options "
"""""""""""""""""
let uname = system('uname -a')
" if (we're not on WSL)
" set rtp+=/usr/share/vim/vimfiles/ " For Gentoo syntax highlighting 
" endif
set number        " Turn on line numbers
set tabstop=4     " number of columns occupied by a previously existing tab
set shiftwidth=4  " number of columns occupied by a tab character
set noexpandtab   " If the tab key is pressed, don't insert spaces...
set softtabstop=4 " ...but, consider several spaces in a row to be tabs
set autoindent    " Indent a new line the same amount as the line just typed
if has("nvim")
	set fcs=eob:\     " Make blank line indicator invisible whitespace
end
set mouse=n       " Resize buffers with the mouse, faster than the keyboard
set background=dark " Make neovim read colors correctly from pywal
set termguicolors
set number 
set relativenumber
syntax enable     " Enable syntax highlighting

set nocompatible
filetype off
"""""""""""""""""""""""""""""
" Filetype specific options "
"""""""""""""""""""""""""""""
" ARM Assembly (for CS 388 / Embedded Systems)
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
" THIS IS A TEST

""""""""""""
" Vim-Plug "
""""""""""""
filetype off 
" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
" Temporary(?) Plugins and their Justifications
" Plugin 'ARM9/arm-syntax-vim' " (for CS 388 / Embedded Systems)

" All plugins must be added before the following line 
call vundle#end()
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:airline_powerline_fonts = 1 " Required to use Powerline glyphs in airline
let g:airline_theme='gruvbox'
colorscheme gruvbox
filetype plugin indent on " allows auto-indenting depending on file type
