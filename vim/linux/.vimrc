" Auther: jackjia

" ========================================================
"       Vundle config 
" ========================================================
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ==========Vundle Customized plugin list===================
" tree list view 
Plugin 'scrooloose/nerdtree'
" tag bar view 
Plugin 'majutsushi/tagbar'
" beautiful status line
Plugin 'vim-airline/vim-airline'
" color scheme 
Plugin 'altercation/vim-colors-solarized'
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
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe' 

call vundle#end()            " required
filetype plugin indent on    " required


" ========================================================
"       vim basic setting
" ========================================================
" set to auto read when a file is changed from the outside
set autoread
" no backup
set nobackup
" turn on real-time search 
set incsearch
" ignorecase when search
set ignorecase
" vim command line mode completion
set wildmenu
" always show status bar
set laststatus=2
" show cursor current position
set ruler
" show line number
set number
" highlight current row / column
set cursorline
"set cursorcolumn
" highlight search result
set hlsearch
" set font
"set guifont=Microsoft\ YaHei\ Mono\ 11.5
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12

" set no wrap
set nowrap
" expand tab to space
set expandtab
" tab is 4 space when typing
set tabstop=4
" format tab is 4 space 
set shiftwidth=4
" continuous 4 spaces could stand for 1 tab
set softtabstop=4
" adopt different language to indent
filetype indent on
" enable syntax highlight function
syntax enable
" allow specific syntax color scheme to change defult scheme
syntax on
" set encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

" vim leader setting
let mapleader   = ","
let g:mapleader = ","

" fast saving
nmap <C-s> :w!<CR>
" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" toggle paste mode on and off 
map <leader>pp :setlocal paste!<CR>

" ===============vim color scheme====================
set background=dark
set t_Co=256
colorscheme solarized

" ===============vim scroll bar setting==============
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

" =================fullscreen setting================
" use third-party tool 'wmctrl' to implement fullscreen(sudo apt-get install wmctrl)
fun! ToggleFullscreen() 
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

" F11 shortcut for fullscreen
nmap <silent> <F11> :call ToggleFullScreen()<CR> 
" automatic fullscreen when enter vim 
autocmd vimEnter * call ToggleFullscreen()      


" ========================================================
"       Vundle Plugin detail setting
" ========================================================

" ==============NERDTree setting begin==============
" automatically open NERDTree when vim starts up 
autocmd vimenter * NERDTree
" NERDTree shortcut
map <leader>n :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1) | q | endif
" ==============NERDTree setting end==============


" ==============Tagbar setting begin==============
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
" Tagbar shortcut
map <leader>t :Tagbar<CR>
" filter c/c++ files
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" ==============Tagbar setting end==============


" ==============vim airline setting begin==============
let g:airline_powerline_fonts = 1   
" open buf status line 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod= ':t'

" Buffer shortcut"
" move to next buffer
nnoremap <C-Tab>    : bn<CR>
" move to previous buffer
nnoremap <C-S-Tab>  : bp<CR>
" close the current buffer and move to the previous one
nnoremap <C-A-w>    : bp <BAR> bd #<CR>
" ==============vim airline setting end==============


" ==============highlight brackets setting begin==============
let g:rainbow_active = 1
" ==============highlight brackets setting end==============


" ==============automatic alignment setting begin==============
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
" ==============automatic alignment setting end==============


" ==============static code analysis setting begin==============
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
" ==============static code analysis setting end==============


" ==============YouCompleteMe detail setting begin==============
" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
" ==============YouCompleteMe detail setting end==============





