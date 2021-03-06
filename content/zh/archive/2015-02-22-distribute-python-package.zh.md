---
title: "打包发布python软件包"
date: 2015-02-22
---
<!--more-->

我们经常写一些程序碎片，却很少有动力把它们整合起来。前段时间写了一个爬取并可视化谷歌学术网的python程序。今天想不如把它整合一下，虽然非常简单（只有一个函数）。主要参考python官网的[发布指南](https://packaging.python.org/en/latest/distributing.html#uploading-your-project-to-pypi)。


##注册
于是首先来到pypi网站注册。

https://pypi.python.org/pypi?%3Aaction=submit_form
记下用户名chengjun和密码W4

##填写软件包信息
《指南》推荐直接在线填写 https://pypi.python.org/pypi?%3Aaction=submit_form

##打包和发布工具
先要安装两个包：twine和wheel。

    pip install wheel
    pip install twine

##整理项目文件夹
找项目实例（https://github.com/pypa/sampleproject）下载下来，修改其中的部分内容即可。详见指南，或者自己摸索即可。

##打包发布
1.在window环境下，使用cmd，转换工作路径到项目文件夹。
2. 主要参考 https://github.com/pypa/twine打包发布：

    #Create some distributions in the normal way:
    $ python setup.py sdist bdist_wheel

    #Upload with twine:
    $ twine upload dist/*

我使用上传的时候出错（typeError），于是直接使用打包好的zip文件（在dist子文件夹当中）手工上传到pypi。注意，每次上传到pypi需要修改一次setup.py中的版本号，并重新打包才可上传。如此而已，比我想象当中要速度快得多、简单的多。

这里是我刚刚打包发布的一个可视化谷歌学术网络的python软件包：[https://pypi.python.org/pypi/scholarNetwork/](https://pypi.python.org/pypi/scholarNetwork/)
