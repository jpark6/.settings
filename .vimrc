" Syntax Hightlighting
if has("syntax")
  syntax on
endif

set hls " hlsearch : hightlighting search keyword
set ai " autoindent
set ci " cindent
set si " smartindent
set ts=2 " tabspace
set sw=2 " shiftwidth
set expandtab " insert 2spaces replace tab
set autowrite " auto save when move another file
set autoread " read file when file changed 
set bs=eol,start,indent
set showmatch " hightlighting matched brakets, braces, parentheses
set ruler " statusbar
set incsearch
set ls=2 " laststatus " show statusbar always
set nu "number: show line number
set termguicolors " set vim true colors

" show whitespaces
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

" copy to os clipboard
set clipboard=unnamed

" locate cursor which last modified 
au BufReadPost * 
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
