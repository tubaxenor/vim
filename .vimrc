call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set undolevels=100
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=5
set title
set showmode
set nobomb
set nostartofline
set laststatus=2
set clipboard+=unnamed

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on		" syntax highlight
set hlsearch		" search highlighting
syntax enable
set t_Co=256
set background=dark
colorscheme rails_envy
"colorscheme railscasts

set nobackup		" no *~ backup files
set noswapfile
set nowb
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		"
set smarttab		" insert tabs on the start of a line according to
set expandtab           " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
au FileType Makefile set noexpandtab
set shortmess=I         " remove splash wording

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

set encoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

augroup filetypedetect
  au! BufNewFile,BufRead *.as setf actionscript
  au! BufNewFile,BufRead *.m setf objc
  au! BufNewFile,BufRead *.scss setf scss
augroup END

" ===================================
"  custom key and plugin configurations
" ===================================
" add a new line without entering insert mode
map <S-CR> o<Esc>

" cancel searched highlight
noremap ; :nohlsearch<cr>

" identation
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" select ALL
map <c-a> ggVG

" NERDTree
nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
let NERDTreeShowBookmarks  = 0
let NERDTreeChDirMode=2
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
map <leader>r :NERDTreeFind<cr>   " open directory of current opened file

" comment
map <Leader><Leader> <Leader>c<space>

" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" easy motion
let g:EasyMotion_leader_key = '<Leader>'

" vimgrep
"map <leader>g :vimgrep //j **/*.*<left><left><left><left><left><left><left><left><left>

" remap VIM 0
map 0 ^

" force myself to not to use the error keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" fuzzyfinder
"map <silent> <c-\>f :FufCoverageFile<cr>
"map <silent> <c-\>f :FufFile<cr>
"map <silent> <c-\>d :FufDir<cr>
"map <silent> <c-\>b :FufBuffer<cr>

" Yankring
nnoremap <silent> <F11> :YRShow<CR>
let g:yankring_history_dir='/tmp'

" next and prev tab
noremap <F7> gT
noremap <F8> gt

" run scripts
autocmd BufRead,BufNewFile *.rb map <c-CR> :% w !ruby -w<CR>
autocmd BufRead,BufNewFile *.py map <c-CR> :% w !python<CR>

" vim-powerline
let g:Powerline_symbols = 'fancy'

" QuickFix Window
"command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
if exists("g:qfix_win") && a:forced == 0
  cclose
  unlet g:qfix_win
else
  copen 10
  let g:qfix_win = bufnr("$")
endif
endfunction
nnoremap <leader>q :QFix<CR>

" Ctags
set tags+=./tags;/
set tags+=gems.tags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(pathogen#split(&tags) + map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

" ctrlp
nnoremap <leader>p :CtrlP<CR>
set wildignore+=*.o,*.obj,.git,*.pyc,*.jpg,*.png,*.gif,*.swf,*.fla,*.ico,*.avi,*.mp3
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_cache_dir = '/tmp/.cache/ctrlp'
let g:ctrlp_mruf_include = '\.rb$'

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" stupid shift key fixes
" cmap E e
" cmap Tabe tabe

" mose patches -------------------------------------------------------------------------------
iab Yalpha abcdefghijklmnopqrstuvwxyz
iab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab Ydigit 1234567890
iab Yruler 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
iab  Yell  [...]
vmap ,ell c[...]<ESC>
iab shoudl    should
iab teh       the
iab Ydate <C-R>=strftime("%y/%m/%d")<CR>
iab Ytime <C-R>=strftime("%H:%M")<CR>
iab YDT   <C-R>=strftime("%d %m %y %T")<CR>
iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab YTH   <C-R>=strftime("%d/%m/%Y:%H:%M ¤ moz ¤ ")<CR>

map <F8> :set nonumber<C-M>
map <F7> :set number<C-M>
set pastetoggle=<F9>

let mapleader=","
set list listchars=trail:¶

" mouse-----------------------
" set mouse=a
