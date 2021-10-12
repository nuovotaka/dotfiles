set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
" ステータスラインの強化
Plugin 'itchyny/lightline.vim'
" カラースキーマ
Plugin 'tomasr/molokai'
" NERDTree ツリーの表示
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く
""
"
" 各種オプションの設定
"
""
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から２行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow


""
" Nerd Tree 隠しファイルを表示する
""
let NERDTreeShowHidden = 1
" 引数なしで実行した時、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif

""
" lightline.vimの設定
""
" カラースキーマをデフォルトに設定
" let g:lightline = {'colorscheme': 'default',}

" filetypeの自動検出(最後に書いた方が良いらしい)
filetype on
