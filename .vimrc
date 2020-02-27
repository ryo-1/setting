" setting
" 編集中のファイルが変更されたら自動で読み直す
set autoread

" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number

" 現在の行を強調表示
set cursorline

" 現在の行を強調表示（縦）
set cursorcolumn

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" 括弧入力時の対応する括弧を表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" コマンドラインの補完
set wildmode=list:longest

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"タブをスペース
"set tabstop=4
"set expandtab
"set shiftwidth=4

" 新しいウィンドウを下に開く
set splitbelow

" 新しいウィンドウを右に開く
set splitright

"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,],h,l
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 検索系
" 大文字小文字を区別なく検索する
set ignorecase

"大文字の場合は区別する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"改行表示
" se list
if has("syntax")

  syntax on

  function! ActivateInvisibleIndicator()

    syntax match InvisibleJISX0208Space "　" display containedin=ALL

    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=Blue

    syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL

    highlight InvisibleTrailedSpace term=underline ctermbg=lightred guibg=Red

"    syntax match InvisibleTab "\t" display containedin=ALL

"    highlight InvisibleTab term=underline ctermbg=lightgray guibg=#c1ffff

    endf

  augroup invisible

    autocmd! invisible

    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()

  augroup END

endif

" 全角スペースの背景を白に変更
" autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
" autocmd VimEnter * match FullWidthSpace /　/

" カラースキームの設定
colorscheme desert
