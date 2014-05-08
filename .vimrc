call pathogen#infect()
filetype off
let g:VimuxUseNearestPane = 0

" go stuff
if filereadable("/usr/local/Cellar/go/1.1.2/libexec/misc/vim/readme.txt")
  set runtimepath+=/usr/local/Cellar/go/1.1.2/libexec/misc/vim
endif

" use the old vim regexp engine if running 7.4 or higher.  ruby syntax highlighting is bad enough on the old engine; it's unuseable on the new one
if version >= 704
  set re=1
endif

syntax on "turn this off if vim is terribly laggy on some ruby files with big string literals

filetype plugin indent on

colorscheme molokai

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:source ~/.vimrc<cr>

let maplocalleader = ","
map <localleader>t <Plug>RubyTestRun
map <localleader>l <Plug>RubyTestRunLast
let g:rubytest_cmd_testcase = "clear; ruby %p -n \"/%c/\""

" right time to bite the bullet
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
noremap <Left> gT
noremap  <Right> gt
inoremap <Left> <Esc>gT
inoremap  <Right> <Esc>gt

" general mappings
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set noswapfile                    " swap files are a pain in the ass

set shell=/bin/sh                    " otherwise using zsh with rvm doesn't work

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" searching
"set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" backup and swp
"set backupdir=~/.vim/_backup//    " where to put backup files.
"set directory=~/.vim/_temp//      " where to put swap files.
set backupskip=/tmp/*,/private/tmp/* " don't backup files in these directories (eg crontab)

" map :W to :w because I have fat fingers
nnoremap :W :w
" map :Q to :q because I have fat fingers
nnoremap :Q :q

" map H and L to page one screen left and right respectively
nnoremap H 2zH
nnoremap L 2zL

" map f5 to lock scrolling and set horizontal scroll.  useful when using vim as a mysql pager
nnoremap <f5> :set scrollopt+=hor<cr>:windo set scrollbind<cr>

" Ruby stuff

" map (shift "section" ie the key to the left of 1) in insert mode to create a ruby string interpolated variable
inoremap ± #{}<left>
inoremap § #
noremap § #

" map ,l in insert mode to hash rocket
inoremap <localleader>l <space>=><space>

" ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
let g:ctrlp_root_markers = ['Capfile']
let g:ctrlp_max_files = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc

" map localleader r to execute as ruby, regardless of content - overrides
" rubytest plugin
nnoremap <localleader>r :!clear; ruby '%'<cr>

" NERDCommenter stuff
" map <localleader>c <plug>NERDCommenterToggle
map <localleader>c gcc

" show and hide NERDTree
map <localleader>tn :NERDTreeToggle<cr>
" open files / directories with space
let NERDTreeMapActivateNode='<space>'
" show the current file in a new tree
map <localleader>tf :NERDTreeFind<cr>

" Syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" remove whitespace
nnoremap <localleader>w :%s/\s\+$//<cr>

" automatically remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" pretty format xml
nnoremap <localleader>x :set filetype=xml<cr>gg=G<cr>
nnoremap <localleader>X :%s/></>\r</g<cr>:0<cr>=:$<cr>gg=G<cr>

" rails vim mappings
" switch between related files
nnoremap <localleader>aa :AV<cr>

" close all tabs except NERDtree
nnoremap <leader>q :tabfirst<cr>:tabo<cr>

" change tabs with ctrl shift h | l
nmap <C-S-l> gt
nmap <C-S-h> gT
imap <C-S-l> <Esc>gt
imap <C-S-h> <Esc>gT

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" powerline stuff - OSX only
if filereadable("/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim")
  python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
  set laststatus=2 " Always display the statusline in all windows
  set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
endif

"toggle line wrapping
nnoremap <localleader>w :set wrap!<cr>

" disable auto comment repeat
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"vim git gutter causes lag if it eagerly refreshes - disable so that it only refreshes on read and write
let g:gitgutter_eager = 0

"toggle vim gitgutter
nnoremap <localleader>g :GitGutterToggle<cr>

" pry stuff
nnoremap <localleader>p Obinding.pry<esc>
nnoremap <localleader>P :Ack! binding.pry<cr>

"vim-coffee-script stuff
" for the syntax checking on save to work we need the coffee compiler installed.  On OSX do:
" brew install node
" npm -g install coffee-script
" au BufWritePost *.coffee silent make -o /dev/null | cwindow | redraw!
" au BufWritePost *.coffee.erb silent make -o /dev/null | cwindow | redraw!

runtime macros/matchit.vim

" dbext.vim stuff
if filereadable('/Users/robanderson/.dbext.vim')
  source /Users/robanderson/.dbext.vim
endif

function! DBextPostResult(db_type, buf_nr)
  " If dealing with a MYSQL database
  if a:db_type == 'MYSQL'
    " Assuming the first column is an integer
    " highlight it using the WarningMsg color
    syn match logWarn '^\d\+'
    syn match logWarn '^|'
    hi def link logWarn		WarningMsg
  endif
endfunction
