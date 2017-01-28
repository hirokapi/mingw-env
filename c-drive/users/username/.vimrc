"------------------------------------------------------------------------------
" Plugin Management (Using dein to magnage plugins)
"------------------------------------------------------------------------------
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Install dein
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  " Add dein.vim to head of runtimepath
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if &compatible
  set nocompatible
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = s:dein_dir . '/dein.toml'
  let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'
  let s:_toml      = s:dein_dir . '/local_dein.toml'
  let s:_lazy_toml = s:dein_dir . '/local_dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:_toml,      {'lazy': 0})
  call dein#load_toml(s:_lazy_toml, {'lazy': 1})

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  "call dein#save_state()
endif

if has("mac")
  " lua is installed by homebrew
  set luadll=/usr/local/Cellar/lua/5.2.4_1/lib/liblua.dylib
end

"------------------------------------------------------------------------------
" Color
"------------------------------------------------------------------------------
syntax enable
set t_Co=256
if has('mac')
    set background=light
else
    set background=dark
endif
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

"-----------------------------------------------------------------------------
" 検索の挙動に関する設定:
"-----------------------------------------------------------------------------
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"-----------------------------------------------------------------------------
" 字文コード文に関する設定:
"-----------------------------------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
  set foldmethod=marker
  filetype plugin indent on
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"-----------------------------------------------------------------------------
" 編集に関する設定:
"-----------------------------------------------------------------------------
set scrolloff=5
set shiftwidth=4
set smarttab
set textwidth=0

" タブの画面上での幅
set tabstop=4
" タブをスペースに展開する (noexpandtab:展開しない)
set expandtab
" 自動的にインデントしない (autoindent:インデントする)
set noautoindent
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

"-----------------------------------------------------------------------------
" Display settings
"-----------------------------------------------------------------------------
" 行番号を表示
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ
set cmdheight=1
" コマンドをステータス行に表示
set showcmd
" タイトルを非表示
"set notitle

set hlsearch
set showcmd

"-----------------------------------------------------------------------------
" バックアップファイル操作に関する設定:
"-----------------------------------------------------------------------------
set directory=~/.vim/tmp//
set nobackup
set swapfile
set noundofile

"------------------------------------------------------------------------------
" PlantUML
"------------------------------------------------------------------------------
let g:plantuml_executable_script='bash /usr/local/bin/plantuml'
let s:makecommand=g:plantuml_executable_script." %:p; exit"
autocmd Filetype plantuml,pu,uml let &l:makeprg=s:makecommand
autocmd Filetype plantuml,pu,uml noremap <silent><F5> :w<CR>:make<CR>
autocmd Filetype plantuml,pu,uml inoremap <silent><F5> <Esc>:w<CR>:make<CR>
autocmd Filetype plantuml,pu,uml vnoremap <silent><F5> :<C-U>:w<CR>:make<CR>

"------------------------------------------------------------------------------
" Only Win32
"------------------------------------------------------------------------------
if has('win32')
    "スペースの入ったファイル名も扱えるようにする
    set isfname+=32
endif

"------------------------------------------------------------------------------
" Only Mac
"------------------------------------------------------------------------------
if has('mac')
    set imdisable
endif

"------------------------------------------------------------------------------
" ESCでIMEを確実にOFF
"------------------------------------------------------------------------------
"noremap <ESC> <ESC>:set iminsert=0<CR>
"set iminsert=0
"set imsearch=-1

"------------------------------------------------------------------------------
" Key mapping for virtual area yunk
"------------------------------------------------------------------------------
vnoremap * "zy:let @/ = @z<CR>n

"------------------------------------------------------------------------------
" Enable to read *.md file as markdown
"------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"------------------------------------------------------------------------------
" Enable to ctags
"------------------------------------------------------------------------------
" ctags --languages=javascript -f ~/.tags/js.tags `pwd`
autocmd BufNewFile,BufRead *.js set tags+=$HOME/.tags/js.tags
" ctags --languages=typescript -f ~/.tags/ts.tags `pwd`
autocmd BufNewFile,BufRead *.ts set tags+=$HOME/.tags/ts.tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

"------------------------------------------------------------------------------
" Key mapping in command line
"------------------------------------------------------------------------------
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <C-b>
cnoremap <C-e> <C-e>
cnoremap <C-u> <C-e><C-u>
cnoremap <C-v> <C-f>a

"------------------------------------------------------------------------------
" Window size change shortcut
"   > http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
"------------------------------------------------------------------------------
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"------------------------------------------------------------------------------
" Save with sudo by :w!!
"   > http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
"------------------------------------------------------------------------------
cabbr w!! w !sudo tee > /dev/null %

"------------------------------------------------------------------------------
" Enable :Man always
"   > http://rcmdnk.github.io/blog/2014/07/20/computer-vim/
"------------------------------------------------------------------------------
runtime ftplugin/man.vim
autocmd FileType man setlocal nospell ts=8 nolist ro nomod noma

"------------------------------------------------------------------------------
runtime ftplugin/javascript.vim
