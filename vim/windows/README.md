# windows vim 配置

不同于linux平台，window下的vim有些配置细节需要修改调整。


### vundle插件管理

将vundle安装到vim的特定目录下，并且在_vimrc中设置vundle插件安装到与vundle相同的目录下。

`git clone https://github.com/gmarik/vundle D:\Vim\vimfiles\bundle\vundle`

`set rtp+=$VIM/vimfiles/bundle/vundle/`

`call vundle#begin('$VIM/vimfiles/bundle/')`


### 美化状态栏

插件：vim-airline/vim-airline

需要在windows上安装需要的powerline fonts，并且设置vimrc中的guifonts为对应的powerline font

**问题：箭头没有生效，待解决**


### 静态代码分析插件：

插件：scrooloose/syntastic

在window环境下暂时无法使用







