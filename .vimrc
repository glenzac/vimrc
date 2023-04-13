"============================================================================="
"                        .vimrc by Glen Zachariah  
"============================================================================="
" Disable compatibility with vi which can cause unexpected issues
set nocompatible
" Enable file type detection
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Enable the built-in matchit plugin
runtime macros/matchit.vim

"============================================================================="
"                              Themes 
"============================================================================="
" PaperColor Theme "
"set background=dark
set background=light
colorscheme PaperColor

"============================================================================="
"                              Configuration 
"============================================================================="
" Turns syntax highlighting on
syntax on
" Set the max. number of tabs that can be opened simultaneously
set tabpagemax=20
" Set required font and size
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
"set guifont=Monospace\ Bold\ 8
set guifont=Hack\ 9

" Shows line numbers
set number
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Backspace key works in all cases
set backspace=indent,eol,start

" Indentation settings
" Use 4 spaces instead of tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Wrap really long lines 
set wrap
" Apply indentation to wrapped lines
set breakindent
" Adds 4 spaces before wrapped lines
set showbreak=\ \ \ \
" Display only the filename and modification status on tabs
:set guitablabel=%t\ %M
" Autowrap comments and allow formatting of comments using gq
set formatoptions=cq
" Show the current mode on the last line.
set showmode

" Search settings
" Perform incremental search
set incsearch
" Highlight search string
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Code folding settings
" Set indent based folding for files
set foldmethod=indent
" only fold at the highest level
set foldnestmax=1
" Initially open a file unfolded
set nofoldenable

" Display .svh files with .sv syntax highlighting 
au BufRead,BufNewFile *.svh set filetype=systemverilog

" Display .f files with .pl syntax highlighting 
au BufRead,BufNewFile *.f set filetype=perl

" Display .cfg files with YAML syntax highlighting 
au BufRead,BufNewFile *.cfg set filetype=yaml
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Display .log files with special syntax highlighting
au BufRead,BufNewFile *.log set filetype=log wrap linebreak breakat=@

" Display custom .gzdoc files with special syntax highlighting
au BufRead,BufNewFile *.gzdoc set filetype=gzdoc wrap linebreak breakat=@

" Highlight the following keywords
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('DiffAdd',  '\W\zs\(TODO\|FIXME\|CHANGED\|HACK\)')
    autocmd Syntax * call matchadd('DiffChange', '\W\zs\(NOTE\|VERIFY\|REFER\)')
    autocmd Syntax * call matchadd('ErrorMsg', '\W\zs\(BUG\)')
  endif
endif


"============================================================================="
"                        Custom Key Bindings  
"============================================================================="
" Set comma as the <Leader>
:let mapleader = ","
" Remaps Esc to ,, in insert mode
inoremap <Leader>, <Esc>
" Use Space while in normal mode to enter commands
nnoremap <Space> : 
" Display selected lines in reg/clipboard
nnoremap <Leader>c :reg "" 0 1 2 3 * +<CR>
" Delete selection into blackhole register
nnoremap <Leader>d "_d
" Delete all the lines
nnoremap <Leader>da :%d<CR>
" Delete lines that has matches
nnoremap <Leader>dh :g//d<CR>
" Insert User defined text placed at ~/file_header.txt
nnoremap <Leader>fh ggi<CR><Esc>k:r~/file_header.txt<CR> kdd
" Fix indent from 4 spaces to 2 spaces 
nnoremap <Leader>fi4 :set tabstop=4 softtabstop=4 noexpandtab<CR>:retab!<CR>:set tabstop=2 softtabstop=2 expandtab<CR>:retab<CR>
" Fix indent from 3 spaces to 2 spaces 
nnoremap <Leader>fi3 :set tabstop=3 softtabstop=3 noexpandtab<CR>:retab!<CR>:set tabstop=2 softtabstop=2 expandtab<CR>:retab<CR>
" Open netrw
nnoremap <Leader>e :Ex<CR>
" Go to file under cursor in vsplit mode
nnoremap <Leader>gf <C-W>vgf
" Go to file under cursor in new tab
nnoremap <Leader>gfn <C-W>gf
" Highlight the selected text 
vnoremap <Leader>h y:match DiffChange /<C-r>"/<CR><CR>
" Turn off higlighting  
nnoremap <Leader>hn :nohlsearch <CR>
" Show all the highlight groups
nnoremap <Leader>hg :so<Space>$VIMRUNTIME/syntax/hitest.vim<CR>
" Comment selected lines with a hash
vnoremap <Leader>ih :norm i#<CR>
" Remove comment from selected lines
vnoremap <Leader>rh :norm ^x<CR>
" Remove all match highlights
nnoremap <Leader>mn :match none<CR>
" Create a new tab 
nnoremap <Leader>n :tabnew<CR>
" Create a new tab of the current file 
nnoremap <Leader>nc :tab split<CR>
" Quit vim
nnoremap <Leader>q :q<CR>
" Reload current buffer 
nnoremap <Leader>r :e<CR>
" Select all lines
nnoremap <Leader>sa ggVG<CR>
" Search 'literally' for selected text
vnoremap <Leader>sh y?<C-r>"<CR>/<CR>ggn
" Horizontal split
nnoremap <Leader>sp :sp<CR>
" Vertical split
nnoremap <Leader>sv :vsp<CR>
" Open terminal
nnoremap <Leader>t :terminal<CR>
" Reload .vimrc
nnoremap <Leader>v :source<Space>~/.vimrc<CR>
" Write to file now
nnoremap <Leader>wn :w<CR>   
" File saving (forced)
nnoremap <Leader>wf :w!<CR>   
" File saving and quit
nnoremap <Leader>wq :wq<CR>   
" File saving and netrw
nnoremap <Leader>we :w<CR>:Ex<CR>  
" Copy from cursor to line end
nnoremap <Leader>y y$
" Copy all the lines
nnoremap <Leader>ya :%y+<CR>

" FZF key bindings
" Open fzf window showing files
nnoremap <silent> <Leader>f :Files<CR>
" Open fzf window for files in git
nnoremap <silent> <Leader>g :GFiles<CR>
" Open fzf window to search through help
nnoremap <silent> <Leader>h :Helptags<CR>
" View current key mappings
"nnoremap <silent> <Leader>m :Maps<CR>
" Open fzf window to search through lines in file
nnoremap <silent> <Leader>l :Lines<CR>
" Open fzf window to search through all the commits 
nnoremap <silent> <Leader>gc :Commits<CR>


"============================================================================="
"                          Autocompletion
"============================================================================="
" Automatically add closing ( { [ ' " `
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" Custom implementation of Tab for autocompletion
function! SmartTab()
    " if its the beginning of a line insert a literal tab
    let col = col('.') - 1
    let before_cursor = getline('.')[:col('.')-2]
    let char = strcharpart(before_cursor, strchars(before_cursor)-1)

    if !col
        return "\<tab>"
    else 
        if char =~ '\s$'
	        return "\<Tab>"
	    else
	        return "\<C-N>"
        endif
	endif
endfunction

" Use TAB for keyword autocompletion
inoremap <Tab> <C-R>=SmartTab()<CR>
" Use Ctrl-TAB for file autocompletion
inoremap <C-Tab> <C-X><C-F>

" File completion similar to bash
set wildmode=longest,list,full
set wildmenu


"============================================================================="
"                      Status line modifications 
"============================================================================="
" To always enable the vim status line
set laststatus=2

" Building a custom status line
set statusline=
" Highlight to be used
set statusline+=%#DiffAdd#
" Shows current_line/total line
set statusline+=\ Line:\ %3l/%3L\ 
" Highlight to be used
set statusline+=%#MatchParen#
" Shows column number
set statusline+=\ Col:%3c\ 
" Highlight to be used
set statusline+=%#DiffDelete#
" Show modification status
set statusline+=%m\ 
" Show read-only status
set statusline+=%r\ 
set statusline+=%h\ 
set statusline+=%w\ 
" Highlight to be used
set statusline+=%#StatusLine#
" Show the full path and filename
set statusline+=\ %f\ 
" Separation point between left and right aligned items
set statusline+=%=
" Highlight to be used
set statusline+=%#StatusLineNC#
" Show detected file type
set statusline+=\ %Y\ 
" Highlight to be used
set statusline+=%#DiffAdd#
" Show file encoding
""set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
""set statusline+=\[%{&fileformat}\]\ 
""set statusline+=\ 
" Get file sizes using FileSize function
set statusline+=%{FileSize(line2byte('$')+len(getline('$')))}
  
function! FileSize(bytes)
  let l:bytes = a:bytes | let l:sizes = ['B', 'KB', 'MB', 'GB'] | let l:i = 0
  while l:bytes >= 1024 | let l:bytes = l:bytes / 1024.0 | let l:i += 1 | endwhile
  return l:bytes > 0 ? printf(' %.1f%s ', l:bytes, l:sizes[l:i]) : ''
endfunction


"============================================================================="
"                            netrw configuration
"============================================================================="

" Make the default netrw to work in tree liststyle
" modes: thin, long, wide, tree
"let g:netrw_liststyle = 0

" To remove the netrw top banner
let g:netrw_banner = 0

" To open the files in the previous window
"let g:netrw_browse_split = 4

" Keeps netrw open on the left side and the file on the right side
"let g:netrw_altv = 1

" Keep the split window size to only 30% of the window
"let g:netrw_winsize = 30
