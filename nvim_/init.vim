au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 =Escape'

packadd! dracula
syntax enable
colorscheme dracula
noh
set clipboard=unnamedplus
