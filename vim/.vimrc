" Enable syntax highlighting
syntax enable

" Indentation settings for C
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Display line numbers
set number
set relativenumber

" Show matching brackets
set showmatch

" Enable mouse support
set mouse=a

" Enable search highlighting
set hlsearch
set incsearch

" Enable file type detection
filetype plugin indent on

" Show current position
set ruler

" Maintain undo history
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undofile
set undodir=~/.vim/undodir

" Enable clipboard support
set clipboard=unnamedplus

" Enable format options for C
set formatoptions+=cro

" Show command in bottom bar
set showcmd

" Configure status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Better command-line completion
set completeopt=menu,menuone,noselect
set wildmode=longest,list
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight current line
set cursorline

" Set encoding
set encoding=utf-8

" C specifc settings
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType c setlocal complete-=i
autocmd FileType c setlocal cindent
autocmd FileType c setlocal path+=/usr/include

" Set make program
set makeprg=gcc\ -std=gnu11\ -Wall\ -Wextra\ -D_POSIX_C_SOURCE=200809L\ -o\ %<\ %

call plug#begin('~/.vim/plugged')

" Code completion
Plug 'ycm-core/YouCompleteMe'

" File explorer
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax checking
Plug 'dense-analysis/ale'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Better syntax highlighting for C
Plug 'octol/vim-cpp-enhanced-highlight'

" Auto pairs for brackets
Plug 'jiangmiao/auto-pairs'

" Comment/uncomment tool
Plug 'preservim/nerdcommenter'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags for code navigation
Plug 'preservim/tagbar'

" Color scheme (choose one)
" Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

call plug#end()

set background=dark
set termguicolors
" Enable true color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" let g:gruvbox_contrast_dark = 'medium'
syntax on
colorscheme onedark
set cursorline
highlight CursorLine guibg=#3c3836

" Tag Configuration
nmap <F8> :TagbarToggle<CR>

" YCM Configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_key_list_stop_completion = ['<Enter>']
let g:ycm_semantic_triggers = {
    \ 'c,cpp,objc': [ 're!\w{2}', '_' ],
    \ }
" NERDTree Configuration
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.o$', '\~$']
" Start NERDTree when Vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" ALE Configuration
let g:ale_linters = {
\   'c': ['gcc', 'clang'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_c_gcc_options = '-std=gnu11 -Wall -Wextra -D_POSIX_C_SOURCE=200809L'
let g:ale_c_clang_options = '-std=gnu11 -Wall -Wextra -D_POSIX_C_SOURCE=200809L'

" FZF Configuration
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
let g:fzf_layout = { 'down': '~40%' }

" C/C++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Auto-pairs Configuration
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" NERDCommenter Configuration
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" UltiSnips Configuration
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"
