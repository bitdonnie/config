set shell=/usr/bin/bash

" Install plugins if there are not installed
" download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute "!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * silent! PlugInstall
endif

" ==================================== 
" # START Plugins
" ====================================

silent! if plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'

call plug#end()
endif

" Rust color template
" Make sure to use a colorscheme from https://github.com/chriskempson/base16-vim/tree/master/colors
" http://chriskempson.com/projects/base16/
colorscheme base16-eighties

" Rust.vim settings
syntax enable
filetype plugin indent on

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
