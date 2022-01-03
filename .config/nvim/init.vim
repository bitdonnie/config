" Fish doesn't play well with others
set shell=/usr/bin/bash

" Install plugins if there are not installed
" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute "!curl -fLo /home/donvdkrogt/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * silent! PlugInstall
endif

" ==================================== 
" # START Plugins
" ====================================

silent! if plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"  - Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Language support

" -- Fish shell
Plug 'dag/vim-fish'

" -- Rust
Plug 'rust-lang/rust.vim'

" -- LaTeX
Plug 'lervag/vimtex'

" -- justfile's
Plug 'NoahTheDuke/vim-just'

call plug#end()
endif

" ==================================== 
" # END Plugins
" ====================================

" Use the filtype plugin to specify file type specific configurations
filetype plugin indent on

" Color schemes
set termguicolors
set background=dark
let base16colorspace=256

colorscheme base16-gruvbox-dark-hard
syntax on
" Brighter comments
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

" Lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format
nmap <silent> gfmt <Plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ====================================
" # START Keyboard shortcuts
" ====================================

" ; as :
nnoremap ; :

" use Ctrl+k for Esc
nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" No arrow keys --- force yourself to gain productivity
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ====================================
" # END Keyboard shortcuts
" ====================================


" ====================================
" # START GUI Settings
" ====================================

set background=dark
set guioptions-=T " Remove toolbar
set backspace=2 " Backspace over newlines
set relativenumber " Relative line numbers
set number " Also show current absolute line
set colorcolumn=80 " and give me a colored column
set mouse=a " Enable mouse usage (all modes) in terminals

" ====================================
" # END GUI Settings
" ====================================

" ====================================
" # START PLUGIN Settings
" ====================================

" Rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
" let g:rust_clip_command = 'xclip -selection clipboard'

" vimtex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_engine = 'lualatex'
" use SumatraPDF if you are on Windows
let g:vimtex_view_method = 'zathura'

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
