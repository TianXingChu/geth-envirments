# geth-envirments

geth-envirments是帮助非技术人员搭建一套以太坊测试环境的脚本和数据文件. 它与docker版本最大的不同是可以使用**图形化**的界面.

## 前置条件-关闭docker中的geth容器
 这套环境与之前的docker环境相互冲突, 所以在开始之前, 需要关闭docker里面的geth. 简单粗暴一些的方法是彻底关闭docker运行环境: windows用任务管理器, linux和macOs直接kill掉. 如果你对docker很熟悉, 那么关闭之前的geth容器就可以了(非技术人员请注意-关闭窗口不等于关闭geth容器).

## 如何使用

### 第一步 下载以太坊官方版本的geth & tools
在[以太坊官方下载页](https://geth.ethereum.org/downloads/)根据自己的操作系统进行选择, 建议使用稳定版

需要注意, 要下载**geth & tools**而不是**geth**

对于各个操作系统, 下载的文件都有Archive类型, 如果对自己的操作系统有洁癖, 就选Archive类型吧, 下文将以Archive类型为例进行说明.

### 第二步 解压下载下来的geth&tools
创建一个干净的目录, 命名为bitau-suite. 把现在下来的geth&tools解压缩到这个文件. 完成后先不要着急运行任何文件, 进行第三步的操作.

### 第三步 从github上拉去最新的初始化/启动脚本和数据文件
如果还没有安装git, 请到[git](https://git-scm.com/)的官方网站进行[下载](https://git-scm.com/downloads).

进入控制台, cd到上一步创建的bitau-suite目录, 运行
```sh
git clone https://github.com/TianXingChu/geth-envirments.git
```
运行完成后, 应该会在新产生一个名为geth-envirments的目录. 这个时候整个bitau-suite的目录结构应该是下面这样的.
```sh
C:\DEVELOP\BITAU-SUITE
├─geth-envirments
│  │  bootnode.key
│  │  genesis.json
│  │  password
│  │  README.md
│  │  UTC--2017-11-22T05-20-28.347131900Z--b9e7ecf86009b7534ca9f05d867631ca391ea2cd
│  │
│  ├─posix
│  │      initial.sh
│  │      startup.sh
│  │
│  └─windows
│          initial.bat
│          startup.bat
│
└─geth-windows-amd64-1.7.3-4bb3c89d // <-- geth文件夹, 操作系统不同, 名称会不同, 下文统称为"geth文件夹"
        abigen.exe
        bootnode.exe
        COPYING
        evm.exe
        geth.exe
        puppeth.exe
        rlpdump.exe
        swarm.exe
        wnode.exe
```

### 第四步 拷贝数据文件到geth文件夹
将geth-envirments文件夹中的下面三个文件拷贝到geth文件夹.
```sh
bootnode.key // 在云端的boot节点的连接key
genesis.json // 创世区块
password // 创建钱包时的默认密码, 它能避免反复在控制台输入personal.unlockAccount()
```

### 第五步 拷贝初始化/启动脚本到geth文件夹
如果是windows系统, 将geth-envirments/windows文件夹中的文件拷贝到geth文件夹.
```sh
initial.bat // 初始化脚本
startup.bat // 启动脚本
```
如果是inux或macOs系统, 将geth-envirments/posix文件夹中的文件拷贝到geth文件夹.
```sh
initial.sh // 初始化脚本
startup.sh // 启动脚本
```

### 第六步 进行初始化
如果不出意外, 这一步只需执行一次. 在下次一次启动时**不需**执行. 这个操作会删除所有的区块数据和缓存文件, 包括钱包的private-key(如果已经存在).

如果是windows系统, 双击执行initial.bat

如果是linux或macOs, 进入命令行模式, cd到geth文件夹, 然后执行initial.sh
```sh
sh initial.sh
```

### 第七步 启动geth服务

如果是windows系统, 双击执行startup.bat

如果是linux或macOs,进入命令行模式, cd到geth文件夹, 然后执行startup.sh
```sh
sh startup.sh
```

请注意: 无论是windows系统或linux/macOs系统, 关闭窗口都意味着停止geth服务. 停止geth之后无法在下一步的图形界面中管理和使用自己的钱包.

### 第八步 访问图形化界面, 管理自己的钱包**和代币
** 第一个不含铸币和回铸流程的代币合约已开发完成, 整合进图形化界面还需要继续探索

访问寄存在公网的[dapp钱包](http://bitgd.io), 它现在是以太坊官方发布的meteor-dapp-wallet.
