" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality.
set nocompatible


""""""""""""""
" Appearance "
""""""""""""""
    " Turn on syntax highlighting.
    syntax on

    " Show matching braces when text indicator is over them
    set showmatch

    set encoding=UTF-8

    " Disable the default Vim startup message.
    set shortmess+=I

    " Show line numbers.
    set number

    " Show command in bottom bar
    set showcmd

    " Have lines wrap instead of continue off-screen
    set linebreak

    " Always show the status line at the bottom, even if you only have one window open.
    set laststatus=2

    " Disable audible bell because it's annoying.
    set noerrorbells visualbell t_vb=

    " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

    " Show lines above and below cursor (when possible)
    set scrolloff=5

    colorscheme elflord
    

""""""""""
" Search "
""""""""""
    " This setting makes search case-insensitive when all characters in the string
    " being searched are lowercase. However, the search becomes case-sensitive if
    " it contains any capital letters. This makes searching more convenient.
    set ignorecase
    set smartcase

    " Enable searching as you type, rather than waiting till you press enter.
    set incsearch

    " highlight search
    set hlsearch


"""""""""""""""""""""
" Syntax & Behavior "
"""""""""""""""""""""
    " Enable file type detection
    filetype plugin indent on
    set autoindent

    " Visual autocomplete for command menu
    set wildmenu

    " Use 4 spaces instead of tabs during formatting
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    " The backspace key has slightly unintuitive behavior by default. For example,
    " by default, you can't backspace before the insertion point set with 'i'.
    " This configuration makes backspace behave more reasonably, in that you can
    " backspace over anything.
    set backspace=indent,eol,start

    " Allow hidden buffer
    set hidden

    " Unbind some useless/annoying default key bindings.
    " 'Q' in normal mode enters Ex mode. You almost never want this.
    nmap Q <Nop> 

    " Enable mouse support. You should avoid relying on this too much, but it can
    " sometimes be convenient.
    set mouse+=a


"""""""""""
" Folding "
"""""""""""
    set foldenable          " enable folding
    set foldlevelstart=10   " open most folds by default
    set foldnestmax=10      " 10 nested fold max
    set foldmethod=indent   " fold based on indent level

"""""""""""
" Buffers "
"""""""""""
    " Switch buffer
    nnoremap <silent> [b :bprevious<CR>
    nnoremap <silent> ]b :bnext<CR>
    nnoremap <silent> [B :bfirst<CR>
    nnoremap <silent> ]B :blast<CR>

    " Switch argument
    nnoremap <silent> [a :previous<CR>
    nnoremap <silent> ]a :next<CR>
    nnoremap <silent> [A :first<CR>
    nnoremap <silent> ]A :last<CR>


""""""""""""""""""""
" Vim-Plug Section "
""""""""""""""""""""
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \ Plug 'ryanoasis/vim-devicons' |
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tamarin-prover/editors', { 'for': ['spthy', 'm4'] }
    Plug 'airblade/vim-gitgutter'

    Plug 'tpope/vim-fugitive'
    Plug 'rbong/vim-flog'
    Plug 'tpope/vim-commentary'
    Plug 'SirVer/ultisnips'

    Plug 'Shougo/deoplete.nvim',
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()


""""""""""""""""""""
" NERDTree Section "
""""""""""""""""""""
    " Some shortcuts
    nnoremap <leader>n: NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>

    " Automatically start NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

    " Exit Vim if NERDTree is the onlyh window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Show the hidden files
    let NERDTreeShowHidden=1


"""""""""""""
" Ultisnips "
"""""""""""""
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsListSnippets="<c-tab>"
    let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""
" deoplete.nvim "
"""""""""""""""""
    nnoremap <space><space>n :call deoplete#toggle()<CR>


"""""""""""""""""
" vim-gitgutter "
"""""""""""""""""
    set updatetime=100
    highlight SignColumn ctermbg=NONE


""""""""""""""""""""
" deoplete-tabnine "
""""""""""""""""""""
call deoplete#custom#var('tabnine', {
    \ 'line_limit': 500,
    \ 'max_num_results': 15,
    \ })
