---
title: "手机用户在真实与虚拟空间中的移动"
date: 2015-12-02
---

思考手机用户在真实和虚拟世界的移动本身有什么价值:比较两种类型的网络结构，一个是分形的，一个是小世界的。二者之间不是完全对立的，而是可以平滑过渡的，因而可以计算从小世界到分形的连续变量的取值，即网络增长的过程中，新节点多大程度上按照小世界规则加入网络，多大程度上按照分形加入网络（Song, 2006）。

<!--more-->

自相似或者说分形是本研究切入的重点，分形的特点是在不同尺度上具有相同的特征，这种自相似的特征往往表现为系统特征与观测尺度之间的对应关系。一般对于分形网络而言，重整化之后的盒子数量log(N)与盒子大小log(L)之间存在无标度关系。我们确实也发现人在移动互联网站构成的网络重整化过程中，盒子数量与盒子大小之间具有这种无标度关系，但是人在现实世界的物理移动构成的网络经过重整化，其盒子数量与盒子大小之间则是指数分布。由此可见二者网络结构是如何不同的，前者接近分形，后者接近小世界。

衡量小世界和分形的重要方法是度相关。分形意味着较强的异配性，而小世界则是同配性。正向的度相关意味着同配性和小世界，负向意味着分形。对于同配性的网络度相关通过重整化，一般会被抹平。有趣的是我们发现真实移动网络会由正变负。即当盒子比较大的时候，局部地区的同配性消失，表现出异配性。

Song（2006）将网络增长与重整化看成一个逆过程，网络增长的过程可以看成重整化的尺度由大变小的过程。小世界网络增长的过程中，网络的平均直径L与网络中的节点数量具有对数关系，L ~ Log(N)。重整化需要的步数约等于最终网络的平均直径，例如一个直径是14的网络，大约经过14步重整化会由一个完整的网络坍缩为一个节点。在重整化过程中，所选择的盒子的大小l的取值范围约等于最终网络的平均直径range(L)。

[Hernan Makse](http://www-levich.engr.ccny.cuny.edu/webpage/hmakse/
)是City College of New York的物理学教授，主要从事复杂网络的研究，他和Song Chaoming就分形网络发表了两篇重要论文(Song 2005&2006)。他非常注重代码和数据的分享。我一直关注的是第一作者Song和鼎鼎大名的Havlin，并没有注意到Hernan， 后来搜索实现fractal_model的python代码的时候才找到他，恍然发现他是两篇论文的通讯作者。

在这个算法里面，主要有四个参数：世代（generation)、新增子代数量(m)、子代间新增链接的数量(x)、断开父代链接的比例(e)。每一代是一个操作过程：以这一代的每一条边为单位，该边上的两个节点a和b各自新增子代m个，其中m对子代间形成（x-1)个链接，若随机概率大于e，那么断开父代节点a和b之间的链接，同时增加一条m对子代间链接。


    generation, m, x, e = 2, 1, 1, 0
    G=nx.Graph()
    G.add_edge(0,1) #Two seed nodes(generation 0), then add m offsprings to these seed nodes.
    node_index = 2
    for n in range(1,generation+1):
        print 'STEP:', n, '\n'
        all_links = G.edges()
        while all_links:
                link = all_links.pop() # [(0, 1)] ----> (0, 1)
                print link
                new_nodes_a = range(node_index,node_index + m)
                print link[0], new_nodes_a
                #random.shuffle(new_nodes_a)
                node_index += m
                new_nodes_b = range(node_index,node_index + m)
                #random.shuffle(new_nodes_b)
                print link[1], new_nodes_b
                node_index += m
                G.add_edges_from([(link[0],node) for node in new_nodes_a])
                G.add_edges_from([(link[1],node) for node in new_nodes_b])
                repulsive_links = zip(new_nodes_a,new_nodes_b) # 相斥的的链接
                print repulsive_links
                add_repulsive_links = [repulsive_links.pop() for i in range(x-1)]
                G.add_edges_from(add_repulsive_links) # add edges between offsprings
                print 'add repusive edges', add_repulsive_links
                if random.random() > e: # 当概率大于e的时候，断开hub间的链接
                    print 'delete', link
                    G.remove_edge(*link) # 减少一对hub的链接
                    add_a_repulsive_link = repulsive_links.pop()
                    print 'add_a_repulsive_link', add_a_repulsive_link
                    G.add_edge(*add_a_repulsive_link) #相应得，增加一对其子代的链接

真实世界的移动网络是小世界的。例如Vito Latora 等（2002）分析了波斯顿地铁网络的结构（小世界）。随机网平均直径低，规则网聚类系数高。小世界网络在平均路径长度方面接近随机网，而在聚类系数方面接近规则网。Latora等认为我们对于小世界的两种衡量方式（平均直径L和聚类系数C）有缺陷（ill-defined），因为仅仅强调了链接是否存在，而忽略了链接的`权重`，比如链接的实际长度（the physical length of the link）。他们试图提出一种考虑权重的衡量小世界特征的测量:邻接矩阵 $ a_{ij} $ 表示任意两个节点i、j之间是否有链接; $ l_{ij} $  表示任意两个节点i、j之间的权重（比如地铁站之间的空间距离;使用邻接矩阵  $ a_{ij} $  可以得到节点间的最短路径矩阵  $ d_{ij} $ 。

此时，无法算出聚类系数，因为很多地铁站只有两个邻居，算出的平均直径的信息也很少， $ \varepsilon_{ij} = \frac{1}{N(N-1)d_{ij}}  $  表示输运效率，可以在globa和local两个层面计算，分别对应平均路径长度L和聚类系数C。当两个节点无链接时，其 $ d_{ij} $ 无穷大， $ \varepsilon_{ij} = 0 $ 。避免了计算平均路径长度无穷大的问题。同时可以定义输运成本 $ cost = \frac{\sum_{i\neq j} a_{ij}l_{ij}}{\sum_{i\neq j}l_{ij} } $ 。如此计算波斯顿地铁的MBTA全局输运效率为0.63，局部输运效率为0.03，成本为0.002。即网络整体输运效率可以达到理想情况的63%，但是局部输运效率很差，不过整个网络的成本很小。如果加上公交网络MBTA+bus，全局效率上升为 0.72，局部效率大幅度上升为0.46，花费的成本仅仅上升为0.004。


### 参考文献
Vito Latora（2002）Is the Boston subway a small-world network? Physica A
