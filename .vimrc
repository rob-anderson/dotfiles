call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme elflord

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

let maplocalleader = ","
map <localleader>t <Plug>RubyTestRun
map <localleader>l <Plug>RubyTestRunLast
map <localleader>r <Plug>RubyFileRun

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

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" backup and swp
"set backupdir=~/.vim/_backup//    " where to put backup files.
"set directory=~/.vim/_temp//      " where to put swap files.
set backupskip=/tmp/*,/private/tmp/* " don't backup files in these directories (eg crontab)

" Close all buffers except the current one
map <localleader>qa :BufOnly<cr>

" map :W to :w because I have fat fingers
nnoremap :W :w

" map ## in insert mode to create a ruby string interpolated variable
inoremap ## #{}<left>

" delete logs
nnoremap <localleader>dl :!rm -i log/test.log<cr>

" ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
let g:ctrlp_root_markers = ['Capfile']

" map localleader r to execute as ruby, regardless of content - overrides
" rubytest plugin
nnoremap <localleader>r :!ruby %<cr>

" NERDCommenter stuff
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
nnoremap <localleader>x :%s/></>\r</g<cr>:0<cr>=:$<cr>
