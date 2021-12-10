call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Themes
Plug 'cocopon/iceberg.vim'
Plug 'Zabanaa/neuromancer.vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'nightsense/carbonized'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'vim-airline/vim-airline'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-surround'
Plug 'codota/tabnine-vim'
Plug 'beeender/Comrade'
Plug 'tribela/vim-transparent'


call plug#end()
"deoplete
let g:deoplete#enable_at_startup = 1
" FZF
map <C-f> :FZF<CR>
"sets
set termguicolors
set cursorline
set ruler
set nu rnu
set background=dark
"ColourScheme
colorscheme shades_of_purple

let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'
let g:airline_powerline_fonts = 1
let g:floaterm_keymap_toggle = '<C-space>'

"ale
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1

" Disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" Set proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set laststatus=2


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
