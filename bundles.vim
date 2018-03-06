" vundle 环境设置

" 去除VI一致性,必须要添加
set nocompatible              

" 必须要添加
filetype off

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/vundle

" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
" "call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" " 请将安装插件的命令放在vundle#begin和vundle#end之间.
" " Github上的插件
" " 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" " 来自 http://vim-scripts.org/vim/scripts.html 的插件
" " Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名'
" 只是此处的用户名可以省略
" Plugin 'L9'
" " 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" " 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
" " 插件在仓库的子目录中.
" " 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " 你的所有插件需要在下面这行之前
" call vundle#end()            " 必须
" filetype plugin indent on    " 必须
" 加载vim自带和插件相应的语法和文件类型相关脚本
" " 忽视插件改变缩进,可以使用以下替代:
" "filetype plugin on
" "
" " 常用的命令
" " :PluginList       - 列出所有已配置的插件
" " :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" " :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" " :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" "
" " 查阅 :h vundle 获取更多细节和wiki以及FAQ
" " 将你自己对非插件片段放在这行之后

"------------------
" Code Completions
"------------------
Plugin 'ervandew/supertab'
"--------------
" Fast editing
"--------------
"括号补全
Plugin 'tpope/vim-surround'
"撤销记录列表
Plugin 'sjl/gundo.vim'
" vim 列对齐线
Plugin 'nathanaelkane/vim-indent-guides'
" 自动进行tab2space转换
Plugin 'vim-scripts/Smart-Tabs'

"为buff自动创建不存在的目录
Plugin 'pbrisbin/vim-mkdir'

"--------------
" IDE features
"--------------
"tagbar侧边栏
Plugin 'majutsushi/tagbar'
"工程目录栏
Plugin 'scrooloose/nerdtree'
"快速文件搜索
Plugin 'kien/ctrlp.vim'
" /进行搜索后自动补全
Plugin 'vim-scripts/SearchComplete'

"for git cmdline
Plugin 'tpope/vim-fugitive'

"前后空格显示告警色
Plugin 'bronson/vim-trailing-whitespace'

"生成索引
Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/cscope_dynamic'
Plugin 'vim-scripts/ctags.vim'
"-------------
" Other Utils
"-------------
Plugin 'humiaozuzu/fcitx-status'
"切换当前terminal和vim的鼠标焦点，F12
Plugin 'nvie/vim-togglemouse'
"VIM 字典用于filetype
Plugin 'asins/vim-dict'
Plugin 'vim-scripts/Mark--Karkat'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/a.vim'

"--------------
" Color Schemes
"--------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'sickill/vim-monokai'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 插件列表结束
call vundle#end()
filetype plugin indent on
