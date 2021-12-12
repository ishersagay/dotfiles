call plug#begin('~/.config/nvim/plugins')

    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'vim-airline/vim-airline'
    Plug 'voldikss/vim-floaterm'
    "Themes
    Plug 'vim-airline/vim-airline-themes'
    Plug 'cocopon/iceberg.vim'

    Plug 'ryanoasis/vim-devicons'

call plug#end()


" floaterm
let g:floaterm_keymap_toggle = '<C-space>'

" theme
colorscheme iceberg

" airline theme
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1


" I need to sort out lspsaga

"lspconfig
lua << EOF
    require'lspconfig'.html.setup{}
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.jdtls.setup{}
    require'lspconfig'.jsonls.setup{}
    require'lspconfig'.pyright.setup{}
EOF

" ALE
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1

" FZF
map <C-f> :FZF<CR>

" NerdTree
nnoremap <C-n> :NERDTree<CR>
" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Sets
set number
set autoindent
syntax on
set cursorline
set ruler
set nu rnu

" Set proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set laststatus=2

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use CTRL+tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <C-tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Devicons
set encoding=utf8
set guifont=firacode\ Nerd\ Font\ 12
