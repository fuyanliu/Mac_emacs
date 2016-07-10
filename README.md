Mac_emacs
================

This is about my initial file that used for my emacs on Mac.
# 来源
此文件夹下的所有问价都来自于Mac下emacs的相关设置。
# 意义
为了防止以后更换电脑或者各种突发状况导致的文件丢失
# 内容说明
## 1. emacs的初始文件.emacs
## 2. emacs 中mew的配置文件.mew.el
## 3. emacs中上网插件w3m运行产生的一些文件在.w3m文件夹下
## 4. .emacs.d文件夹下包括的文件为emacs中其他应用的所有文件
 
**4.1 orgmode生成PDF的配置文件在.emacs文件夹下的latex-org-setting-new.el，其余文件都为残缺版的配置文件。**
  + 利用latex-org-setting-new.el可以实现大多数的生成PDF的要求，这个文件主要针对的是生成含中文的org；
  + latex-org-setting-new.el的出现结合了网上流行的各种配置文件（具体哪几位不记得了），在后来学习latex的基础上重新规划了一下模版article；
  + **个人建议：**  应用这个文件可以先导出latex文件，然后再调整格式来实现学位论文以及其他要求比较高的期刊文章，亲测使用，非常棒,实例PDF展示如：(https://github.com/fuyanliu/MyMac/blob/master/paper.pdf)。
 
**4.2 插件包管理器melpa下载的各种插件在elpa文件夹下**
  + 还有一些在lisps文件夹下，下面会有说明。
 
**4.3 lisps文件夹包含的文件**
  + ac-dict文件夹下包含的是添加代码在org中时要用到的支持不同语言的插件
  + color-theme.el是设置emacs主题的一个插件
  + **iimage.el**  是在w3m & orgmode中显示图片的插件，但是一直不能成功。**有哪位朋友能够指点一下我这个包下载的对不对，支不支持OS X系统，希望提供一下下载正确iimage.el的地址** 。
  + matlab-emacs folder contains some files that are used for using Command line in the emacs not using the Matlab app. I recommend you ignore these files, because they are so private that is **not available** for your settings.
  + **mew** folder is created when I downdoad the mew using melpa.
  + The case of the org-7.8.11 folder is the same as the mew folder.
  + The themes folder is a repository that's used for storing the optional themes of the emacs. When you reset the theme or add a theme in the emacs, you should use the shortcuts 'M-x color-theme-select' and then try to find your favorite theme and write the **name** of  the theme selected in your .emacs that contains the settings which describe the theme. **NOTES: ** All the things above take effect only after you installing the color-theme.el(https://github.com/fuyanliu/Mac_emacs/tree/master/.emacs.d/lisps). A conventional method is using the mepla.
  + w3m-setting.el is a initialfile that is useful to set the w3m.
  + window-numbering.el是一个给emacs多窗口中不同窗口编号的插件，通过'M+number'即可使cursor跳转到相应数字的窗口。

# 使用说明

这里的大多数文件大多数都不是“拿来主义”，需要自己修改或者自己安装。全部的配置文件的内容可以即刻使用，当然需要你在各个配置文件中安装和配置好里面所需插件及其路径。有不明白的地方可以email我。学习emacs几乎三个月的时间，收获不少，但是犯的错误多之又多。总之emacs是一个学了就实用的IDE，其中的乐趣也只有在学习了之后才能感受到。学无止境，希望大神们能够多多提携帮助。
