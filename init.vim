let mapleader = "\<Space>"
colorscheme molokai
syntax on

"基本
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set wildmode=list:longest
set virtualedit=block
set noerrorbells
set clipboard+=unnamed
"見た目
set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set listchars=tab:^\ ,trail:~
set list listchars=tab:\▸\-
" 背景透過
augroup TransparentBG
  autocmd!
  autocmd Colorscheme * highlight Normal ctermbg=none
  autocmd Colorscheme * highlight NonText ctermbg=none
  autocmd Colorscheme * highlight LineNr ctermbg=none
  autocmd Colorscheme * highlight Folded ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none 
augroup END
"小文字は大文字含み検索、大文字は大文字のみ検索
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
"tab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround
"php--------------
let g:php_baselib    = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags  = 1
let g:php_sql_query   = 1
let g:sql_type_default = 'mysql'
"php--------------
" key map---------------
"file split
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
"行結合を|に
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>
"ctrl+hjklでウィンドウ間移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 折り返し行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"jjでノーマルモードにmついでに保存 
inoremap <silent> jj <ESC>:<C-u>w<CR>
noremap <Leader>5 :source ~/.config/nvim/init.vim<CR>
noremap <Leader>a ggvG$
noremap <Leader>r :QuickRun<CR>
noremap <Leader>q :ccl<CR>
noremap <Leader>; A;<esc>
noremap <Leader>, A,<esc>
noremap <Leader>k 0i//<esc>0
inoremap <C-f> <Esc>A
" 画面分割
noremap ss :split<CR>
noremap sv :vsplit<CR>
noremap sh <C-w>h
noremap sj <C-w>j
noremap sl <C-w>l
noremap sk <C-w>k
noremap sw <C-w>k
" emmet
let g:user_emmet_leader_key='<c-e>'
" key map---------------
"dein Scripts-----------------------------
if &compatible
 set nocompatible        " Be iMproved
endif
" Required:
set runtimepath+=/Users/akitakashimomura/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/Users/akitakashimomura/.cache/dein')
 call dein#begin('/Users/akitakashimomura/.cache/dein')
 " Let dein manage dein
 " Required:
 call dein#add('/Users/akitakashimomura/.cache/dein/repos/github.com/Shougo/dein.vim')
 " Add or remove your plugins here:
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('scrooloose/nerdtree')
 call dein#add('Shougo/neocomplete.vim')
 call dein#add('Shougo/neoinclude.vim')
 call dein#add('Shougo/vimproc.vim', {'build': 'make'})
 call dein#add('thinca/vim-quickrun')
 "call dein#add('lvht/phpcd.vim')
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('thinca/vim-ref')
 call dein#add('vim-scripts/taglist.vim')
 call dein#add('w0rp/ale')
 call dein#add('cohama/lexima.vim')
 call dein#add('Valloric/MatchTagAlways')
 call dein#add('mattn/emmet-vim')
 call dein#add('rking/ag.vim')
 call dein#add('phpactor/phpactor')
 " Required:
 call dein#end()
 call dein#save_state()
endif
" Required:
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
"End dein Scripts-------------------------
" nerdtree-----------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 表示幅
let g:NERDTreeWinSize=40
" ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir=''
" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'
" ファイルを開いたらNERDTreeを閉じる
"let g:NERDTreeQuitOnOpen=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1
" 非表示ファイル
"let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" nerdtree-----------------
" deoplete-----------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
" deoplete-----------
"quickrun----------------
let g:quickrun_config = {
\  "_" : {
\    "outputter/buffer/split" : ":botright 8sp",
\    "outputter/buffer/close_on_empty" : 1,
\    "outputter" : "quickfix"
\  },
\}
au FileType qf nnoremap <silent><buffer>q :quit<CR>
"quickrun----------------
" vim-ref --------------
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let g:ref_no_default_key_mappings = 1
let g:ref_cache_dir        = $HOME . '/.vim/vim-ref/cache'
let g:ref_detect_filetype     = {
\  'php': 'phpmanual'
\}
let g:ref_phpmanual_path = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_use_cache   = 1
let g:ref_use_vimproc  = 1
" vim-ref --------------
""
" PHP Lint 
"nmap <Leader>l :call PHPLint()<CR>
" " 
" PHPLint
" 
" @author halt feits <halt.feits at gmail.com>
" 
"function! PHPLint()
"  let result = system( &ft . ' -l ' . bufname(""))
"  echo result
"endfunction
"augroup php-lint
" autocmd!
" autocmd BufWritePost *.php call <SID>PHPLint()
"augroup END
"php lint----
"matchtagalways------------
"オプション機能ONにする
let g:mta_use_matchparen_group = 1
"使用するファイルタイプ(phpを追加)
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'php' : 1,
  \}
"matchtagalways------------
" set: dictionary= で辞書ファイルを指定
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'



function! s:PHPLint()
  let s:result = system('php -l ' . bufname(""))
  let s:count = split(s:result, "\n")
  echo s:result
endfunction

augroup php-lint
  autocmd!
  autocmd BufWritePost *.php call <SID>PHPLint()
augroup END

