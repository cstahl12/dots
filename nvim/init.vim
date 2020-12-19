call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Adds closing brackets, parents, etc
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Language agnostic commenting, [count]<leader>cc
Plug 'scrooloose/nerdcommenter'

" Auto detect spacing for existing projects 
Plug 'tpope/vim-sleuth'

" Git icons
Plug 'airblade/vim-gitgutter'

Plug 'machakann/vim-highlightedyank'

" Gruvbox colors
Plug 'morhetz/gruvbox'

" code complete, must have node.js installed
" must install language, e.g. :CocInstall coc-python
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

" set colorscheme
colorscheme gruvbox

" fuzzy finder key
map ; :Files<CR>

inoremap jk <ESC>
let mapleader = " "

" function to split panels
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" code complete configuration
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
