https://api.n3ro.io/api/client/clash/N3RO%20Network.yml?id=1992&password=MhlVfgJJ13dZ
只专注于一个领域的学习让人变得狭隘，广泛的涉猎可以启迪人的思想，并且可以拿别的成果为我所用。但是人的精力往往又是有限的，
专注一个领域的学习时又很难同时兼顾其他领域的前沿学习，听讲座便成为了我们研究生学习生活中最快了解其他领域前沿知识的平台。
来为我们做科研讲座的各位学者都是各个领域当中的翘楚，他们植根于这个领域多年，并且颇有建树，始终引领该领域发展的前线，通过
听取他们的分享，我收获颇丰。
令我印象深刻的是武汉大学一位老师带来的关于无人驾驶方面的讲座，他浅显易懂地阐述了无人驾驶方面的实现机理，又深刻的剖析了无人驾驶
领域想要推广开来所面临的伦理问题：无人驾驶的汽车出现事故之后的责任认定问题，是抓捕当时坐在车里的司机呢，还是归咎于书写代码的程序员，
同时风趣幽默地讲解了几个美国无人驾驶中出现事故的小例子，把我们对一个产业推行中所产生的问题做了一个深刻的讲解，阻碍当前无人驾驶发展的
不光是繁杂的技术难关，还有与此相关而产生的各种各样的法律问题，告诉我们技术的发展从来不能脱离社会，要收到社会舆论以及社会责任的监控，
这同样也是人类对待机器人和人工智能的担忧。同时老师又给我们解析了无人驾驶的四种模式，每种模式对应着不同的“驾驶自由度“，无人驾驶的最终目的是建立
完全自动不需要司机把握意外情况的驾驶体验，从此汽车领域的主导权从原始的老牌造车企业向汽车服务管理企业倾斜，人们的生活变成可以用手机APP
申请用车，无人驾驶的车过来接你并将你送到目的地，汽车自动泊到附近停车点，安全、有序、自由的有车模式。
除此之外我还听了一些深度神经网络的相关报道，例如胶囊网络等等，还有一些偏向数学与密码学方面的一些讲座，例如当前对析取合取范式相关的研究，
在听取胶囊网络报告的过程当中也有很多点对我产生了一些启发：普通的神经网络具有平移不变性，很难去分辨出物体的移动，比如对于一样五官位置混乱的人脸，
普通的神经网络还是会认为他是一张脸，因为代表人脸的特征还在，但是对于胶囊神经网络来说，它就可以分辨出这张人脸的异常之处，这又让我想到了当时在看的
一篇论文：bignet网络，该论文就提出了神经网络仅仅利用了图像的局部信息就可以对图像进行分类，而非利用全局信息。
通过听取各位优秀学者给我们带来的精彩分享，拓宽了我们的视野，同时还给了我们科学素养和看待问题眼光方面的启示，同样这些优秀学者始终奋斗在技术一线，
为引领该领域而做出的奋斗值得我学习。
第一次报告：
kinectfusion:
研究生入学之后，在丁师兄的指导下，我选择了三维重建作为我的科研方向，刚刚接触该方向的我对很多知识都十分陌生，师兄给了我一份论文：kinectfusion，是一篇11年的论文，十分经典，它的出现打破了以往三维重建工作的诸多弊端，利用了cuda加速tracking，rendering等各个环节，真正的达到了实时性，提升了用户体验，并且对于AR、VR的发展和应用有很大的帮助。我尝试去复现这篇论文，文章中关键部分的伪代码写的比较详细，但是当时对我对于光线投影模型，icp迭代最近点算法，tsdf阶段有符号距离公式等等概念并不清晰，因此实现过程当中遇到了诸多困难，还有因为其重建了一个世界观：用n*n*n的voxel包裹住所要重建的物体，n的大小决定重建过程当中的精细程度。在计算tsdf的时候需要便利所有的voxel，这个过程是十分耗时的，所以必须要用GPU进行加速，刚开始我对cuda并不了解，然后也因此学习了一些cuda多线程方面的知识，使用过程当中遇到的很多困难，比如将点云向深度图做投影的过程当中，有时候会出现同个像素位置访问冲突的时候，我们就需要用lock或者原子性操作来解决这些问题，同时这也对我本科阶段学习的操作系统有了更加深刻的认知。在实现过程当中我对cuda逐渐有了更多的理解，比如如何设置grid、block的线程数目可以使GPU的效率最高，如何设置栅栏同步线程等等。最终这个任务实现完成，同时在1060的显卡以及6G显存的配置下实现了15FPS的效果，基本实现了实时性的要求。在这个过程当中，我学到了如何把握一个方向的发展脉络，如果更好地阅读论文，同时也要感谢健铭和宏基两位师兄为我解释了很多数学方面的知识，帮助我更加深刻地理解了很多步骤的理论。
第二次报告：
因为对神经网络浪潮的向往，我投入到了一些深度神经网络的项目当中，在丁师兄的指导之下，我做了一些2D图像信息与3D点云信息结合的方式来提高人脸信息识别准确率的方法。首先这个方式基于一个假设：对于2D人脸信息来说，信息丰富度高的地方集中在面部三角区域，对于3D点云（深度图）来说，信息丰富度高的地方在于人的面颊区域，因为在这个地方会有较高梯度的脸部凸起，其他地方比如面部则高低变化不太明显，信息丰富度较少，基于上述信息我们得出一个结论，如果能将人脸的2D图像的五官区域信息与深度图3D的脸周边轮廓信息的结合，利用这些强信息可以提高人脸信息的识别准确率。基于上述假设我做了一些实验，首先利用了比较容易实现的基于人脸的性别分类问题，基本步骤是对于2D和3D深度图信息，选取一张标准脸，将所有其他脸向标准脸对其，在这个步骤当中我采用了15年的一篇论文MTCNN中的方法，提取了人脸三角区域的关键点：两个眼睛的位置、鼻子的位置、两个嘴角的位置，基于这些关键点位置构建仿射变换来实现对其，然后将对齐后的图像输入到一个resnet-18的网络当中，得出单纯用深度图实现和2D图的准确度。结合的方式有很多种，比较容易想到的就是维度贴合，将RGB三维数据转成RGBD四维数据，将该数据放入网络当中进行识别，同时还有提取两个维度的特征，然后对特征进行连接，将连接后的特征输入到一个svm分类器模型当中，查看这种结合方式的准确率，两种实验结果显示准确率比起两种信息单独使用均有接近1%的准确率提高。在这个时候我看到了一篇论文bagnet网络，其基本思想是对于图像来说局部信息可以帮助进行类别判断，对于每个局部信息来说，我们最终可以得出该部分对于判断这个图像属于某种类型的重要程度，看了这篇论文之后我感觉他的思想和我提出的假设很契合，然后就实现了这个网络，但是研究的道路很坎坷，通过这个网络得出了不同部分的重要程度，但是其重要性并没有呈现我们想要的结果，已获得部分我有尝试用pointnet网络提取人脸点云的关键信息，从10万个点当中抽取1024个点，发现了对于点云来说它的关键点确实分布在人的脸部周围还有鼻梁附近，因为采集设备的影响，人眼睛部分高低起伏并不明显，所以没有很明确的得出眼睛重要的结论。不过这次经历让我对神经网络及一些深度模型架构有了更加深刻的理解，并且掌握了很多相关的基础知识，受益匪浅。

第三次报告：
在与丁博进行讨论之后，我们大体决定了毕业论文的选题，我基于之前做的kinectfusion部分继续深入，实现更好的三维重建方法。我又看了一下3维重建部分的论文，发现了另一篇里程碑式的论文：voxelhashing。它的很多思想比如ICP对齐部分，tsdf部分都与kinectfusion有异曲同工之妙，但是其提出了hash方法来储存voxel，极大地解决了kinectfusion当中所存在的一个很大缺陷：无法实现扩容。kinectfusion的重建大小是预先设定的，而且要全部放入到显存当中，这就注定了它不能实现大场景下三维重建的任务。在此基础上，文章提出了voxelhashing的方法，每次只将一定范围（球形）范围区域的voxel放入到GPU当中，放入的过程当中遵循hash方式寻找它的对应位置，这样我们就把读入到GPU显存中的数据变成了一个线性数组，极大地较少了对于显存的占用，同时因为GPU每次处理的voxel有限，不用像kinectfusion那样处理很多无效数据，这样也大大地提高了运算速度，在运行结束之后将显存中的信息再回传到内存当中，方便下一帧融合时使用，我同样复现了这篇论文，因为有之前kinectfusion的基础，其中主要脉络的实现过程比较轻松，但是因为引入了hash操作，所以涉及了很多读写锁的操作，繁杂的操作对于系统的稳定性又提出了很高的要求。三维重建的工作在2017年之后逐渐转向了利用深度神经网络来实现重建，在17年的经典论文当中仍然推举voxelhashing方法为静态场景重建的最佳方法。13年-17年间的很多工作基本都专注于前后两帧的对齐方法，包含基于RGB图的矫正，SLAM方法等等。下一步的任务我想多读一些论文，实现其中的一些经典算法，从而尝试能自己推陈出新，提出自己的一些想法。
4KUMPE5K2J-eyJsaWNlbnNlSWQiOiI0S1VNUEU1SzJKIiwibGljZW5zZWVOYW1lIjoi5q2j54mI5o6I5p2DIC4iLCJhc3NpZ25lZU5hbWUiOiIiLCJhc3NpZ25lZUVtYWlsIjoiIiwibGljZW5zZVJlc3RyaWN0aW9uIjoiRm9yIGVkdWNhdGlvbmFsIHVzZSBvbmx5IiwiY2hlY2tDb25jdXJyZW50VXNlIjpmYWxzZSwicHJvZHVjdHMiOlt7ImNvZGUiOiJJSSIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9LHsiY29kZSI6IkFDIiwicGFpZFVwVG8iOiIyMDIwLTA1LTI5In0seyJjb2RlIjoiRFBOIiwicGFpZFVwVG8iOiIyMDIwLTA1LTI5In0seyJjb2RlIjoiUFMiLCJwYWlkVXBUbyI6IjIwMjAtMDUtMjkifSx7ImNvZGUiOiJHTyIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9LHsiY29kZSI6IkRNIiwicGFpZFVwVG8iOiIyMDIwLTA1LTI5In0seyJjb2RlIjoiQ0wiLCJwYWlkVXBUbyI6IjIwMjAtMDUtMjkifSx7ImNvZGUiOiJSUzAiLCJwYWlkVXBUbyI6IjIwMjAtMDUtMjkifSx7ImNvZGUiOiJSQyIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9LHsiY29kZSI6IlJEIiwicGFpZFVwVG8iOiIyMDIwLTA1LTI5In0seyJjb2RlIjoiUEMiLCJwYWlkVXBUbyI6IjIwMjAtMDUtMjkifSx7ImNvZGUiOiJSTSIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9LHsiY29kZSI6IldTIiwicGFpZFVwVG8iOiIyMDIwLTA1LTI5In0seyJjb2RlIjoiREIiLCJwYWlkVXBUbyI6IjIwMjAtMDUtMjkifSx7ImNvZGUiOiJEQyIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9LHsiY29kZSI6IlJTVSIsInBhaWRVcFRvIjoiMjAyMC0wNS0yOSJ9XSwiaGFzaCI6IjEzMjI3MjUzLzAiLCJncmFjZVBlcmlvZERheXMiOjAsImF1dG9Qcm9sb25nYXRlZCI6ZmFsc2UsImlzQXV0b1Byb2xvbmdhdGVkIjpmYWxzZX0=-Lp1rjkeg7jTNPStvLOrJT8vGP/sqmxMe8RVfDVAGQHkQwXkAw1w3W27QLNEmGtw+a6b3zgra98C2I5owLx4ANI25xau7PVa3pteAu5+WHbuT29+H4OCSJAxNZpzeAlcOHlknSlHLO/um11H9wWzq3B1XRoNE7Hy+UHimXjngrO77BOPrbrNxqqVyuT3s66ea/4RAAFqrax4rTIqUxw4HVVQQS5qGpQPArUyuKgkolLFmKSXNl4Yuyc3CCNeV8JvhQDyzTKOZEUzNkZ59VUrtaGcDDCrOZALRAekjL0dVE+gI/T2d0H3gp5dEDZeSdDLwTX3dkbCTaxfSgj+UpuLM3A==-MIIElTCCAn2gAwIBAgIBCTANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1KZXRQcm9maWxlIENBMB4XDTE4MTEwMTEyMjk0NloXDTIwMTEwMjEyMjk0NlowaDELMAkGA1UEBhMCQ1oxDjAMBgNVBAgMBU51c2xlMQ8wDQYDVQQHDAZQcmFndWUxGTAXBgNVBAoMEEpldEJyYWlucyBzLnIuby4xHTAbBgNVBAMMFHByb2QzeS1mcm9tLTIwMTgxMTAxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxcQkq+zdxlR2mmRYBPzGbUNdMN6OaXiXzxIWtMEkrJMO/5oUfQJbLLuMSMK0QHFmaI37WShyxZcfRCidwXjot4zmNBKnlyHodDij/78TmVqFl8nOeD5+07B8VEaIu7c3E1N+e1doC6wht4I4+IEmtsPAdoaj5WCQVQbrI8KeT8M9VcBIWX7fD0fhexfg3ZRt0xqwMcXGNp3DdJHiO0rCdU+Itv7EmtnSVq9jBG1usMSFvMowR25mju2JcPFp1+I4ZI+FqgR8gyG8oiNDyNEoAbsR3lOpI7grUYSvkB/xVy/VoklPCK2h0f0GJxFjnye8NT1PAywoyl7RmiAVRE/EKwIDAQABo4GZMIGWMAkGA1UdEwQCMAAwHQYDVR0OBBYEFGEpG9oZGcfLMGNBkY7SgHiMGgTcMEgGA1UdIwRBMD+AFKOetkhnQhI2Qb1t4Lm0oFKLl/GzoRykGjAYMRYwFAYDVQQDDA1KZXRQcm9maWxlIENBggkA0myxg7KDeeEwEwYDVR0lBAwwCgYIKwYBBQUHAwEwCwYDVR0PBAQDAgWgMA0GCSqGSIb3DQEBCwUAA4ICAQAF8uc+YJOHHwOFcPzmbjcxNDuGoOUIP+2h1R75Lecswb7ru2LWWSUMtXVKQzChLNPn/72W0k+oI056tgiwuG7M49LXp4zQVlQnFmWU1wwGvVhq5R63Rpjx1zjGUhcXgayu7+9zMUW596Lbomsg8qVve6euqsrFicYkIIuUu4zYPndJwfe0YkS5nY72SHnNdbPhEnN8wcB2Kz+OIG0lih3yz5EqFhld03bGp222ZQCIghCTVL6QBNadGsiN/lWLl4JdR3lJkZzlpFdiHijoVRdWeSWqM4y0t23c92HXKrgppoSV18XMxrWVdoSM3nuMHwxGhFyde05OdDtLpCv+jlWf5REAHHA201pAU6bJSZINyHDUTB+Beo28rRXSwSh3OUIvYwKNVeoBY+KwOJ7WnuTCUq1meE6GkKc4D/cXmgpOyW/1SmBz3XjVIi/zprZ0zf3qH5mkphtg6ksjKgKjmx1cXfZAAX6wcDBNaCL+Ortep1Dh8xDUbqbBVNBL4jbiL3i3xsfNiyJgaZ5sX7i8tmStEpLbPwvHcByuf59qJhV/bZOl8KqJBETCDJcY6O2aqhTUy+9x93ThKs1GKrRPePrWPluud7ttlgtRveit/pcBrnQcXOl1rHq7ByB8CFAxNotRUYL9IF5n3wJOgkPojMy6jetQA5Ogc8Sm7RG6vg1yow==
