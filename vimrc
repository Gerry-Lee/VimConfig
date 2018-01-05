"
"au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
"au FileType css setlocal dict+=~/.vim/dict/css.dict
"au FileType c setlocal dict+=~/.vim/dict/c.dict
"au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
"au FileType scale setlocal dict+=~/.vim/dict/scale.dict
"au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/javascript.dict
"au FileType html setlocal dict+=~/.vim/dict/css.dict

"
"syntastic相关
"execute pathogen#infect()
"let g:syntastic_python_checkers=['pylint']
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
""golang
""Processing... % (ctrl+c to stop)
"let g:fencview_autodetect=0
"set rtp+=$GOROOT/misc/vim
source ~/.vim/bundles.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
"color desert     " 设置背景主题  
color ron     " 设置背景主题  
"color torte     " 设置背景主题  
" 告诉vim terminal支持 256 colors
" "在windows中用xshell连接打开vim可以显示色彩
set t_Co=256
" 设置字体  
set guifont=Tsentsiu\ Mono\ HG\ 16
" color scheme
"set background=dark
"color solarized
"color monokai
"colors Tomorrow-Night-Eighties
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
"继承前一行的缩进方式，特别适用于多行注释 
set autoindent
"为C程序提供自动缩进
set smartindent
"使用C样式的缩进  
set cindent
" 启动 vim 时关闭折叠代码
"set nofoldenable
" 允许折叠
set foldenable       
" 基于缩进或语法进行代码折叠
set foldmethod=indent   " 更多的缩进表示更高级别的折叠  
set foldmethod=syntax
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
"打开文件类型检测, 加了这句才可以用智能补全
filetype plugin indent on 

" 不同文件类型不同插件和缩进
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType make setlocal noexpandtab

" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
" 禁止光标闪烁
set gcr=a:block-blinkon0

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Gerry Lee") 
		call append(line(".")+2, "	> Mail: gerrylee1993@gmail.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <stdlib.h>")
		call append(line(".")+8, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""
" 代码修改配置
"""""""""""""""""""""""""""""""""""""""""
" 让配置变更立即生效
autocmd! BufWritePost $HOME/.vimrc source %
" 在另外一个vim中加载被修改过的vimrc
cnoreabbrev vimreload so $HOME/.vimrc

"""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""

" 定义前缀键
let mapleader=";"

" 定义快捷键到行首和行尾
"nmap LB 0
"nmap LE $

" 定义git grep 快捷键
cnoreabbrev grep !git grep


" 剪切到剪切板
nmap <Leader>d "+d
" 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 遍历子窗口
nnoremap nw <C-W><C-W>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
nmap <F5> :TagbarToggle<cr>
"列出当前目录文件  
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <C-F11> :!cscope -bRq<cr>
nmap <C-F12> :!ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull --extra=+ .<cr>
"代码格式优化化
map <F7> :call FormartSrc()<CR><CR>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
"cmap w!! %!sudo tee >/dev/null %

" eggcache vim
:command! W w
:command! WQ wq
:command! Wq wq
:command! Q q
:command! Qa qa
:command! QA qa
":nmap <silent> <F9> <ESC>:Tlist<RETURN>
"" shift tab pages
"map <S-Left> :tabp<CR>
"map <S-Right> :tabn<CR>
"map! <C-Z> <Esc>zzi
"map! <C-O> <C-Y>,
"map <C-A> ggVG$"+y
"map <Esc><Esc> :w<CR>
"map <F12> gg=G
"map <C-w> <C-w>w
"imap <C-k> <C-y>,
"imap <C-t> <C-q><TAB>
"imap <C-j> <ESC>
"" 选中状态下 Ctrl+c 复制
""map <C-v> "*pa
"imap <C-v> <Esc>"*pa
"imap <C-a> <Esc>^
"imap <C-e> <Esc>$
"vmap <C-c> "+y
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"打开树状文件目录  
"map <C-F3> \be  
":autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++ 按F5编译运行
"map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
"map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"" 只剩 NERDTree时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
"set completeopt=preview,menu 
"共享剪贴板  
set clipboard+=unnamed 
"自动保存
set autowrite
set cursorline              " 突出显示当前行
set cursorcolumn            " 突出显示当前列
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
""set foldlevel=3 
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
"set smartcase

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" yum install wmctrl
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 禁止在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse-=a
" 不自动换行
set nowrap
" 一行到80个字符时就自动换行
set textwidth=80
"允许区域选择
set selection=exclusive
"set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
"自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endfunction
set completeopt=longest,menu

" minibufexpl插件的一般设置
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1  
"nmap tl :Tlist<cr>

"python补全
"let g:pydiction_location = '~/.vim/after/complete-dict'
"let g:pydiction_menu_height = 20
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"autocmd FileType python set omnifunc=pythoncomplete#Complete

"filetype off                   " required!

"""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""
" a.vim
" :A 跳到与当前.c同名的.h文件
nmap ha A
" :IH 跳到光标所在的单词对应的文件
nmap hi IH

" c.vim 默认不需要具体配置

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required!
"Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'Yggdroot/indentLine'
"let g:indentLine_char = '┊'
""ndle 'tpope/vim-rails.git'
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"" non github repos
"Bundle 'https://github.com/wincent/command-t.git'
"Bundle 'Auto-Pairs'
"Bundle 'python-imports.vim'
"Bundle 'CaptureClipboard'
"Bundle 'ctrlp-modified.vim'
"Bundle 'last_edit_marker.vim'
"Bundle 'synmark.vim'
""Bundle 'Python-mode-klen'
"Bundle 'SQLComplete.vim'
"Bundle 'Javascript-OmniCompletion-with-YUI-and-j'
""Bundle 'JavaScript-Indent'
""Bundle 'Better-Javascript-Indentation'
"Bundle 'jslint.vim'
"Bundle "pangloss/vim-javascript"
"Bundle 'Vim-Script-Updater'
"Bundle 'ctrlp.vim'
"Bundle 'tacahiroy/ctrlp-funky'
"Bundle 'jsbeautify'
"Bundle 'The-NERD-Commenter'
""django
"Bundle 'django_templates.vim'
"Bundle 'Django-Projects'

"Bundle 'FredKSchott/CoVim'
"Bundle 'djangojump'
" ...
"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"

" ctrlp.vim 快速文件查找
" 支持正则查询
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
" 过滤文件
set wildignore+="*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store"
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o|mod.c)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" 使用git index给搜索加速
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

let g:ctrlp_extensions = ['funky']
let NERDTreeIgnore=['\.pyc']

"SuperTab插件
let g:SuperTabRetainCompletionType=2
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward= "<s-tab>"

"cscope.vim
if has("cscope") && filereadable("/usr/local/bin/cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    "set cscopeverbose
    " add any database in current directory
    if filereadable("cscope.out")
       cs add $PWD/cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
    endif
    set csverb
 
    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csfs cs find s
    cnoreabbrev csfc cs find c
    cnoreabbrev csfe cs find e
    cnoreabbrev csft cs find t
    cnoreabbrev csfd cs find d
    cnoreabbrev csfi cs find i
    cnoreabbrev csfg cs find g
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    cnoreabbrev cs cs find s <cword>
    cnoreabbrev cc cs find c <cword>
    cnoreabbrev ce cs find e <cword>
    cnoreabbrev ct cs find t <cword>
    cnoreabbrev cd cs find d <cword>
    cnoreabbrev ci cs find i ^<cfile>$
    cnoreabbrev cg cs find g <cword>
    cnoreabbrev cf cs find f <cword>

    nnoremap <C-s>s :cs find s <cword><CR>
    nnoremap <C-s>g :cs find g <cword><CR>
    nnoremap <C-s>c :cs find c <cword><CR>
    nnoremap <C-s>t :cs find t <cword><CR>
    nnoremap <C-s>e :cs find e <cword><CR>
    nnoremap <C-s>f :cs find f <cfile><CR>
    nnoremap <C-s>i :cs find i ^<cfile>$<CR>
    nnoremap <C-s>d :cs find d <cword><CR>
endif
"term
if &term=="xterm"
     set t_Co=256
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" ctags.vim
" ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull

" gundo.vim 调用 gundo 树
" u命令取消最近一次的操作，可以使用多次来恢复原有的操作
" U取消所有操作
" Ctrl+R可以恢复对使用u命令的操作
nnoremap <Leader>ud :GundoToggle<CR>
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

" nerdtree
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=25
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI=1

" Tagbar
""设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
"打开文件自动 打开tagbar
autocmd VimEnter * nested :TagbarOpen
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 自动聚焦
let g:tagbar_autofocus=0
let g:tagbar_iconchars = ['▸', '▾']
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" airline
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
"let g:airline_theme='base16_solarized'
"let g:airline_detect_modified=1
"let g:airline_detect_paste=1
"let g:airline_inactive_collapse=0
"let g:airline_detect_spell=0
"let g:airline_detect_crypt=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '|'

" airline自有插件
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#branch#vcs_priority = ["git"]
"let g:airline#extensions#branch#format = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_label = 'b'
"let g:airline#extensions#tabline#tabs_label = 't'

" 跳到具体的tab 使用 :b 1<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>

"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#virtualenv#enabled = 1
"let g:airline#extensions#capslock#enabled = 1
"
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
"
"let g:airline#extensions#quickfix#enabled = 1
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"let g:airline#extensions#quickfix#location_text = 'Location'

" indent_guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
let g:indent_guides_indent_levels = 10
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" vim-trailing-whitespace
cnoreabbrev fixws FixWhitespace

"Mark 高亮多个word
set viminfo+=!
let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 0

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
"set completeopt+=longest,menu
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
" YCM 补全菜单配色
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#D3D3D3 guibg=#005555
" YCM选中项配色
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#D3D3D3 guibg=#004444
" 设置在下面几种格式的文件上屏蔽ycm
"let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'nerdtree' : 1,
"      \}

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
"注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1

" 从第2个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1

" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>

" Tab与空格之间进行转换
" Convert all leading spaces to tabs (default range is whole file):
" ---:Space2Tab
" Convert lines 11 to 15 only (inclusive):
" ---:11,15Space2Tab
" Convert last visually-selected lines:
" ---:'<,'>Space2Tab
" Same, converting leading tabs to spaces:
" ---:'<,'>Tab2Space
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)


"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Process_File_Always = 1
" 设置tags  
"set tags=tags;  
"set tags+=/usr/include/tags;
"set autochdir 
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" 默认打开Taglist
"let Tlist_Auto_Open = 1
" 按照名称排序
"let Tlist_Sort_Type = "name"
"let Tlist_Exist_OnlyWindow = 1
"let Tlist_Process_File_Always = 1
" 压缩方式
"let Tlist_Compart_Format = 1
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File=1            

