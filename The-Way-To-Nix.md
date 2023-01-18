# The Way to Nix

> 须知 1：你不应当从本文章中照抄 **任何你不理解的命令和操作!** 我的博客只是二手知识，并且缺乏时效性。本篇文章主要写于 NixOS 22.11 版本。你对你机器负有第一责任，所以应尽量按照受维护的官方文档来执行操作尤其是高危操作（如 **安装系统**）。而文章的作用是帮助你了解和熟悉那些东西，达到祛魅和扫除迷茫的效果。
> 
> 须知 2：关于本文任何的表述错误、表述缺失、表述模糊，欢迎在两个仓库 [github:Yakkhini/YeChaNvCinema](https://github.com/Yakkhini/YeChaNvCinema) 和 [github:Yakkhini/nixos-flake](https://github.com/Yakkhini/nixos-flake)（这个暂为私密 repo）中提 Issues。如果感觉内容有帮助，也可以 star 这两个仓库。

*原文部署于 [Yaksis' work - Nix](https://yechanv.vercel.app/#/linux/20220629-nix)*

今年春天的时候知道了 Nix 和 Nix OS，立刻就产生了很大兴趣。我比较喜欢它原子化系统和函数式生成的哲学。

用了很久的 Linux 桌面，也算是了解了其中的一些好处和坏处。最令我不满意的是 Linux 系统中始终有一些文件游离于我的控制之外。大部分的 Linux 发行版都有包管理器，让它的文件安装系统比 Windows 东装一块、西装一块的繁杂错乱好上不少。但是我的 `~/.config` 文件夹现在简直就像一场灾难。已装的和被卸载的软件，那些配置文件和配置文件夹堆在一起，令人很不满意。

除此之外，在使用了很久 Linux 系统后，我发现了一个令人难过的事情：我可能根本不知道我的电脑上目前装了多少个软件，每个软件是干什么用的、哪个软件其实是没什么必要、可以卸载的。

是的，虽然我有包管理器，可以使用 `yay -Qs` 命令来输出我本地所有的已装软件，但分辨它们每一个仍是一件不容易的事。我的电脑上可能已经装了数百个软件包，但我没有时间去把它们每一个都梳理清楚。Linux 碎片化的软件生态带给了我们简洁、方便和轻巧的系统使用体验，但这种碎片化在一定程度上也为我们管理自己的系统带来了一些困难。

在我看来，Linux 的发展历史就是一个在统合和碎片中找平衡的历史，努力在这二元中寻找并存的历史。系统中有文件系统、硬件系统、进程管理系等模块（碎片），于是 Linux 设计了“一切皆文件”的设计哲学来统合；个人开发者难以承担大型开源项目的开发（碎片），于是我们逐渐开始使用 Git 等工具、开源社区的建立来对齐碎片开发者的协作；各个软件包之间需要配合才能协同使用（碎片），于是我们在包管理器中引入依赖分析等特性来处理这些事务。

可以说，这就是我喜欢开源世界的原因之一——它努力地避免中心化与集权的同时，也注重每一个独立个体之间的合作，统合出有效、理智、可用的方案来。我认为在未来的世界中这一种思想会走得更远。

而现在，在 Nix 中这一路线延续下去了。它尊重软件的碎片化，并努力统合这些碎片提供给我们。

决定尝试 Nix 的契机有二。首先来讲，Nix 和 Nix OS 是两个有关系但性质不同的事物。后者代表一个发行版，前者只是一个包管理器。Nix 包管理器的安装并没有什么前置条件，也就是说你大可以直接逐步用它代替你目前使用系统的发行版官方包管理器。实际上，**渐进式** 的思想在整个 Nix 世界中贯穿到底。你可以不必费很大力气，比如重装你现在的系统就能感受到它。而当你决定使用 Nix OS 时，它 **NIXOS_LUSTRATE** 的安装特性甚至可以让你直接在本系统中进行安装和替换工作。

> *「Because Nix (the package manager) & Nixpkgs (the Nix packages collection) can both be installed on any (most?) Linux distributions, they can be used to install NixOS in various creative ways. You can, for instance:*
> 
> [...]
> 
> *「2.Install NixOS on the same partition (in place!), from your existing non-NixOS Linux distribution using **NIXOS_LUSTRATE**.」*
> 
> —— NixOS - NixOS 22.05 manual

我很喜欢这种渐进式的哲学。想尝鲜 Nix 的另一个原因是，不久前它终于进入了 Arch 的 Community 软件库（详见 [Arch Linux - nix](https://archlinux.org/packages/community/x86_64/nix/)）。这代表着 Nix 包的打包质量有了保证。

## Nix package manager

对于是否要用 Pacman 安装 Nix，我个人还是有些纠结的。对于一般的软件，保持包管理器对其的追踪是一个良好并且应当坚持的习惯；但是一个包管理器是否有资格去安装另一个包管理器呢？毕竟，当你在使用 PKGBUILD 的时候，就相当于或多或少地改变了官方的安装脚本设计。对一般软件来说，这样做无伤大雅，甚至更好，因为 Pacman 会对这些修改的部分负责，这种合理的掌控也更利于软件包与 Arch 协同。但是在我们的期待中，Nix 对 Pacman 并不是从属而是替代的关系。这暗含了一件事情：当 Nix 逐步替代 Pacman 到最后，Pacman 唯一做的事就是为安装 Nix 的 PKGBUILD 负责。而当我们的系统真正失去了 Pacman 时，由 PKGBUILD 安装的 Nix 就失去了它的负责者。

> *「There are two choices for a Nix installation, **one is supported by Arch Linux,** and **the other is officially supported by Nix.」***
> 
> —— Nix - ArchWiki

诚然，我相信 Community 软件库的打包质量，Nix 最终安装到我系统里的实际体验是完好的、甚至与脚本安装到我系统目录中的高权限文件没有区别。但这是一个程序正义的问题。另一方面，我们知道 Nix 与 Nix OS 在最终的模样摆脱了 FHS 文件目录组织规范，这与 Arch 的打包规范是否有冲突？这些是在合理推测中，将来可能会出现的雷点。

不过这目前并不是什么大不了的问题。我目前可以暂时使用 Nix 部分替代 Pacman，在最后想要安装 Nix OS 时再从官方脚本中重新安装就好。那么我担心的问题就变成了在那个时候官方的 Nix 能否接管我原先 Nix 的工作，继续追踪之前安装的软件包了。这一点我想是比较容易被解决的，因为 Nix 作为函数式包管理器，摧毁与复现是它的强项。可能我到时候只需要改动一下配置声明文件就好了。或者，我在学习使用 Nix 以及 Linux 包管理系统的过程中就能找到解决这个问题的办法，甚至最终发现我根本是在担心一些不存在的问题。

所以说，我目前打算从 Official repositories 中安装 Nix，剩下的从长计议。

> *注：在后续的安装 NixOS 过程中发现，从 Arch repositories 中安装的 Nix 会产生各种奇怪的问题。按照 Nix Community 的建议，还是按照官方途径，curl 安装脚本来安装会比较好。*

```bash
> yay -S nix
```
在安装 Nix 后，使用前首先要将用户添加到 nix-users 用户组中，并启动 Nix 的 daemon 服务。

```bash
> gpasswd -a username nix-users
> systemctl enable nix-daemon.service
> systemctl start nix-daemon.service
```

接着就可以按照 Arch Wiki 中的步骤，在更新官方源后安装一个 hello 软件包。

```bash
> nix-channel --add https://nixos.org/channels/nixpkgs-unstable
> nix-channel --update
> nix-env -iA nixpkgs.hello

> hello
```

**OUTPUT:**

```
Hello, world!
```

## NixOS Installment

如何安装 NixOS 在 [NixOS Manual](https://nixos.org/manual/nixos/stable/) 中有详细说明。本文比较具有特色的一点是，我打算体验 NixOS 的 **LUSTRATE** 功能。我的机器是在以下几个条件中进行的：

* 本机在安装前使用 Manjaro 系统，安装后为 NixOS 22.11 系统；
* 本机中除了 Linux，还有一个 Windows 10 系统，和 Manjaro 一起使用 Grub 引导；
* 本机安装 NixOS 没有对分区或者 Manjaro 做任何格式化和数据清除，直接在原系统运行中使用 **LUSTRATE** 将其替换成 NixOS。

> *「lustrate /ˈlʌstreɪt/ verb.」*
>
> *「purify by expiatory sacrifice, ceremonial washing, or some other ritual action.」*
>
> —— NixOS - NixOS 22.11 manual

### 完美地从 Arch 系发行版中卸载 Nix 包管理器，并从官方源单用户重装

在尝试过 Nix 包管理器后，想要转移到 NixOS这一发行版的想法由然而生。使用 **LUSTRATE** 安装的步骤在 [NixOS Manual 2.4.5. Installing from another Linux distribution](https://nixos.org/manual/nixos/stable/index.html#sec-installing-from-other-distro) 一节中可以找到。注意步骤 4 到 8 对于 **LUSTRATE** 可以忽略（详见 Note）。

但是问题在于，我的机器在按照步骤安装时总会产生一些不被期望的结果。我猜测这是因为我的 Manjaro 已经很久没有更新，导致 nix 版本老旧，与 NixOS 22.11 不匹配的结果。同时，使用 pacman 安装的 nix 包是多用户安装，与手册中的单用户安装不符。

总之，我想之前关于是否要使用 Pacman 安装 nix 的担心成为了现实。最好的办法，就是完全删除之前的 nix，并从 nix 官方源安装，以保证我安装 NixOS 的系统状态尽量与 Manual 一致。

完全删除 nix 可以在 [Nix Manual - Installing a Binary Distribution#uninstalling](https://nixos.org/manual/nix/stable/installation/installing-binary.html#uninstalling) 中找到。需要注意的是，仅使用 Pacman 删除 nix 是不够的，还有 nix 遗留相关路径、用户和用户组等需要处理。

```bash
# 首先要从 pacman 本地软件库中卸载 nix
> yay -R nix

# 删除与 nix 有关的所有路径
> sudo rm -rf /nix /etc/nix /etc/profile/nix.sh ~root/.nix-profile ~root/.nix-defexpr ~root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

# 删除与 nix 有关的用户等。你需要注意的是，通过 Pacman 创建的
# 相关用户及用户组名称和 id 可能与下方 Nix Manual 中所示不同，
# 需要手动查看本机的用户及用户组后删除相关内容。
> for i in $(seq 30001 30032); do\
  sudo userdel $i\
done\
sudo groupdel 30000

# 停止相关服务
> sudo systemctl stop nix-daemon.socket
> sudo systemctl stop nix-daemon.service
> sudo systemctl disable nix-daemon.socket
> sudo systemctl disable nix-daemon.service
> sudo systemctl daemon-reload

```

接着，根据 NixOS Manual 2.4.5. 进行 nix 单用户安装：

```bash
> curl -L https://nixos.org/nix/install | sh
```

然后遵循其步骤继续修改 channel，安装工具包。注意，此处 channel 更改与 nix 常规安装有所不同，以 NixOS Manual 为准。

### 初探 configuration.nix

生成 `configuration.nix` 文件。

```bash
sudo `which nixos-generate-config`
```

生成的两个文件会存放在 /etc/nixos 路径中。`hardware-configuration.nix` 用于声明新系统的硬件和驱动等，由工具包自动检测你的硬件状态生成。不用修改它，除非你知道自己在做什么。在接下来的旅程中，`configuration.nix` 会陪伴我们很久。如果你不打算使用 **Flake** 来声明你的系统，那么这个文件会陪伴你使用 NixOS 的每一天。

使用 vim 打开它，进行一些配置吧。

#### 双引导系统如何配置 Grub

首先你应该看到的是 `boot.loader` 选项。由于我的机器内还有一个 Windows 10 双系统，在之前就采用 GRUB 2 来进行引导，所以不能使用 systemd-boot 来引导启动了。关于这一部分如何配置，你可以看 NisOS Manual 2.3.3 第 4 步骤详解。除此之外，你也可以看附录的 Options 中关于 [boot.loader.grub](https://nixos.org/manual/nixos/stable/options.html#opt-boot.loader.grub.enable) 和 [boot.loader.systemd-boot](https://nixos.org/manual/nixos/stable/options.html#opt-boot.loader.systemd-boot.enable) 内容详解。在开始使用 `configuration.nix` 后，我们会慢慢开始学着查阅这个附录。如果你想要进一步关于 GRUB 和 systemd-boot 的知识，可以去查阅它们的 Arch wiki：[GRUB](https://wiki.archlinux.org/title/GRUB)，[systemd-boot](https://wiki.archlinux.org/title/Systemd-boot)。如果你想看一看有关双系统引导的其他博客，我在知乎上找到了 [NixOS 与 Windows 双系统启动安装教程 - 知狐](https://zhuanlan.zhihu.com/p/441190715)。需要注意的是，知狐的配置比较复杂，而你不必像他一样复杂，因为我们作为初学者最重要的是让 NixOS 顺利跑起来即可，也就是 **尽可能只做必要的事。**

我来展示以下我的 `boot.loader` 配置片段。

```nix
...
# Use the GRUB boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
...
```

我想你在阅读以上信息后，也能写出适合你机器的、比较精简的配置。在这一配置中我 efi 挂载点是 `/boot/efi` 而不是默认的 `/boot`。为什么会这样？其实我一开始也将其设定为 `/boot` 但是无法跑通。通过 `/etc/fstab` 看到我的挂载设置后我知道了原因：

```fs
...
# /dev/nvme0n1p1 LABEL=ESP
UUID=FAFF-EE0B      	/boot/efi 	vfat      	rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,errors=remount-ro	0 0
...
```

我的 efi 硬盘分区被挂载到了 `/boot/efi` 上。

#### 尽可能精简配置

新人安装 NixOS 的一个误区在于：他们想在安装 NixOS 之前就把配置文件写得很复杂，想要自己的桌面在安装后第一次启动就有精彩的效果。但实际上这是他们安装失败，或者系统无法启动的根源之一。**我们知道，一个系统的信息熵越大，这个系统就越难管理。所以，请尽量精简你的配置。**你只需要在默认生成的模板中去掉一些注释，就可以进入 NixOS 的 console。第一次成功启动后再慢慢管理系统的演进是一个不错的策略。

我的第一次安装，去掉了 networkmanager 的注释，设置 timeZone 为 `"Asia/Shanghai"`，去掉了 `xserver.enable` 的注释和 `sound.enable`，及 pulseaudio 的注释，简单地设置了 user，关闭了防火墙 `networking.firewall.enable = false`。简单配置了 i18n 的字体，在 `sysemPackages` 去掉了 vim 的注释，并额外安装了 ranger。

这已经足够。至于图形界面、输入法、窗口管理器等我完全可以在安装成功进入系统后再进一步配置。

### 安装 NixOS

按手册指导把剩下的工作做完后，我还做了一些备份工作（如导出 GPG 密钥），放在了我的 `$HOME` 文件夹里。然后应该做的事是把 `$HOME` 也加入 `/etc/NIXOS_LUSTRATE` 文件里。我没有执行这一步骤,不过 NixOS 仍然没有将原 `/home` 放入 `/old-root`。其实它也无法放入，因为我 `/home` 在硬盘中单独有一个分区且占用了巨大的存储空间，以至于无法挪到 `/old-root` 中。其实这是一个有风险的操作，还是在 LUSTRARE 文件里声明它比较好。

卸载了一些软件，以给新系统腾出来很多空间。接着就开始安装系统了。

```bash
> sudo mv -v /boot /boot.bak &&
sudo /nix/var/nix/profiles/system/bin/switch-to-configuration boot
```

安装比较常见的问题就是网络不佳，以至于无法下载相关的软件包。解决的办法可以是按照手册中所述挂代理来安装，也可以将 channel 换为清华源 [nix | 镜像站使用帮助 | 清华大学开源软件镜像站 | Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/nix/)。你需要注意的是我们之前在手册中配置的 channel 有些特殊，将 nixpkgs 对应为了 nixos 仓库。请不要直接使用清华源使用帮助的命令。

综上所述，我想我们知道了应当尽量精简系统配置的更多原因：

* 在初次安装时你的存储空间里有两个系统并存，所以可能余量有限。如果在配置中写入很多东西，会因为下载空间不足而失败；
* 如果你的网络不太好，声明越复杂代表着要从远程仓库里下载更多东西，安装过程会因为不健康的网络而被拖长，这是不必要的。

至此，在重新启动后我获得了一份崭新的 NixOS 系统，Nix 之旅也将在这里继续。

```bash
> neofetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖            yakkhini@nixos
          ▜███▙       ▜███▙  ▟███▛            --------------
           ▜███▙       ▜███▙▟███▛             OS: NixOS 22.11.20230101.0bf3109 (Raccoon) x86_64
            ▜███▙       ▜██████▛              Host: Dell Inc. 0J8RVN
     ▟█████████████████▙ ▜████▛     ▟▙        Kernel: 5.15.85
    ▟███████████████████▙ ▜███▙    ▟██▙       Uptime: 3 hours, 50 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛       Packages: 743 (nix-system), 4767 (nix-user)
          ▟███▛             ▜██▛ ▟███▛        Shell: zsh 5.9
         ▟███▛               ▜▛ ▟███▛         CPU: Intel i5-8265U (8) @ 3.900GH
▟███████████▛                  ▟██████████▙   GPU: NVIDIA GeForce MX250
▜██████████▛                  ▟███████████▛   GPU: Intel WhiskeyLake-U GT2 [UHD Graphics 620]
      ▟███▛ ▟▙               ▟███▛            Memory: 3613MiB / 7672MiB
     ▟███▛ ▟██▙             ▟███▛             
    ▟███▛  ▜███▙           ▝▀▀▀▀              
    ▜██▛    ▜███▙ ▜██████████████████▛        
     ▜▛     ▟████▙ ▜████████████████▛         
           ▟██████▙       ▜███▙               
          ▟███▛▜███▙       ▜███▙
         ▟███▛  ▜███▙       ▜███▙
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘
```

## 初入 NixOS 配置

进入新系统以后，就可以在 NixOS 上通过 `configuration.nix` 开工了！请不要使用 `nix-env` 安装软件，因为这违背了使用 Nix 的初衷——声明式配置。

### 为什么要声明式地描述系统的样子

记得我在一开始提到使用 Manjaro 的困境吗？随着使用时间越来越长，我的系统里软件数量也越来越多，配置文件也越来越复杂。接着就出现一些难以管理的问题：我搞不清楚系统里的东西是由哪几个文件所配置和影响的，也不知道有多少软件是在删除了另一个不想要的软件后留下的依赖。我或许可以通过管理 dotfiles 来解决第一个问题，但是我始终找不到一个简单可行的管理方式；其他发行版的包管理器有尝试过解决第二个问题，如 `apt autoremove` 但我们知道它的效果差强人意。

NixOS 解决了这个问题。通过声明式的描述，我可以在文件中找到我装了哪些软件；一旦将软件的配置从文件中删去，那么在 `nixos-rebuild` 后其所依赖且我不需要的软件自然会消失——如果我需要那个依赖，那么这个软件包肯定会在配置文件中被声明，或者被声明的软件所依赖。也就是说，**我卸载的软件都好像从未在我的电脑上安装过一样**，这是 NixOS reproducibility 的魔法。

除此之外，NixOS 的配置文件不仅可以声明软件的安装和删除，也可以声明软件的配置选项。搭配 **Home Manager** 后，就可以原生管理系统的 dotfiles 了。只需要对配置文件进行 Git 追踪，就不怕系统变得糟糕。只要配置文件的历史和备份存在，系统的模样也可以随时恢复。

接下来看看这两层配置——系统原生配置选项和 Home Manager 选项。

### 原生 Options

系统原生选项可以在 [NixOS Manual - Appendix A. Configuration Options](https://nixos.org/manual/nixos/stable/options.html) 中找到。这些配置就是与我们之前生成配置文件同一类的配置，由 NixOS 原生提供。

### Home Manager 是什么，可以做什么

[**Home Manager**](https://github.com/nix-community/home-manager) 使得我可以采用在 nix 中声明配置的方式来单独管理用户环境。它的安装和配置方法在 [Home Manager Manual](https://nix-community.github.io/home-manager/) 中有讲解。值得注意的是，他有两种安装方法，即 Standalone installation 独立安装和作为 NixOS module 安装。第二种方法比较好，因为这样可以在 `configuration.nix` 中一起配置 Home Manager。**保持我们的配置在同一处有助于之后统一的迁移和管理**。

Home Manager 配置选项可以在 [Appendix A. Configuration Options](https://nix-community.github.io/home-manager/options.html) 中找到。

### 配置

我不想把配置说得很全面，还是从中选择了几项配置作为案例展示，达到以点带面，受人以渔的效果。Nix 语言的配置和 JSON 有点像，实际上在你熟悉了 Nix 语法后会明白我们的 `configuration.nix` 文件内容是一个 Attribute Set 为结果的 Function。不过不明白也没有关系，因为这些详细语法内容至少到使用 Flake 管理系统的阶段才是必要前置知识。

而在这一阶段中，我认为 **String 的转义与嵌套表达式** 等是需要提前掌握的语法。在 [Nix Manual 5.1. Nix Language - Data Types](https://nixos.org/manual/nix/stable/language/values.html#type-string) 对此有详细表述。如果想深入学习 Nix Language，在下方的 **Nix Ecosystem 进阶** 一节中我有列举一些文档。

NixOS Wiki 与 Arch Wiki 是不错的查阅资料。如果不清楚一个软件该怎样配置，那么在这里可能会有意想不到的地方。不过 NixOS Wiki 基本是半 Official 状态（Wiki 官网标明 Unofficial，但被列举在了 nixos.org，代表官方有一定认可度）。

#### Git，GnuPG 配置

GnuPG 需要 enable 它的 agent，并配置一个简单的验证图形界面。

```nix
...
  gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
...
```

我使用 Home Manager 来管理 Git 配置。

```nix
...
  programs.git = {
    enable = true;
    signing.key = "??????";
    signing.signByDefault = true;
    userEmail = "??????";
    userName = "??????";
    extraConfig = {
      init.defaultBranch = "main";
    };
    delta.enable = true;
  };
  programs.gitui.enable = true;
...
```

#### i18n setting

我的默认语言其实仍是 `en_US`，这是为了避免采用中文时一些软件出现运行错误的可能：

```nix
...
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {LANGUAGE = "en_US.UTF-8";};
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8"];
...
```

我使用 fcitx5 搭配 Rime 引擎作为输入法。可以去看看 Options 支持哪些输入法及引擎。

```nix
...
  # Input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx.engines = with pkgs.fcitx-engines; [rime];
    fcitx5.enableRimeData = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-gtk
    ];
  };
...
```

记得配置输入法相关的环境变量，可以在 Archwiki 中找到配置内容，在 Home Manager Options 中找到配置方法。

#### greetd 和 tuigreet

我习惯使用的 window manager 是 sway，不过我不打算在这里详细将 Wayland 相关的图形界面配置，**这是本文阶段性的一个小作业：浏览前文提到的相关资料或自行搜索资料，配置一个喜欢的图形界面（x11/wayland 皆可）并 rebuild 成功，然后总结自己的收获。**

搭配 sway 使用的 display manager 我选择了 greetd 与 tuigreet，严格来讲 greetd 并不算一个 display manager 而仅是一个 login manager，不过其轻量的特性让我青睐。

```nix
...
# greetd session manager to fit sway & Wayland.
  services.greetd = {
    enable = true;
    vt = 2;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd sway";
        user = "yakkhini";
      };
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
...
```

记得关闭默认的 lightdm。使用 Tuigreet 会有污染 tty 的问题，我找到了解决办法 [github: apognu/tuigreet Issue #68, Yakkhini commented](https://github.com/apognu/tuigreet/issues/68#issuecomment-1368183430)。

```nix
...
  # pkgs: greetd, tuigreet
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
  };
...
```

#### fontconfig

在系统界面默认的英文字体，我对 paratype 字族情有独钟。

```nix
...
  # fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "Hack" "DroidSansMono"];})
    openmoji-color
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-han-sans
    source-han-serif
    paratype-pt-sans
    paratype-pt-serif
    paratype-pt-mono
    fira-code
    fira-code-symbols
    dina-font
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Openmoji Color"];
      monospace = ["Hack Nerd Font Mono" "Noto Sans Mono CJK SC"];
      sansSerif = ["PT Sans" "Noto Sans Mono CJK SC"];
      serif = ["PT Serif" "Noto Serif Mono CJK SC"];
    };
  };
...
```

Nerd Fonts 的 override 方法就是在 NixOS Wiki 中找到的。接下来，或许我们可以从探索一些 override 特性开始，以另一个视角来欣赏 NixOS 的灵巧与强大。

#### 第一次 Override——鼠标和图标，以及我们的下一步

想要个性化系统界面，可以选择一个漂亮的图标与鼠标主题。我选择了 `pkgs.papirus-icon-theme` 和 `pkgs.hackneyed` 主题。但是有一个问题——papirus 和 hackneyed 都有其可选择的配置项。对于 papirus 来说，其文件夹的色彩是可配置的，而 hackneyed 可以选择白色黑色的鼠标，但是默认仅安装白色的鼠标。

但是，从 nix channel 安装的这两个主题均为默认色，且没有相关配置项。为什么这样？原来就如同上一节的 Nerd Fonts 一样，我们需要从 package override 入手，改变软件包的安装方式。

Override 顾名思义 **覆盖**，即通过改变软件包打包的 `default.nix` 脚本中一些选项以达到改变安装在本地软件包样子的目的。在 [Nixpkgs Manual Chapter 4. Overriding](https://nixos.org/manual/nixpkgs/stable/#chap-overrides) 中详细讲述了该怎样 override 软件包。

我们可以通过观察软件包的打包脚本来考虑怎样 override 它们。在 NixOS Official 主页的软件包搜索栏处搜索相关软件包名称，点击结果条目的 「📦 Source」就可以看到软件包的脚本。

有些软件包的打包脚本函数参数里就存在可配置项，如 [papirus](https://github.com/NixOS/nixpkgs/blob/nixos-22.11/pkgs/data/icons/papirus-icon-theme/default.nix) 中首行的 `color ? null` 代表着 `color` 参数可配置，缺省值为 `null`。

配置其 override：

```nix
...
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      papirus-icon-theme = pkgs.papirus-icon-theme.override {
        color = "adwaita";
      };
    };
  };
...
```

而形如 hackneyed 则没有这么方便的解决方法了。我必须参考 [hackneyed 仓库的 编译帮助](https://gitlab.com/Enthymeme/hackneyed-x11-cursors#building) override 它的 buildFlags：

```nix
...
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      hackneyed = pkgs.hackneyed.overrideAttrs (finalAttrs: previousAttrs: {
        buildFlags = [
          "-j20"
          "-B"
          "THEME_NAME=Hackneyed-Dark"
          "COMMON_SOURCE=theme/common-dark.svg"
          "RSVG_SOURCE=theme/right-handed-dark.svg"
          "LSVG_SOURCE=theme/left-handed-dark.svg"
          "theme"
          "theme.left"
        ];
      });
    };
  };
...
```

至此，才顺利安装完自定义过的图标和鼠标主题。这也是第一次开始接触 nix 的一些高级玩法。在下一节，Nix 之旅将会邂逅更多 Nix 的进阶使用方式。

## Nix Ecosystem 进阶

### Nix 语法

### 使用 Flakes 来管理系统配置

### NUR 仓库

## 后记

## 参考

[*Nix Manual*](https://nixos.org/manual/nix/stable/)

[*NixOS Manual*](https://nixos.org/manual/nixos/stable/)

[*Nix - ArchWiki*](https://wiki.archlinux.org/title/Nix)

[*nix | 镜像站使用帮助 | 清华大学开源软件镜像站 | Tsinghua Open Source Mirror*](https://mirrors.tuna.tsinghua.edu.cn/help/nix/)

[*NixOS Wiki*](https://nixos.wiki/)

[*Home Manager Manual*](https://nix-community.github.io/home-manager/)