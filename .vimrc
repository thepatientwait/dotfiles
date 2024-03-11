:set notermguicolors t_Co=16
:set bg=dark

set relativenumber

:syntax enable

:colorscheme Base2Tone_SpaceDark
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

:set rtp+=/home/herb/.local/lib/python3.10/site-packages/powerline/bindings/vim
:set laststatus=2

vnoremap <C-V> "0p 
vnoremap <C-C> "0y
