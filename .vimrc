"""""""""""""""""""""""""""""""""""
"   Useful Vim Startup Commands   "
"""""""""""""""""""""""""""""""""""

" TO INSTALL, RUN: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Vim plugins
call plug#begin()

" Status line and color scheme
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" Git stuff
Plug 'tpope/vim-fugitive'

" Cheap man's nnn
Plug 'junegunn/fzf'

" Fancy grep
Plug 'mileszs/ack.vim'

" Nice tree explorer
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Explore buffers and find files
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tlib_vim'

" Syntax flagging
Plug 'dense-analysis/ale'

" Easy way to comment - use gcc or gc#
Plug 'tpope/vim-commentary'

" Yank stack, self-explanitory
Plug 'maxbrunsfeld/vim-yankstack'

" Tags - use F8
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/tagbar'

" Indent line char lines
" Toggle by :IndentLinesToggle
Plug 'Yggdroot/indentLine'

" More simple auto-complete
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'

" Auto-complete plugins
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Add a undo history
Plug 'mbbill/undotree'

" End Plugins
call plug#end()

" Remapping plug keybindings
map <leader>g :Ack
map <leader>ss :setlocal spell!<cr>
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Close NerdTree if last file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
" Use tab to expand trigger with ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Function windowed plugin keybindings
nmap <F6> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Remove the press enter prompt
" silent !<command>
" No .*.swp files
set noswapfile

" Vertical splitting for opening tags
nnoremap <C-W><C-V>f :exec "vert norm <C-V><C-W>f"<CR>
nnoremap <C-W><C-V>[ :exec "vert norm <C-V><C-W>["<CR>

" Set line numbers and wrapping
set relativenumber number
" set linebreak
" set showbreak=+++
" set textwidth=100
set showmatch
set visualbell

" Set the tabs to be 4 spaces
set tabstop=4
set softtabstop=4
"set expandtab

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
"highlight ColorColumn ctermbg=red
"set colorcolumn=81

" Auto remove whitespace at end of lines when saving file
autocmd BufWritePre * %s/\s\+$//e


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

let g:airline#extensions#tagbar#enabled = 1

