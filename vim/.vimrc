set expandtab
syntax enable
set mouse=
set cindent
set shiftwidth=4
set tabstop=4
set textwidth=180
" set colorcolumn=200
highlight ColorColumn ctermbg=4
""set nowrap
" autosave before make
set autowrite
:set scrolloff=4
" start the make and go back to editor
" when it's done
" nmap <F7> :make<CR><CR>
" start the make from insert mode and go back to
" insert mode when it's done
" imap <F7> <C-O>:make<CR><CR>
" save file in insert mode
imap <m-s> <C-O>:w<CR>
" save file in normal mode
nmap <m-s> :w<CR>
" show control char just typed
" (and some other info depending on mode)
set showcmd
" select file encoding on the fly
" http://www.45.free.net/~vitus/tips/vim.html
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r          :e ++enc=koi8-r<CR>
menu Encoding.windows-1251    :e ++enc=cp1251<CR>
menu Encoding.ibm-866         :e ++enc=ibm866<CR>
menu Encoding.utf-8           :e ++enc=utf-8 <CR>
map <F7> :emenu Encoding.<TAB>

""" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_foldlevel = 0

set ignorecase smartcase
set incsearch

set laststatus=2
set fo+=ro
filetype plugin indent on

set filetype=on
" abbr fff FIXME:

" use <ALT+x> <ARROWS> to cycle through buffers
" it took me a while to figure out how to map
" <ALT+KEY> stroke, but I did it finally
nmap <ESC>x <NOP>| map! <ESC>x <NOP>
nmap <ESC>x<left> :bp<CR>
nmap <ESC>x<right> :bn<CR>
imap <ESC>x <NOP>| map! <ESC>x <NOP>
imap <ESC>x<left> <C-O>:bp<CR>
imap <ESC>x<right> <C-O>:bn<CR>

imap <ESC>e<right> :cnext<CR>
imap <ESC>e<left> :cprevious<CR>
nmap <ESC>e<right> :cnext<CR>
nmap <ESC>e<left> :cprevious<CR>

imap <ESC>e<home> :cfirst<CR>
imap <ESC>e<end> :clast<CR>
nmap <ESC>e<home> :cfirst<CR>
nmap <ESC>e<end> :clast<CR>

imap <ESC>el :clist!<CR>
nmap <ESC>el :clist!<CR>

"nmap <m-F12> :BufExplorer<CR>
"nmap <F12> :BufExplorer<CR>
nnoremap <F12> :buffers<CR>:buffer<Space>

" 31-Mar-2005, Yuri Arapov (thanks to ivan_t)
" hit 'A' in visual mode to do regexp-based text alignment
vmap A :call Align_Section(Prompt("Pattern: "), Prompt("Padding: "))<CR>

" <M-x>r hide search results
" " thanks to ivan_t
" ""nmap <esc>xr :let @/=""<cr>

set ruler
"source $VIMRUNTIME/mswin.vim
set listchars=tab:>-,eol:$,trail:.,extends:#
set modeline
set modelines=5

set tags=./tags;

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
		\ &tabstop, &shiftwidth, &textwidth)
	let l:modeline = substitute(&commentstring, "%s", l:modeline,"")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

func CheckSwap()
  swapname
  if v:statusmsg =~ '\.sw[^p]$'
    set ro
  endif
endfunc

if &swf
  set shm+=A
  au BufReadPre * call CheckSwap()
endif
""" —– MiniBufExpl config —–
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

""" Python-mode config
let g:pymode_folding = 0
" Load show documentation plugin
let g:pymode_doc = 1
" " Key for show python documentation
let g:pymode_doc_key = 'K'
 " Do not use rope autocompletion
let g:pymode_rope_vim_completion = 0
" Ignore too long line error of pep8
let g:pymode_lint_ignore = "E501,"
let g:pep8_ignore = "E501,"
" Run linter on the fly
let g:pymode_lint_onfly = 0
" Check code every save
let g:pymode_lint_write = 1

""" Pathogen
call pathogen#infect() 
""" Python indentation
autocmd FileType python setlocal ts=4 sts=4 sw=4
""" ipdb set trace
iab ipdb import ipdb; ipdb.set_trace()
""" neocomplcache
let g:neocomplcache_enable_at_startup = 1

""" Colorscheme
:colorscheme gruvbox
:set bg=dark
""" Toggle gruvbox background
map <F5> :call ToggleBg()<CR>
function! ToggleBg()
    if &background == 'dark'
        set bg=light
    else
        set bg=dark
    endif
endfunc
