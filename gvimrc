" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

colorscheme Monokai

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

