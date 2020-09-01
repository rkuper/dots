"""""""""""""""""""""""""""""""""""
"   Useful Vim Startup Commands   "
"""""""""""""""""""""""""""""""""""

" TO INSTALL, RUN: $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

" Vim plugins
call plug#begin()
Plug 'tpope/vim-fugitive'                                " Git wrapper 
Plug 'junegunn/fzf'                                      " Cheap man's nnn
Plug 'junegunn/fzf.vim'                                  " Cheap man's nnn
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' } " Color theme
Plug 'vim-airline/vim-airline'                           " Status Line
Plug 'mileszs/ack.vim'                                   " Fancy grep
Plug 'preservim/nerdtree'                                " Nice tree explorer 
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'                                    " File finder 
Plug 'amix/open_file_under_cursor.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'                               " Simple text autocompletes
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'                              " Comment stuff out with 'gcc'
Plug 'maxbrunsfeld/vim-yankstack'                        " Get yanks command history
Plug 'vim-scripts/taglist.vim'                           " Similar to Ctags
Plug 'Valloric/MatchTagAlways'
call plug#end()

" Remapping plug keybindings
map <leader>g :Ack 
map ; :GFiles<CR>
map <leader>ss :setlocal spell!<cr>
map <leader>nt :NERDTreeToggle<CR>
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" No .*.swp files
set noswapfile
set pastetoggle=<F2>

" Vertical splitting for opening tags
nnoremap <C-W><C-V>f :exec "vert norm <C-V><C-W>f"<CR>
nnoremap <C-W><C-V>[ :exec "vert norm <C-V><C-W>["<CR>

" Set line numbers and wrapping
set number relativenumber
set linebreak
set showbreak=+++ 
set textwidth=100

" Other settings
set showmatch
set visualbell

" Set the tabs to be 2 spaces
set tabstop=2
set softtabstop=2
" set expandtab

" Set the mouse to scroll the screen and select
set mouse=a

" Autocomplete file tabbing in cmd mode
set wildmenu

" Show currently typed commands on bottom of vim screen
set showcmd

" Colors and themes
syntax on
colorscheme nord
" colorscheme elflord

" Tab colors
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine ctermfg=Black ctermbg=LightGray
hi TabLineSel ctermfg=Black ctermbg=Yellow

" Search highlighting
set cursorline
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
hi Search ctermbg=Red
hi Search ctermfg=LightGray

" Set up proper indenting
set smartindent
set cindent

" Set up 80 character width
" highlight ColorColumn ctermbg=red
" set colorcolumn=81



""""""""""""""""""""""""""""
"   Airline Plug Configs   "
""""""""""""""""""""""""""""

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
