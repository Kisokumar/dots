let g:coc_disable_startup_warning = 1
set linespace=3
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

inoremap " ""<left>
inoremap ' ''<left>
"inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Vim Aesthetic Conf
syntax on
set splitright
set splitbelow
set number
set showmatch
set expandtab
set autoindent
set hidden
set relativenumber
set cursorline
"set cursorcolumn
set clipboard+=unnamedplus
set tabstop=4
set timeoutlen=1000
set hlsearch
set ignorecase
set incsearch
set splitbelow
set smartindent
set shiftwidth=4
set nostartofline 
filetype plugin on
set background=dark
set fillchars+=vert:\
colorscheme jellybeans
highlight clear SignColumn
set scrolloff=15

"set colorcolumn=80                 "  sets a line for 80 character limit to make sure code looks neater
"set signcolumn=yes                 "  allows for column next to line numbers for errors
"set nowrap                         "  removes line wrapping

" Plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/ryanoasis/vim-devicons'   
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()                    

" using emmet (autocomplete for frontend)
let g:user_emmet_leader_key='<Tab>'

" gitgutter
 " Use fontawesome icons as signs
nmap <C-u> :GitGutterToggle<CR>
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
set updatetime=250

" Goyo config
let g:goyo_height=120
let g:goyo_width=90
let g:goyo_linenr=1

" new statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybean'

" Mapping scroll keys
nnoremap n jz.    
nnoremap m kz.
nnoremap k gk
nnoremap j gj

" Mapping other keys
inoremap jj <Esc>
vnoremap jj <Esc>
nnoremap <C-s> :w<CR>
nnoremap ; :
nnoremap - :set mouse=a<CR>
nnoremap = :set mouse=<CR>
nnoremap <tab> :><CR>
nnoremap <S-tab> :<<CR>

" Scroll between files
:map \ :n<CR>   
:map ' :N<CR> 

" Toggle scroll behaviour
:map <F2> :set so=999 <CR>                              
:map <F3> :set so=0 <CR>   

"  Cursor Mod
if has("autocmd") 
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[5 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"  Remember Cursor Pos
if has("autocmd") 
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Displays time
:map <F4> :echo 'Current time is  ' .strftime('%c')<CR>


" move line or visually selected block - alt+j/k
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <Esc>:m .+1<CR>==gi

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Press i to enter insert mode, and ii to exit insert mode.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""Old StatusBar Conf""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set laststatus=2                      make                         "
"set statusline=                       reset statusline             "
"set statusline+=%1*                   black on gray                "
"set statusline+=%F                    full filename                "
"set statusline+=\ %y                  filetype                     "
"set statusline+=\ %h                  help file flag               "
"set statusline+=\ %2*                 white on red                 "
"set statusline+=%m                    modified flag                "
"set statusline+=\ %r                  read only flag               "
"set statusline+=%=                    left/right separator         "
"set statusline+=%c,                   cursor column                "
"set statusline+=%l/%L                 cursor line/total lines      "
"set statusline+=\ \ %P                percent through file         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""HELP"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   :wq :x ZZ to save and exit                                      "
"   Ctrl+o switches to normal mode for one command                  "
"   0 to go the beginning of the line                               "
"   $ end of line                                                   "
"   f 'y' find first 'y' in sentence                                "
"   x to delete character after cursor                              "
"   dw delete word                                                  "
"   w moves 1 word forward                                          "
"   e moves to the end of the word                                  "
"   d2w deletes 2 words                                             "
"   dd deletes line                                                 "
"   p/P pastes deleted text after/before cursor                     "
"   r to replace letter after cursor                                "
"   ce deletes the word and places you in insert mode               "
"   G/gg to move to the bottom/top of file                          "
"   % to find a matching ),] or }                                   "
"   ? forward search                                                "
"   / backward search                                               "
"   :s/old/new/g to substitute new for old where g is glovally      "
"   :w to save file                                                 "
"   R to replace more than one character                            "
"   y operator to copy text using v visual mode and p to paste it   "
"   yw yanks one word                                               "
"   o/O opens a line below/above cursor                             "
"   a/A inserts text after the cursor/end of the line               "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
