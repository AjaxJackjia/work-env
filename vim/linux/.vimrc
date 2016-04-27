" ========================================================
" Vundle config 
" ========================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" ========================================================
" Vundle Customized plugin list
" ========================================================
" tree list view 
Plugin 'scrooloose/nerdtree'
" tag bar view 
Plugin 'majutsushi/tagbar'
" beautiful status line
Plugin 'Lokaltog/vim-powerline'
" color scheme 
Plugin 'altercation/vim-colors-solarized'
" multi buf tag­
Plugin 'fholgado/minibufexpl.vim'
" highlight brackets
Plugin 'luochen1990/rainbow'
" comment plugin
Plugin 'scrooloose/nerdcommenter'
" auto brackets completion
Plugin 'Raimondi/delimitMate'
" automatic alignment
Plugin 'godlygeek/tabular'
" static code analysis
Plugin 'scrooloose/syntastic'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ========================================================
" Vundle Plugin detail setting
" ========================================================
" vim leader setting
let mapleader=","

" NERDTree setting
" automatically open NERDTree when vim starts up 
autocmd vimenter * NERDTree
" NERDTree shortcut
map <leader>n :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1) | q | endif


" Tagbar setting
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
" Tagbar shortcut
map <leader>t :Tagbar<CR>
" filter c/c++ files
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()


" vim powerline setting
let g:Powerline_symbols='unicode'


" multi buf tag setting
" multi buf switch setting
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1
" fix FileExplorer window size problem 
let g:miniBufExplForceSyntaxEnable  = 1
let g:miniBufExplorerMoreThanOne    = 2
let g:miniBufExplCycleArround       = 1
" multi buf switch shortcut
nmap <C-Tab>   : MBEbf<CR>
nmap <C-S-TAB> : MBEbb<CR>
nmap <leader>w : MBEbd<CR>


" highlight brackets setting
let g:rainbow_active = 1


" automatic alignment setting
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

" static code analysis setting
let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons


" ========================================================
" vim basic setting
" ========================================================
" no backup
set nobackup
" turn on real-time search 
set incsearch
" ignorecase when search
set ignorecase
" vim command line mode completion
set wildmenu

" ============================
" vim color scheme
set background=dark
set t_Co=256
colorscheme solarized
"colorscheme desert

" ============================
" vim scroll bar setting
if has('gui_gtk2')
    " forbid cursor blink
    set gcr=a:block-blinkon0
    " disable scroll bar to display
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
    set guioptions-=B
    set guioptions+=c
    " disable menu bar and tool bar
    set guioptions-=m
    set guioptions-=T
endif

" ============================
" always show status bar
set laststatus=2
" show cursor current position
set ruler
" show line number
set number
" highlight current row / column
set cursorline
" set cursorcolumn
" highlight search result
set hlsearch

" ============================
" set font
set guifont=Microsoft\ YaHei\ Mono\ 11.5
" set no wrap
set nowrap

" ============================
" enable syntax highlight function
syntax enable
" allow specific syntax color scheme to change defult scheme
syntax on

" ============================
" adopt different language to indent
filetype indent on
" expand tab to space
set expandtab
" tab is 4 space when typing
set tabstop=4
" format tab is 4 space 
set shiftwidth=4
" continuous 4 spaces could stand for 1 tab
set softtabstop=4

" ============================
" set encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

" ============================
" use third-party tool 'wmctrl' to implement fullscreen(sudo apt-get install wmctrl)
fun! ToggleFullscreen() 
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

" F11 shortcut for fullscreen
nmap <silent> <F11> :call ToggleFullScreen()<CR> 
" automatic fullscreen when enter vim 
autocmd vimEnter * call ToggleFullscreen()      

