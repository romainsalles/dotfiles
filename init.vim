set shell=/bin/bash
" vim:fdm=marker

set shell=/bin/sh
let $PAGER=''
let mapleader="," " remapping leaderi
let g:ruby_path = system('rvm current')


" -----------------------------------------------------------------------------
" Vim-plug
" -----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" A tree explorer plugin for navigating the filesystem
" :source ~/.config/nvim/init.vim
" :PlugInstall
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/switch.vim' " gs to switch patterns
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter' " <leader>c<space>
call plug#end()

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-t> :FZF!<CR>

" -----------------------------------------------------------------------------
" Personal config
" -----------------------------------------------------------------------------
let mapleader="\<space>"
set tabstop=2 shiftwidth=2 expandtab

" silver searcher
let g:ackprg = 'ag --vimgrep'

" line numbers on the left
set relativenumber
set number
" column number in the bottom right
:set ruler

map <C-s> <Esc>:w<CR>
tnoremap <C-s> <C-\><C-n>

" utilise altercation/vim-colors-solarized
set background=dark
colorscheme solarized

" Gestion des splits
" ==================
set splitright
set splitbelow

" Fugitive
" ========
nmap <leader>s :Gstatus<cr>
nmap <leader>d :Gdiff<cr>
nmap <leader>b :Gblame<cr>
" reset le fichier à son dernier état commité
nmap <leader>r :Gread<cr>
nmap <C-j> ]c
nmap <C-k> [c

" Copy into system clipboard
set clipboard+=unnamedplus

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" highlights the background in red for text that goes over the 80 column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Remove white space at the end of lines on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces() " specific files
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() " all files

" Silver searcher
" ---------------
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  let g:ag_highlight=1

  " Grep word under cursor
  "nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
endif

" Ruby on Rails
" ==============================================================================
" new Hash syntax
map <leader>h :%s/:([\w\d_]+)(\s*)=>/\1:/g<cr>
