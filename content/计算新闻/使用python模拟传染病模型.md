+++
highlight = true
math = false
date = "2020-02-13"
title = "使用python模拟传染病模型"
tags = ["news"]

summary = """ 
"""
[header]
image = "headers/neza.svg"
caption = "Image credit: [**Academic**](https://github.com/gcushen/hugo-academic/)"
+++ 

> [Doraemon](https://www.zhihu.com/people/doraemon-63-82)：本文尝试使用python对经典传染病模型进行实现，因传染病模型研究属于传染病动力学研究方向，不是本人的工作范围，因此，本人只是将模型中的微分方程，用Python进行实现，想起到抛砖引玉的效果。来源： https://zhuanlan.zhihu.com/p/104091330

## SI模型


```python
import scipy.integrate as spi
import numpy as np
import matplotlib.pyplot as plt

# N为人群总数
N = 10000
# β为传染率系数
beta = 0.25
# gamma为恢复率系数
gamma = 0
# I_0为感染者的初始人数
I_0 = 1
# S_0为易感者的初始人数
S_0 = N - I_0
# T为传播时间
T = 150

# INI为初始状态下的数组
INI = (S_0,I_0)


def funcSI(inivalue,_):
    Y = np.zeros(2)
    X = inivalue
    # 易感个体变化
    Y[0] = - (beta * X[0] * X[1]) / N + gamma * X[1]
    # 感染个体变化
    Y[1] = (beta * X[0] * X[1]) / N - gamma * X[1]
    return Y

T_range = np.arange(0,T + 1)

RES = spi.odeint(funcSI,INI,T_range)


plt.plot(RES[:,0],color = 'darkblue',label = 'Susceptible',marker = '.')
plt.plot(RES[:,1],color = 'red',label = 'Infection',marker = '.')
plt.title('SI Model')
plt.legend()
plt.xlabel('Day')
plt.ylabel('Number')
plt.show()
```


![image.png](https://upload-images.jianshu.io/upload_images/38934-488036d063686873.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




## SIS模型


```python
import scipy.integrate as spi
import numpy as np
import matplotlib.pyplot as plt

# N为人群总数
N = 10000
# β为传染率系数
beta = 0.25
# gamma为恢复率系数
gamma = 0.05
# I_0为感染者的初始人数
I_0 = 1
# S_0为易感者的初始人数
S_0 = N - I_0
# T为传播时间
T = 150

# INI为初始状态下的数组
INI = (S_0,I_0)


def funcSIS(inivalue,_):
    Y = np.zeros(2)
    X = inivalue
    # 易感个体变化
    Y[0] = - (beta * X[0]) / N * X[1] + gamma * X[1]
    # 感染个体变化
    Y[1] = (beta * X[0] * X[1]) / N - gamma * X[1]
    return Y

T_range = np.arange(0,T + 1)

RES = spi.odeint(funcSIS,INI,T_range)


plt.plot(RES[:,0],color = 'darkblue',label = 'Susceptible',marker = '.')
plt.plot(RES[:,1],color = 'red',label = 'Infection',marker = '.')
plt.title('SIS Model')
plt.legend()
plt.xlabel('Day')
plt.ylabel('Number')
plt.show()
```


![image.png](https://upload-images.jianshu.io/upload_images/38934-4160f1f9056e1d01.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## SIR模型


```python
import scipy.integrate as spi
import numpy as np
import matplotlib.pyplot as plt

# N为人群总数
N = 10000
# β为传染率系数
beta = 0.25
# gamma为恢复率系数
gamma = 0.05
# I_0为感染者的初始人数
I_0 = 1
# R_0为治愈者的初始人数
R_0 = 0
# S_0为易感者的初始人数
S_0 = N - I_0 - R_0
# T为传播时间
T = 150

# INI为初始状态下的数组
INI = (S_0,I_0,R_0)


def funcSIR(inivalue,_):
    Y = np.zeros(3)
    X = inivalue
    # 易感个体变化
    Y[0] = - (beta * X[0] * X[1]) / N
    # 感染个体变化
    Y[1] = (beta * X[0] * X[1]) / N - gamma * X[1]
    # 治愈个体变化
    Y[2] = gamma * X[1]
    return Y

T_range = np.arange(0,T + 1)

RES = spi.odeint(funcSIR,INI,T_range)


plt.plot(RES[:,0],color = 'darkblue',label = 'Susceptible',marker = '.')
plt.plot(RES[:,1],color = 'red',label = 'Infection',marker = '.')
plt.plot(RES[:,2],color = 'green',label = 'Recovery',marker = '.')
plt.title('SIR Model')
plt.legend()
plt.xlabel('Day')
plt.ylabel('Number')
plt.show()
```


![image.png](https://upload-images.jianshu.io/upload_images/38934-157f138dbba55f49.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## SEIR模型


```python
import scipy.integrate as spi
import numpy as np
import pylab as plt

# N为人群总数
N = 10000
# β为传染率系数
beta = 0.6
# gamma为恢复率系数
gamma = 0.1
# Te为疾病潜伏期
Te = 14
# I_0为感染者的初始人数
I_0 = 1
# E_0为潜伏者的初始人数
E_0 = 0
# R_0为治愈者的初始人数
R_0 = 0
# S_0为易感者的初始人数
S_0 = N - I_0 - E_0 - R_0
# T为传播时间
T = 150

# INI为初始状态下的数组
INI = (S_0,E_0,I_0,R_0)
```


```python
def funcSEIR(inivalue,_):
    Y = np.zeros(4)
    X = inivalue
    # 易感个体变化
    Y[0] = - (beta * X[0] * X[2]) / N
    # 潜伏个体变化
    Y[1] = (beta * X[0] * X[2]) / N - X[1] / Te
    # 感染个体变化
    Y[2] = X[1] / Te - gamma * X[2]
    # 治愈个体变化
    Y[3] = gamma * X[2]
    return Y

T_range = np.arange(0,T + 1)
RES = spi.odeint(funcSEIR,INI,T_range)
```


```python
plt.plot(RES[:,0],color = 'darkblue',label = 'Susceptible',marker = '.')
plt.plot(RES[:,1],color = 'orange',label = 'Exposed',marker = '.')
plt.plot(RES[:,2],color = 'red',label = 'Infection',marker = '.')
plt.plot(RES[:,3],color = 'green',label = 'Recovery',marker = '.')

plt.title('SEIR Model')
plt.legend()
plt.xlabel('Day')
plt.ylabel('Number')
plt.show()
```


![image.png](https://upload-images.jianshu.io/upload_images/38934-1c8fc98ac55a253e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## SEIRS模型


```python
import scipy.integrate as spi
import numpy as np
import matplotlib.pyplot as plt

# N为人群总数
N = 10000
# β为传染率系数
beta = 0.6
# gamma为恢复率系数
gamma = 0.1
# Ts为抗体持续时间
Ts = 7
# Te为疾病潜伏期
Te = 14
# I_0为感染者的初始人数
I_0 = 1
# E_0为潜伏者的初始人数
E_0 = 0
# R_0为治愈者的初始人数
R_0 = 0
# S_0为易感者的初始人数
S_0 = N - I_0 - E_0 - R_0
# T为传播时间
T = 150

# INI为初始状态下的数组
INI = (S_0,E_0,I_0,R_0)


def funcSEIRS(inivalue,_):
    Y = np.zeros(4)
    X = inivalue
    # 易感个体变化
    Y[0] = - (beta * X[0] * X[2]) / N + X[3] / Ts
    # 潜伏个体变化
    Y[1] = (beta * X[0] * X[2]) / N - X[1] / Te
    # 感染个体变化
    Y[2] = X[1] / Te - gamma * X[2]
    # 治愈个体变化
    Y[3] = gamma * X[2] - X[3] / Ts
    return Y

T_range = np.arange(0,T + 1)

RES = spi.odeint(funcSEIRS,INI,T_range)


plt.plot(RES[:,0],color = 'darkblue',label = 'Susceptible',marker = '.')
plt.plot(RES[:,1],color = 'orange',label = 'Exposed',marker = '.')
plt.plot(RES[:,2],color = 'red',label = 'Infection',marker = '.')
plt.plot(RES[:,3],color = 'green',label = 'Recovery',marker = '.')

plt.title('SEIRS Model')
plt.legend()
plt.xlabel('Day')
plt.ylabel('Number')
plt.show()
```

![image.png](https://upload-images.jianshu.io/upload_images/38934-1708ded28e6acb24.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


推荐大家阅读Albert-Laszlo Barabasi的书[***Network Science***](http://barabasi.com/networksciencebook/chapter/1)，大家可以在如下网站直接阅读传染病模型这一章：[http://barabasi.com/networksciencebook/chapter/10#contact-networks](http://barabasi.com/networksciencebook/chapter/10#contact-networks)。有两个Hypothesis：1,Compartmentalization; 2, Homogenous Mixing。具体看教材。默认条件：1, closed population; 2, no births; 3, no deaths; 4, no migrations.
