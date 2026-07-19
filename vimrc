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
" nnoremap <SPACE> <Nop>
let mapleader = ' '

" Remapping plug keybindings
map <leader>ss :setlocal spell!<cr>

" Easy access to files and tags with simple leader key
noremap <leader>F :Files<cr>
noremap <leader>T :Tags<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>M :Marks<cr>
noremap <leader>L :Lines<cr>
noremap <leader>G :BLines<cr>
noremap <leader>R :Rg<cr>
noremap <leader>B :bp<cr>
noremap <leader>s yiw/<c-r>"<cr>N
noremap <leader>r :source ~/.vimrc<cr>
noremap <leader><c-s> :mksession! ~/recent_session.vim<cr>
noremap <leader><c-r> :source ~/recent_session.vim<cr>
noremap <leader>e :e!<cr>
noremap <leader>p :set nospell<cr>
noremap <leader>w :w<cr>

nnoremap <silent> @N :FloatermNew<CR>
tnoremap <silent> @N <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> @n :FloatermNext<CR>
tnoremap <silent> @n <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> @@ :FloatermToggle<CR>
tnoremap <silent> @@ <C-\><C-n>:FloatermToggle<CR>

" Decode xterm-style modified arrows before mapping them.
silent! execute "set <xUp>=\<Esc>[@;*A"
silent! execute "set <xDown>=\<Esc>[@;*B"
silent! execute "set <xRight>=\<Esc>[@;*C"
silent! execute "set <xLeft>=\<Esc>[@;*D"
set ttimeout
set ttimeoutlen=100

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
nnoremap <leader><return> :noh<CR>

" Function windowed plugin keybindings
nmap     <f6> :NERDTreeToggle<cr>
nmap     <f7> :TagbarToggle<cr>
nnoremap <f8> :UndotreeToggle<cr>

" Vertical splitting for opening tags
nnoremap <c-w><c-v>f :exec 'vert norm <c-v><c-w>f'<cr>
nnoremap <c-w><c-v>[ :exec 'vert norm <c-v><c-w>['<cr>

" Remap moving around in splits using shift
nnoremap <c-up>    <c-w>k
nnoremap <c-down>  <c-w>j
nnoremap <c-left>  <c-w>h
nnoremap <c-right> <c-w>l

" Easier line/column movement with shift keys
nnoremap <silent> <s-up>    10k
nnoremap <silent> <s-down>  10j
nnoremap <silent> <s-left>  10h
nnoremap <silent> <s-right> 10l

xnoremap <silent> <s-up>    10k
xnoremap <silent> <s-down>  10j
xnoremap <silent> <s-left>  10h
xnoremap <silent> <s-right> 10l

inoremap <silent> <s-up>    <C-o>10k
inoremap <silent> <s-down>  <C-o>10j
inoremap <silent> <s-left>  <C-o>10h
inoremap <silent> <s-right> <C-o>10l

nnoremap <silent> <s-k> 10k
nnoremap <silent> <s-j> 10j
nnoremap <silent> <s-h> 10h
nnoremap <silent> <s-l> 10l

xnoremap <silent> <s-k> 10k
xnoremap <silent> <s-j> 10j
xnoremap <silent> <s-h> 10h
xnoremap <silent> <s-l> 10l

nnoremap <silent> <leader>< :vertical resize -4<CR>
nnoremap <silent> <leader>> :vertical resize +4<CR>
nnoremap <leader>= <c-w>=

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>S :call WindowSwap#EasyWindowSwap()<CR>

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

" Keep paste mode off so insert-mode mappings work; bracketed paste handles normal terminal pastes.
set nopaste

" Enable mouse and trackpad scroll support in terminal Vim.
set mouse=a

" Autocomplete file tabbing in cmd mode
set wildmode=longest,list,full
set wildmenu

" Show currently typed commands on bottom of vim screen
set showcmd

" Colors and themes
syntax on
" set termguicolors
colorscheme nord

" Search highlighting
set ignorecase
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
set cursorcolumn

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
let $FZF_DEFAULT_OPTS = ''

" Close terminal automatically once shell exits
let g:floaterm_autoclose = 2

" Needed for vimwiki
set nocompatible
filetype plugin on

" Adjust syntax and pathing for vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

" Wikivim directory
" let g:wiki_root = '~/.wiki'

" Allow backspace to work
set backspace=indent,eol,start

if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" tell it to use an undo file
set undofile

" Keep folding enabled, but start with all folds open
set foldlevelstart=99



""""""""""""""""""""""""""""
"   Airline Plug Configs   "
""""""""""""""""""""""""""""

let g:floaterm_scroll_limit = 100000

" Set width and height of floatterm windows
let g:floaterm_width = 0.75
let g:floaterm_height = 0.75

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols

function! ToggleNumbers()
  if &number || &relativenumber
    set nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunction
nnoremap <leader>n :call ToggleNumbers()<cr>

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax on
  endif
endfunction
nnoremap <leader>x :call ToggleSyntax()<cr>

function! ToggleColumnHighlight()
  if exists("g:column_highlight_enabled") && g:column_highlight_enabled
    set colorcolumn=
    let g:column_highlight_enabled = 0
    echo 'Column highlight disabled'
  else
    highlight ColorColumn ctermbg=red guibg=red ctermfg=white guifg=white
    set colorcolumn=120
    let g:column_highlight_enabled = 1
    echo 'Column highlight enabled at 120'
  endif
endfunction
nnoremap <leader>h :call ToggleColumnHighlight()<CR>

" Set the tabs to be 2 spaces
function! UseTabs()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces(...)
  let l:spaces = a:0 ? a:1 : 2
  if l:spaces <= 0
    echoerr 'UseSpaces() requires a positive number of spaces'
    return
  endif

  let &tabstop = l:spaces
  let &shiftwidth = l:spaces
  set expandtab     " Always uses spaces instead of tab characters (et).
  let &softtabstop = l:spaces
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

call UseSpaces()
au! BufWrite,FileWritePre *.py,*.c call UseSpaces()
