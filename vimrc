"""""""""""""""""""""""""""""""""""
"                                 "
"   Useful Vim Startup Commands   "
"                                 "
"""""""""""""""""""""""""""""""""""

" To install, run:
" 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" In vim: ':PlugInstall'



""""""""""""""""""""""""""""
"        VIM Plugins       "
""""""""""""""""""""""""""""

call plug#begin()

" Add markdown support
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Status line and color scheme
Plug 'vim-airline/vim-airline'
Plug 'nordtheme/vim'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Better grep
Plug 'mileszs/ack.vim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Nice tree explorer
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Syntax flagging
Plug 'dense-analysis/ale'

" Easy way to comment - use gcc or gc#
Plug 'tpope/vim-commentary'

" Tags - use F8
Plug 'preservim/tagbar'

" Add a undo history
Plug 'mbbill/undotree'

" Floaty terminal inside of vim
Plug 'voldikss/vim-floaterm'

" Start page for vim
Plug 'mhinz/vim-startify'

" LSP and autocomplete support
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'

" Productivity tools
" Plug 'itchyny/calendar.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'

call plug#end()



""""""""""""""""""""""""""""
"      VIM Remappings      "
""""""""""""""""""""""""""""

" Change leader key to space
let mapleader = " "

" Remapping plug keybindings
map <leader>ss :setlocal spell!<cr>

" Easy access to files and tags with simple leader key
noremap <leader>F :Files<cr>
noremap <leader>T :Tags<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>M :Marks<cr>
noremap <leader>R :Rg<cr>
noremap <leader>N :FloatermNew<cr>
noremap <leader>B :bp<cr>
noremap <leader>s yiw/<c-r>"<cr>
noremap <leader>r :source ~/.vimrc<cr>

" Quick toggle floating terminal
nnoremap <silent> @@ :FloatermToggle<cr>
tnoremap <silent> @@ <c-\><c-n>:FloatermToggle<cr>

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-l> :wincmd l<cr>

" Fixing some odd key mappings in some terminal emulators
map [1;5A <c-up>
map [1;5B <c-down>
map [1;5D <c-left>
map [1;5C <c-right>

map [1;2A <s-up>
map [1;2B <s-down>
map [1;2D <s-left>
map [1;2C <s-right>

" Quick remappings for tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablest<CR>
noremap <leader>] gt

" Remove highlighting
nnoremap <return> :noh<CR>

" Function windowed plugin keybindings
nmap     <f6> :NERDTreeToggle<cr>
nmap     <f7> :TagbarToggle<cr>
nnoremap <f8> :UndotreeToggle<cr>

" Vertical splitting for opening tags
nnoremap <c-w><c-v>f :exec "vert norm <c-v><c-w>f"<cr>
nnoremap <c-w><c-v>[ :exec "vert norm <c-v><c-w>["<cr>

" Remap moving around in file using shift
nnoremap <s-up>    <c-w>j
nnoremap <s-down>  <c-w>k
nnoremap <s-left>  <c-w>h
nnoremap <s-right> <c-w>l

" Easier word/line movement with using control arrows
nnoremap <s-up>    :-3<cr>
nnoremap <s-down>  :+3<cr>
nnoremap <s-left>  b
nnoremap <s-right> w



""""""""""""""""""""""""""""
"     General Settings     "
""""""""""""""""""""""""""""

" Close NerdTree if last file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" No .*.swp files
set noswapfile

" Set line numbers and wrapping
set relativenumber
set number
set showmatch
set visualbell

" Set the mouse to scroll the screen and select
set mouse=a

" Autocomplete file tabbing in cmd mode
set wildmenu

" Show currently typed commands on bottom of vim screen
set showcmd

" Colors and themes
" if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" set termguicolors
syntax on
colorscheme nord

" Search highlighting
set smartcase
set showmatch
set incsearch
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Black

" Tab colors
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine     ctermfg=Black ctermbg=LightGray
hi TabLineSel  ctermfg=Black ctermbg=Yellow

" Cursor Line Highlighing
highlight CursorLine cterm=NONE ctermbg=0x434C5E ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Set up 120 character width (highlight anything beyond it)
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=red guibg=red ctermfg=white guifg=white
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END


" Auto remove whitespace at end of lines when saving file
autocmd BufWritePre * %s/\s\+$//e

" Set better formatted pasting
set paste

" Set the tabs to be 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' && &buftype != 'quickfix' | silent! NERDTreeMirror | endif

" Remove margins for fzf in vim since the window already floats
let $FZF_DEFAULT_OPTS = ""
" substitute($FZF_DEFAULT_OPTS, "--margin 10%", "", "")

" Close terminal automatically once shell exits
let g:floaterm_autoclose = 2

" Needed for vimwiki
set nocompatible
filetype plugin on

" Adjust syntax and pathing for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

" Use undo file and use specific undo directory
set undofile
set undodir=/home/$USER/.vimundo/


"""""""""""""""""""""""""""""""
"   Plugin Settings Configs   "
"""""""""""""""""""""""""""""""

" Set width and height of floatterm windows
let g:floaterm_width = 0.75
let g:floaterm_height = 0.75

" air-line
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''
let g:airline_symbols.linenr     = ''

"  Allow for adjusting tab settings for python files
let g:python_recommended_style = 0
