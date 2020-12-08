" If you got this file off of the lab share, you will need to run
" :PlugInstall! before my plugins become available. 
"""""""""""""""""
" Basic options "
"""""""""""""""""
set rtp+=/usr/share/vim/vimfiles/ " For Gentoo syntax highlighting 
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
set rtp+=~/.config/nvim/bundle/
call plug#begin()
" let Vundle manage Vundle (required)
Plug 'VundleVim/Vundle.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
" Temporary(?) Plugins and their Justifications
" Plugin 'ARM9/arm-syntax-vim' " (for CS 388 / Embedded Systems)

" All plugins must be added before the following line 
call plug#end()
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:airline_powerline_fonts = 1 " Required to use Powerline glyphs in airline
let g:airline_theme='gruvbox'
filetype plugin indent on " allows auto-indenting depending on file type


