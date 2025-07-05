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

" Window swaps
Plug 'wesQ3/vim-windowswap'

" LSP and autocomplete support
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'

" Productivity tools
" Plug 'itchyny/calendar.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
" Plug 'lervag/wiki.vim'

call plug#end()



""""""""""""""""""""""""""""
"      VIM Remappings      "
""""""""""""""""""""""""""""

" Change leader key to space
let mapleader = " "

" Remapping plug keybindings
map <leader>ss :setlocal spell!<cr>

" Easy access to files and tags with simple leader key
noremap <leader>F     :Files<cr>
noremap <leader>T     :Tags<cr>
noremap <leader>b     :Buffers<cr>
noremap <leader>M     :Marks<cr>
noremap <leader>L     :<cr>
noremap <leader>G     :<cr>
noremap <leader>R     :Rg<cr>
noremap <leader>B     :bp<cr>
noremap <leader>s     yiw/<c-r>"<cr>
noremap <leader>h     :syntax off<cr>
noremap <leader>r     :source ~/.vimrc<cr>
noremap <leader><c-s> :mksession! ~/.recent_session.vim<cr>
noremap <leader><c-r> :source ~/.recent_session.vim<cr>
noremap <leader>e     :e!<cr>

" Quick toggle floating terminal
nnoremap <silent> @N :FloatermNew<cr>
tnoremap <silent> @N <c-\><c-n>:FloatermNew<cr>
nnoremap <silent> @n :FloatermNext<cr>
tnoremap <silent> @n <c-\><c-n>:FloatermNext<cr>
nnoremap <silent> @@ :FloatermToggle<cr>
tnoremap <silent> @@ <c-\><c-n>:FloatermToggle<cr>

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
nnoremap <s-up>    <c-w>k
nnoremap <s-down>  <c-w>j
nnoremap <s-left>  <c-w>h
nnoremap <s-right> <c-w>l

" Easier word/line movement with using control arrows
nnoremap <s-up>    :-3<cr>
nnoremap <s-down>  :+3<cr>
nnoremap <s-left>  b
nnoremap <s-right> w

nnoremap <silent> <leader>< :vertical resize -4<cr>
nnoremap <silent> <leader>> :vertical resize +4<cr>
nnoremap <silent> <leader>= <c-w>=

let g:windowswap_map_keys = 0
nnoremap <silent> <leader>S :call WindowSwap#EasyWindowSwap()<cr>

nnoremap <leader>zi :tab split<cr>
nnoremap <leader>zo :tab close<cr>



""""""""""""""""""""""""""""
"     General Settings     "
""""""""""""""""""""""""""""

" Set the map leader
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" Close NerdTree if last file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" No .*.swp files
set noswapfile

" Set line numbers and wrapping
set relativenumber
set number
set showmatch
set visualbell

" Allow normal pasting
set paste

" Set the mouse to scroll the screen and select
set mouse=a

" Autocomplete file tabbing in cmd mode
set wildmode=longest,list,full
set wildmenu

" Show currently typed commands on bottom of vim screen
set showcmd

" Colors and themes
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
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=red guibg=red ctermfg=white guifg=white
"   autocmd BufEnter * match OverLength /\%120v.*/
" augroup END

" Auto remove whitespace at end of lines when saving file
" autocmd BufWritePre * %s/\s\+$//e

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' && &buftype != 'quickfix' | silent! NERDTreeMirror | endif

" Remove margins for fzf in vim since the window already floats
let $FZF_DEFAULT_OPTS = ""

" Close terminal automatically once shell exits
let g:floaterm_autoclose = 2

" Needed for vimwiki
set nocompatible
filetype plugin on

" Adjust syntax and pathing for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

" Wikivim directory
" let g:wiki_root = '~/.wiki'

" Fix backspace on some systems
set backspace=indent,eol,start

if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

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

function! ToggleNumbers()
  if &number || &relativenumber
    set nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunction
nnoremap <leader>n :call ToggleNumbers()<cr>

function! ToggleColumnHighlight()
  if exists("g:column_highlight_enabled") && g:column_highlight_enabled
    set colorcolumn=
    let g:column_highlight_enabled = 0
    echo "Column highlight disabled"
  else
    highlight ColorColumn ctermbg=red guibg=red ctermfg=white guifg=white
    set colorcolumn=120
    let g:column_highlight_enabled = 1
    echo "Column highlight enabled at 120"
  endif
endfunction
nnoremap <leader>h :call ToggleColumnHighlight()<cr>

function! UseTabs()
  set tabstop=4
  set shiftwidth=4
  set noexpandtab
  set autoindent
endfunction

function! UseSpaces()
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set softtabstop=0
  set autoindent
  set smarttab
endfunction

call UseSpaces()
au! BufWrite,FileWritePre *.py, *.c call UseSpaces()
