"------------------------------
" .vimrc
"
" author: Nekosan
"------------------------------

"------------------------------
" autocmdの取り消し
"------------------------------
augroup myvimrc
    autocmd!
augroup END


"------------------------------
" NeoBundleの設定
"------------------------------
filetype plugin indent off

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/Unite.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'vim-scripts/TwitVim'

NeoBundle 'dag/vim2hs'

call neobundle#end()



"------------------------------
" カラースキームの設定
"------------------------------
colorscheme hybrid


"------------------------------
" エンコードの設定
"------------------------------
set encoding=utf-8


"------------------------------
" シンタックスハイライト
"------------------------------
syntax on


"------------------------------
" いろいろ設定
"------------------------------
set noswapfile
set history=1000

"------------------------------
" 表示設定 
"------------------------------
set list " 不可視文字を表示
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%,eol:^ " 不可視文字の表示形式
set number " 行番号表示
set display=uhex " 印字不可能文字を16進数で表示

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace ctermbg=red guibg=red
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
        autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
    augroup END
    call ZenkakuSpace()
endif

" カーソル行をハイライト
set cursorline
" コマンド実行中の再描画を停止
set lazyredraw
" 高速ターミナル接続を行う
set ttyfast


"------------------------------
" インデント、タブ設定
"------------------------------
"デフォルト設定
set cindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"言語毎のタブ設定
filetype plugin indent on

augroup myvimrc
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END


"------------------------------
" 操作設定
"------------------------------
set whichwrap=b,s " カーソル移動にBSとSpaceだけをつかう
set backspace=eol


"------------------------------
" キーマップ設定
"------------------------------
nnoremap <F5> :<C-u>vsplit $MYVIMRC<CR>
nnoremap <F4> :<C-u>so $MYVIMRC<CR>

nmap ss :split<Enter>
nmap sv :vsplit<Enter>

nmap sh <C-w>h
nmap sj <C-w>j
nmap sk <C-w>k
nmap sl <C-w>l
nmap sw <C-w>w

nmap sH <C-w>H
nmap sJ <C-w>J
nmap sK <C-w>K
nmap sL <C-w>L
nmap sr <C-w>r

nmap s> <C-w>>
nmap s< <C-w><
nmap s+ <C-w>+
nmap s- <C-w>-

nmap st :tabnew<Enter>

nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]s :<C-u>Unite<Space>file<CR>

"------------------------------
" 検索設定 
"------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch


"------------------------------
" ステータスライン設定
"------------------------------
set laststatus=2
set statusline=%f%m%r%h%w\ [%{&ff}]\[%Y]\[%L]\%{fugitive#statusline()}


"------------------------------
" TwitVim設定
"------------------------------
let twitvim_browser_cmd = 'open'
let twitvim_force_ssl = 1
let twitvim_count = 20


"------------------------------
" BackGround Setting
"------------------------------
if !has('gui_running')
    augroup seiya
        autocmd!
        autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    augroup END
endif


"------------------------------
" 起動時にインストールするプラグインがあるかを調べる
"------------------------------
NeoBundleCheck

