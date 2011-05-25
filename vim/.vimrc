" To enable 256 color mode themes
set t_Co=256

" Easier on the eyes than the default
" Needs 256 color mode to be enabled
colorscheme zenburn

" Enable high contrast colors with zenburn
let g:zenburn_high_Contrast = 1

"
" When trying to use cscope with the cscope_maps.vim key bindings,
" I kept receiving the following error:
" 	Error detected while processing $HOME/.vim/plugin/cscope_maps.vim:
" 	line   42:
" 	E568: duplicate cscope database not added
" 	Press ENTER or type command to continue
" Thus with the help of google I came across this solution.
" If this variable is set the error no longer occurs, not sure why this
" suppresses the error.
"
" See Also:
" http://blogs.sun.com/natarajan/entry/avoiding_duplicate_cscope_database_error
"
set nocscopeverbose 

" To easily comment/uncomment visually selected blocks of c code
"
" Mnemonic: Comment C
map ,cc :s#^#//#<CR> :set nohlsearch<CR>
" Mnemonic: Uncomment C
map ,uc :s#^//##<CR> :set nohlsearch<CR>
" Mnemonic: Comment Shell
map ,cs :s/^/#/<CR> :set nohlsearch<CR>
" Mnemonic: Uncomment Shell
map ,us :s/^#//<CR> :set nohlsearch<CR>


" Turn on line numbering
set number

" Minimum number of columns to use for line numbers
set nuw=4

" Turn on syntax coloring
syntax on

" Turn on word wrap
set wrap

" Tabs are 8 cols
set tabstop=8

" Set the font (Courier New 12pt)
set guifont=Courier\ New:h12

" Turn on invisible chars
set invlist

" Customize the invisible chars
set listchars=tab:>-,trail:!

" Only do this part when compiled with support for autocommands
" If autocommands is supported, this will highlight trailing
" whitespace in red
" See also: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
if has("autocmd")
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"	autocmd BufWinLeave * call clearmatches()
endif

" No automatic indenting
set noautoindent

" Turn on spell checking
set spell

" Highlight lines longer than 80 cols in length
" See also:
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns/3765575#3765575
if exists('+colorcolumn')
	set colorcolumn=80
else
	autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
