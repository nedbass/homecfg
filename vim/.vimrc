" ################
" # Start .vimrc #
" ################

" Much Inspiration came from the following source:
" * https://wiki.archlinux.org/index.php/Vim

set wrapscan        " * Search wraps around top and bottom of file
set spell           " * Spell checking
set noautoindent    " * I'm a big boy, I can do my own indenting
set tabstop=8       " * Number of spaces in a <Tab>
set shiftwidth=8    " * Number of spaces for each indent level
set showcmd         " * Show (partial) command in status line
set number          " * Show line numbers
set showmatch       " * When a bracket is inserted, briefly jump to the
                    "   matching one. The jump is made only if the match can
                    "   be seen on the screen. The time to show the match can
                    "   be set with 'matchtime'.
set hlsearch        " * When a previous search pattern is available, highlight
                    "   all matches.
set incsearch       " * While typing a search command, show immediately where
                    "   the pattern matches so far.
set ignorecase      " * Ignore case in search patterns.
set smartcase       " * Override 'ignorecase' option if search pattern contains
                    "   upper case characters.
set textwidth=79    " * Maximum width of text that is being inserted. A longer
                    "   line will be broken at whitespace to get this width.
set ruler           " * Show the line and column number of the cursor position
set background=dark " * When set to "dark", Vim will try to use colors that
                    "   look good on a dark background. "light" can be used for
                    "   the opposite effect. Any other value is illegal.
set t_Co=256        " * To enable the use of color schemes with 256 colors
set nocscopeverbose " * Quiets errors which crop up when using Vim cscope key
                    "   bindings (cscope_maps.vim)
syntax on           " * Turn on syntax coloring
set wrap            " * Changes the way text is displayed, but does not change
                    "   the text itself.
set list            " * Turn on printing of invisible chars
set listchars=tab:>-,trail:! " * Customize the characters used to print the
                    "   invisible chars
set formatoptions=cqt " * Sequence of letters which describes how automatic
                    "   formatting is to be done.
                    "
                    "   letter   meaning when present in 'formatoptions'
                    "   -----    ---------------------------------------
                    "   * c      * Auto-wrap comments using 'textwidth',
                    "              inserting the current comment leader
                    "              automatically.
                    "   * q      * Allow formatting of comments with "gq".
                    "   * t      * Auto-wrap text using 'textwidth' (does not
                    "              apply to comments).
set backupdir=~/.vim/backup,/tmp,./ " * By default, Vim creates a backup of an
                    "   edited file in the same directory as the file called
                    "   filename~. To prevent clutter, many users tell Vim to
                    "   use a backup directory. Will try to save to the given
                    "   directories in the order specified, saving to the first
                    "   one available. Directory must already exist, Vim will
                    "   not create it.
colorscheme wombat256mod " * My preferred color scheme for Vim (Needs 256
                    "   colors)

" #############################################################################
" The following is for commenting/uncommenting blocks of code more easily
map ,cc :s#^#//#<CR> :set nohlsearch<CR> " * Mnemonic: Comment C
map ,uc :s#^//##<CR> :set nohlsearch<CR> " * Mnemonic: Uncomment C
map ,cs :s/^/#/<CR> :set nohlsearch<CR>  " * Mnemonic: Comment Shell
map ,us :s/^#//<CR> :set nohlsearch<CR>  " * Mnemonic: Uncomment Shell
" #############################################################################

" #############################################################################
" The following places the cursor in it's previous position after opening a
" file.
function! ResetCursor()
	if line("'\"") > 1 && line("'\"") <= line("$")
		normal! g'"
		return 1
	endif
endfunction

if has("autocmd")
	augroup resetCursor
		autocmd!
		au BufReadPost * call ResetCursor()
	augroup END
endif
" #############################################################################

" Set the font (Courier New 12pt)
set guifont=Courier\ New:h12

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

" Highlight lines longer than 80 cols in length
" See also:
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns/3765575#3765575
if exists('+colorcolumn')
	set colorcolumn=80
else
	autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" ##############
" # End .vimrc #
" ##############
