配置文件分为linux平台和window平台。

有两点需要注意：

1. windows与linux因为平台换行符不同，所以不通用, 如果需要从windows平台转为linux平台，使用dos2unix命令；

2. windows与linux vimrc的字体格式设置不同；


================================================

# linux vim 配置

(参考)[http://www.cnblogs.com/zhongcq/p/3642794.html]

1. vundle插件管理；
https://github.com/VundleVim/Vundle.vim，按照指引进行安装；

:PluginList -列举出列表中(.vimrc中)配置的所有插件
:PluginInstall -安装列表中全部插件
:PluginInstall! -更新列表中全部插件
:PluginSearch foo -查找foo插件
:PluginSearch! foo -刷新foo插件缓存
:PluginClean -清除列表中没有的插件
:PluginClean! -清除列表中没有的插件

2. 主题风格：
    使用配色方案solarized， altercation/vim-colors-solarized
   " 配色方案
    set background=dark
    set t_Co=256
    colorscheme solarized

3. 窗口设置：
    全屏、状态栏隐藏；

4. 目录树导航：
    插件：vim-scripts/The-NERD-tree
    安装：使用Vundle，Plugin 'scrooloose/nerdtree'，然后:PluginInstall
    常用：
        ctr+w+h 光标focus左侧树形目录，ctrl+w+l 光标focus右侧文件显示窗口。多次摁 ctrl+w，光标自动在左右侧窗口切换
        o 打开关闭文件或者目录
        t 在标签页中打开
        T 在后台标签页中打开
        ! 执行此文件
        p 到上层目录
        P 到根目录
        K 到第一个节点
        J 到最后一个节点
        u 打开上层目录
        m 显示文件系统菜单（添加、删除、移动操作）
        ? 帮助
        q 关闭

5. 标签导航：
    插件：majutsushi/tagbar
    安装：使用Vundle，Plugin 'majutsushi/tagbar'，然后:PluginInstall

6. 美化状态栏：
    插件：Lokaltog/vim-powerline
    
7. 多文档编辑：
    插件：fholgado/minibufexpl.vim

8. 括号匹配高亮：
    插件：luochen1990/rainbow

9. 自动补全：YCM， TODO
    http://www.cnblogs.com/zhongcq/p/3630047.html

10. 宏定义补全：TODO

11. 快速加减注释：
    插件：scrooloose/nerdcommenter
    常用操作：
        <leader>cc，注释当前选中文本，
        如果选中的是整行则在每行首添加 //，
        如果选中一行的部分内容则在选中部分前后添加分别 /、/；
        <leader>cu，取消选中文本块的注释；
        <leader>c<space>，toggle注释。

12. 自动括号补全：
    插件：Raimondi/delimitMate

13. 代码对齐：
    插件：godlygeek/tabular

14. 静态代码分析：
    插件：scrooloose/syntastic





