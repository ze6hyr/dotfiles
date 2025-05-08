" Load key mappings
source ~/.vim/keymaps.vim
" source ~/.vim/statusbar.vim

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'julien/vim-colors-greena'
Plug 'ap/vim-css-color'     " Show CSS colors in their respective color

" Plug 'dylanaraps/wal.vim'

call plug#end()

" General Settings
colorscheme retrobox        " ColorScheme for Vim sorbet, retrobox
set cursorline              " Active cursor line
set termguicolors           " Maximum Color support
set clipboard=unnamedplus   " Connect system Clipboard
set clipboard=unnamed       " Connect system Clipboard
set background=dark         " dark background
set guicursor = ""          " Block Cursor
set scrolloff=9             " this means 9 lines gap from top or bottam
set colorcolumn=80
set number                  " Line numbers
set relativenumber          " Relative line numbers
syntax on                   " Enable syntax highlighting
set tabstop=4               " Number of spaces per tab
set shiftwidth=4            " Auto-indent spaces
set expandtab               " Use spaces instead of tabs
set encoding=utf-8          " Ensure proper encoding
set noswapfile              " Disable swap files
set nobackup                " Disable backup files
set nowritebackup           " Disable write backups
set mouse=a                 " Enable Mouse in Vim
set lazyredraw              " Only redraw when necessary
set ttyfast                 " Speed up screen redrawing
set updatetime=50

" let &t_SI = "\e[1 q"  " Blinking block cursor in insert mode
" let &t_EI = "\e[2 q"  " Non-blinking block cursor in normal mode

" Hide the statusline:
" set laststatus=0 "Hides the statusline entirely.
" set statusline=%F%m%r%h%w%=
" set titlestring=%f
" set titlestring=%Fset
set statusline =%F%m%r%h%w%=%y-[%l:%c]
set laststatus=2

" statusline colorset
hi statusline guibg=#2a273f guifg=#908caa cterm=none


" Enable line numbers in Netrw
autocmd Filetype netrw setlocal number
autocmd Filetype netrw setlocal relativenumber
" this will save diffrent repo for undotree
if has("persistent_undo")
    let target_path = expand('~/.vim_undos') " Change the path to your desired location for Vim
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir = target_path
    set undofile
endif

" Set background to transparent
" hi Normal guibg=NONE
" hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE
" hi LineNr ctermbg=NONE guibg=NONE
