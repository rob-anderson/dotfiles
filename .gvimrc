" settings for both gvim and macvim
color molokai
set guioptions=egmrt " disable toolbar

" gvim settings

" map command left, right to tab navigation
"nnoremap <T-Right> gt
"nnoremap <T-Left> gT

" macvim settings
if has("gui_macvim")

  macmenu &File.New\ Tab key=<nop>
  set gfn=Monaco:h12
  nmap <D-J> :NERDTreeFind<CR>
  nmap <D-E> :NERDTreeToggle<CR>

  " map command left and right to tab navigation
  map <D-Right> gt
  map <D-Left> gT

  " and do the same for control-shift h and l
  nmap <C-S-l> gt
  nmap <C-S-h> gT
  imap <C-S-l> <Esc>gt
  imap <C-S-h> <Esc>gT

endif
