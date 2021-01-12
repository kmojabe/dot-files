" Specificy a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'ctrlpvim/ctrlp.vim'	  " CtrlP
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.vim'
Plug 'tmhedberg/SimpylFold'

call plug#end()

nmap <C-e> :NERDTreeToggle<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux
set rnu
set expandtab " Keep tabs as tabs
set tabstop=2
set shiftwidth=2
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
