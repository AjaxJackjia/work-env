# linux vim 配置

[参考资料1](http://www.cnblogs.com/zhongcq/p/3642794.html)

[参考资料2](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim)

## 插件设置清单

### 1. vundle插件管理

按照[指引](https://github.com/VundleVim/Vundle.vim)进行安装.

* :PluginList        - 列举出列表中(.vimrc中)配置的所有插件

* :PluginInstall     - 安装列表中全部插件

* :PluginInstall!    - 更新列表中全部插件

* :PluginSearch foo  - 查找foo插件

* :PluginSearch! foo - 刷新foo插件缓存

* :PluginClean       - 清除列表中没有的插件

* :PluginClean!      - 清除列表中没有的插件

### 2. 主题风格

使用配色方案solarized.

插件地址： altercation/vim-colors-solarized

```
" 配色方案
set background=dark
set t_Co=256
colorscheme solarized
```

### 3. 目录树导航

插件：vim-scripts/The-NERD-tree

安装：使用Vundle，Plugin 'scrooloose/nerdtree'，然后:PluginInstall

常用：

+ o 打开关闭文件或者目录

+ t 在标签页中打开

+ T 在后台标签页中打开

+ ! 执行此文件

+ p 到上层目录

+ P 到根目录

+ K 到第一个节点

+ J 到最后一个节点

+ u 打开上层目录

+ m 显示文件系统菜单（添加、删除、移动操作）

+ ? 帮助

+ q 关闭

### 4. 标签导航

插件：majutsushi/tagbar

安装：使用Vundle，Plugin 'majutsushi/tagbar'，然后:PluginInstall

PS: linux need ctags. (`sudo apt-get install ctags`)

### 5. 美化状态栏

插件：vim-airline/vim-airline

需要注意的是，使用这个插件的时候需要安装powerline fonts，并且设置vimrc中的guifonts为某个powerline font
    
因为vim airline自带buffer管理，所以可以将多文档编辑插件卸载

### 6. 多文档编辑

~~插件：fholgado/minibufexpl.vim~~

### 7. 括号匹配高亮

插件：luochen1990/rainbow

### 8. 自动补全：YCM

插件：Valloric/YouCompleteMe

按照doc下面的ubuntu安装方式进行安装，最后需要在vimrc中配置complie flags，即

`let g:ycm_global_ycm_extra_conf = '/home/jackjia/.ycm_extra_conf_customized.py'`

### 9. 宏定义补全：TODO

### 10. 快速加减注释

插件：scrooloose/nerdcommenter

常用操作：

+ <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；

+ <leader>cu，取消选中文本块的注释；

+ <leader>c<space>，toggle注释。

### 11. 自动括号补全

插件：Raimondi/delimitMate

### 12. 代码对齐：

插件：godlygeek/tabular

### 13. 静态代码分析：

插件：scrooloose/syntastic




