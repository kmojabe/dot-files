" Specificy a directory for plugins
call plug#begin('~/.vim/plugged')

" coc.preferences.formatOnSaveFiletypes': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'ctrlpvim/ctrlp.vim'	  " CtrlP
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'ruanyl/vim-gh-line'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

nmap <C-e> :NERDTreeToggle<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux
set rnu
set expandtab " Keep tabs as tabs
set tabstop=2
set shiftwidth=2
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <leader>f  <Plug>(coc-format-selected)

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

let mapleader = ","

function! LogCommand()
  if expand("%:p")=~".php"
    return "slog"
  elseif expand("%:p")=~".py"
    return "print"
  elseif expand("%:p")=~".hpp"
    return "Log"
  elseif expand("%:p")=~".cpp"
    return "Log"
  else
    return "console.log"
  endif
endfunction
map <leader>ih :let @l=LogCommand()<cr>O<esc>"lpa();<left><left>"here"<esc>j
map <leader>is :let @l=LogCommand()<cr>O<esc>"lpa();<left><left>"log: "<left>
map <leader>iv y:let @l=LogCommand()<cr>O<esc>"lpa();<esc>hha"<esc>pa", <esc>p
map <leader>il yiw:let @l=LogCommand()<cr>O<esc>"lpa();<esc>hha"<esc>pa", <esc>p
map <leader>dl :let @*=LogCommand()<cr>:g/<c-v>(/d<cr>

function! GithubRoot()
  let b:branch = system(“git rev-parse --abbrev-ref HEAD”)
  return “https://github.com/tensil/lightdesk/blob/” . b:branch . ‘/’
endfunction
function! GHURL() range
  if a:firstline == a:lastline
    let b:url=GithubRoot().expand(“%”).“#L”.a:firstline
  else
    let b:url=GithubRoot().expand(“%”).“#L”.a:firstline.“-L”.a:lastline
  endif
  let @*=b:url
  let @u=substitute(b:url, ‘#’, ‘\\#‘, ‘’)
endfunction
command! -range GHURL <line1>,<line2> call GHURL()
map <leader>yl :GHURL<cr>
map <leader>yb <leader>yl:Open <C-R>u<cr>
