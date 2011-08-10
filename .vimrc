" Required by pathogen to load all vim plugin available in bundle directory
call pathogen#infect()
" syntax on and filetype should be after calling to pathogen
syntax on						                                " 
filetype plugin indent on				                    " all file type plugin will be available
set ruler						                                " show the line number on the bar
set autoread					                            	" watch for file change
set number						                              " set line number
set showcmd
set nocompatible					                          " vim, not vi
set autoindent smartindent				                  " enable auto/smart indentation
set expandtab						                            " convert spaces to tabs
set smarttab						                            " tab and backspace are smart .. I don't know what does it means
set tabstop=2						                            " 2 spaces for one tab
set shiftwidth=2					                          " 2 spaces for indentation
set noerrorbells
set linebreak
set cmdheight=2						                          " set command line 2 lines high
set undolevels=1000
set incsearch 					                          	" incremental search
set ignorecase 						                          " search ignoring case
set hlsearch						                            " highlight search
set showmatch 						                          " show matching bracket
set mouse=a						                              " enable mouse support
set mousehide						                            " hide mouse when typing
set backup
set backupdir=~/.backup
set history=200
map Y y$						                                " yank from cursor to end of line
imap jj <Esc>						                            " map jj to escape
map <C-tab> gt						                          " control tab for switching tab
map <C-S-tab> gT
map tt :NERDTreeToggle<cr>
nmap <Space> <C-w><C-w>				                    	" switching between windows..
colorscheme molokai
