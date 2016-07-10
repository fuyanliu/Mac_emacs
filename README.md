Mac_emacs
================

This about my initial file that used for my emacs on Mac.
# 来源
此文件夹下的所有问价都来自于Mac下emacs的相关设置。
# 意义
味了防止以后更换电脑或者各种突发状况导致的文件丢失
# 内容说明
## 1. emacs的初始文件.emacs
## 2. emacs 中mew的配置文件.mew.el
## 3. emacs中上网插件w3m运行产生的一些文件在.w3m文件夹下
## 4. .emacs.d文件夹下包括的文件为emacs中其他应用的所有文件
 
**4.1 orgmode生成PDF的配置文件件.emacs文件夹下的latex-org-setting-new.el，其于文件都为残缺版的配置文件。**
  + 利用latex-org-setting-new.el可以实现大多数的生成PDF的要求，这个文件主要针对的是中文
  + latex-org-setting-new.el的出现结合了网上流行的各种配置文件（具体哪几位不记得了）
  + **个人建议：**  应用这个文件可以先导出latex文件，然后再调整格式来实现论文以及其他要求高的文章，亲测使用，非常棒,实例PDF展示如：(https://github.com/fuyanliu/MyMac/blob/master/paper.pdf)
 
**4.2 插件包管理器melpa下载的各种插件在elpa文件夹下**
 
**4.3 lisps文件夹包含的文件**
  + ac-dict文件夹下包含的是orgmode中包含的支持不同语言的插件
  + color-theme.el是emacs的主题插件
  + **iimage.el**  为在w3m & orgmode 中显示图片的插件，但是一直不能成功。*有哪位朋友能够指点一下我这个包下载的对不对，支不支持OS X 
  系统，希望提供一下下载正确iimage.el的地址*
  + matlab-emacs folder contains some files that are used for using code mode in the emacs. I recommend you ignore these files, 
  because they are not available for your settings.
  **mew** folder is created when I downdoad the mew using melpa.
  + The case of the org-7.8.11 folder is the same as the mew folder.
  + The themes folder is a repository that's used for setting the theme of the emacs using many improved themes.
  + w3m-setting.el is a intialfile that is useful to set the w3m.
  + window-numbering.el是一个给emacs多窗口的不同窗口编号的插件，通过'meta+number'即可跳到相应窗口

# 使用说明

这里的大多数文件大多数都不是“拿来主义”，需要自己修改或者自己安装，全部的配置文件的内容可以即刻使用。有不明白的地方可以email 我。学习emacs几乎三个月的时间，希望各位大神能够提提建议。
