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

if &compatible
  set nocompatible
endif




" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/dein/")
  let s:toml      = g:rc_dir . 'dein.toml'
  let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
