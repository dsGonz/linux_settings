" ============================================================================
" | VIM-PLUG INITIALIZATION | "
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
        :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" | ACTIVE PLUGINS | "
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')


" Code commenter
Plug 'scrooloose/nerdcommenter'

" Syntax highlighting plugins
Plug 'peterhoeg/vim-qml' " .qml files
Plug 'tmux-plugins/vim-tmux' " tmux.conf

" Airline Theme for vim status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree: File explorer
Plug 'scrooloose/nerdtree'

" gruvbox: Retro Groove colorscheme with airline support
Plug 'morhetz/gruvbox'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :source %
    :PlugInstall
endif

" ============================================================================
" | COLOR SETTINGS | "
syntax enable
syntax on
set t_Co=256   " This is may or may not be needed.

" Saved colorschemes
"colorscheme molokai
"colorscheme vim-monokai-tasty
"colorscheme wallaby
"colorscheme tropikos
"colorscheme lizard256
"colorscheme mopkai
"colorscheme flattr
"colorscheme PaperColor 
"colorscheme onedark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

set background=dark

" ============================================================================
" Spaces and tabs
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=4
set smarttab
set autoindent

" ============================================================================
" Buffer settings
set hidden

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif

" ============================================================================
" UI config
set ls=2                " always show status bar
set number              " show line numbers
set numberwidth=5
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set colorcolumn=100     " # of characters before starting next line
highlight CursorLine cterm=bold gui=bold
filetype indent on      " load filetype-specific indent files
" set wildmenu            " visual autocomplete for command menu (press <TAB> while typing in command mode)
set wildmode=list:longest
set lazyredraw          " redraw only when we need to
set noshowmatch           " highlight matching [{()}]
set matchtime=3
highlight MatchParen cterm=bold

set backspace=indent,eol,start

" ============================================================================
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight (by pressing <SPACE> in command mode)
nnoremap <leader><space> :nohlsearch<CR>

" ============================================================================
" Code folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent

" ============================================================================
" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline#extensions#tabline#enabled = 1

" ============================================================================
" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

" ============================================================================
" Buffer shortcut
" Prev buffer
nmap <F6> :bp<CR>
" Next buffer
nmap <F7> :bn<CR>

" Signify ====================================================================
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_realtime = 1
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" =============================================================================
" CtrlP
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" Exclude files and directories using Vim's wildignore and CtrlP's own
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
" Use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

