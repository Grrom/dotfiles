set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set exrc
set secure
set relativenumber
set nu 
set noerrorbells 
set nowrap 
set noswapfile 
set nobackup 
set undodir=~/.config/nvim/undodir 
set undofile 
set incsearch 
set scrolloff=8 
set noshowmode 
set signcolumn=yes
set colorcolumn=80

" PLUGINS
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" navigation
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" language support
Plug 'dart-lang/dart-vim-plugin'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" utils
Plug 'git@github.com:krisajenkins/vim-projectlocal.git'
Plug 'git@github.com:Raimondi/delimitMate.git'

" themes
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" change theme
colorscheme nord
highlight Normal guibg=none
if (has("termguicolors"))
  set termguicolors
endif

" personal preferences
let mapleader = " "
inoremap jk <Esc>
nnoremap <leader>q :q <cr>
nnoremap <leader>w :w <cr>
inoremap  <Esc> dbi
nnoremap <silent>// :noh <cr>
nnoremap <leader>v :vsplit <cr>
"close all buffers exept the one that is open 
nnoremap <leader>kw :%bd<bar>e# <cr>
" navigation through buffers
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

let g:UltiSnipsExpandTrigger="<S-Tab>"

" integrated terminal
" open integrated terminal 
nnoremap <leader>t :bo sp <bar> term <cr>i
" Use ESC to exit insert mode in terminal
tnoremap jk <C-\><C-n>
" resize terminal
augroup myterm | au!
    au TermOpen * if &buftype ==# 'terminal' | resize 10 | vert resize 50 | endif
augroup end

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NvimTree
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 0
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>

" COC
" autocomplete
" pick suggestions with tab 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"choose first suggestion with enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" split and jump to definition  
nmap <silent> gd :call CocAction('jumpDefinition', 'bo vsplit')<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nnoremap <C-b> :bprevious <cr>
nnoremap <C-n> :bnext <cr>
nnoremap <C-q> :bd <cr>

"Flutter
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>fc :CocList --input=flutter commands <cr>
