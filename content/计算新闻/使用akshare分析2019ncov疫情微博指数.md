+++
highlight = true
math = false
date = "2020-02-13"
title = "使用akshare分析covid19微博指数"
tags = ["news"]

summary = """ 
"""
[header]
image = "headers/neza.svg"
caption = "Image credit: [**Academic**](https://github.com/gcushen/hugo-academic/)"
+++ 

## AkShare

> AkShare 是基于 Python 的开源金融数据接口库, 目的是实现对股票, 期货, 期权, 基金, 外汇, 债券, 指数, 数字货币等金融产品的基本面数据、实时和历史行情数据、衍生数据从数据采集, 数据清洗, 到数据落地的一套开源工具, 满足金融数据科学家, 数据科学爱好者在金融数据获取方面的需求.


AkShare 的特点是获取的是相对权威的金融数据网站公布的原始数据, 广大数据科学家可以利用原始数据进行各数据源之间的交叉验证, 进而再加工, 从而得出科学的结论.

针对新型冠状病毒肺炎疫情，akshare开发了事件接口，链接如下：

[https://akshare.readthedocs.io/zh_CN/latest/data/event/event.html](https://akshare.readthedocs.io/zh_CN/latest/data/event/event.html)

## 安装

```
pip install akshare  --upgrade
```

对于国内用户anaconda使用者，推荐使用以下方法：

```
pip install akshare -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com  --user  --upgrade
```
## 使用

```
import akshare as ak
import pylab as plt
import pandas as pd
import seaborn as sns

# 提取数据
df_index4 = ak.weibo_index(word="武汉", time_type="3month")
df_index6 = ak.weibo_index(word="CDC", time_type="3month")
df_index7 = ak.weibo_index(word="钟南山", time_type="3month")
df_index5 = ak.weibo_index(word="疫情", time_type="3month")
```
然后，使用matplotlib进行可视化。

```
plt.figure(figsize=(12, 6), dpi = 200)
plt.style.use('fivethirtyeight')
plt.plot(df_index4.index, df_index4, label = '武汉', alpha = 0.5)
plt.plot(df_index5.index, df_index5, label = '疫情', alpha = 0.5)
plt.plot(df_index6.index, df_index6, label = 'CDC', alpha = 0.5)
plt.plot(df_index7.index, df_index7, label = '钟南山', alpha = 0.5)
plt.legend()
plt.yscale('log')
plt.xticks(rotation=60)
plt.ylabel('微博指数', fontsize = 20)
plt.show()
```
![微博指数](https://upload-images.jianshu.io/upload_images/38934-7c55a921745a82e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 练习

绘制下图：

![江苏和南京](https://upload-images.jianshu.io/upload_images/38934-d9e561a784f805af.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
