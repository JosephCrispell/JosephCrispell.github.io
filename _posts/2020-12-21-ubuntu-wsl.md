---
layout: post
title: Windows Subsystem for Linux (Ubuntu WSL)
date: 21 Dec 2020
feature-img: "assets/img/blog/ubuntuWSL/thumbnail.png"
thumbnail: "assets/img/blog/ubuntuWSL/thumbnail.png"
image: "assets/img/blog/ubuntuWSL/thumbnail.png" 
tags: [ubuntu, windows]
---

Today I set about trying to bring a little [`linux`](https://www.linux.com/what-is-linux/) joy into my Windows work life. Although Windows 10 is the world's most popular operating system, it isn't mine! 😊 

> If you can, work in a linux, it's free, [open-source](https://opensource.com/resources/what-open-source), and powerful - putting you in complete control of your computer. 💻 If you can't, and you are stuck on a Windows 10 computer at work, then this post is for you!

Microsoft, recognising the brilliance of linux, created the Windows Subsystem Linux (WSL) to allow a linux subsystem to work within your Windows computer. Essentially a linux terminal can be used to install and run linux tools on your Windows file system! 📁

Linux comes in many [flavours](https://www.tecmint.com/linux-distro-for-power-users/), one of the most popular (and my favourite) is [Ubuntu](https://ubuntu.com/).

Today, I am going to walk through the steps I took to install [Ubuntu](https://ubuntu.com/community/mission) on my Windows 10 machine:

1. Enable the Windows Subsystem Linux (WSL) by typing the following into your command line (or powershell):
    ```
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    ```

    ⚠️ With the a Windows update after May 2020 run the following **instead**:
    ```
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    ```
    <br>

2. Install the Ubuntu App - I couldn't download the app via Microsoft store so I did the following:
    - Selected "Ubuntu 20.04" from [here](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
    - Then used the following command to install the file in the command line:
    ```
    Add-AppxPackage .\[insertFileNameHereWithoutSuffix].appx
    ```
    <br>

3. Start the Ubuntu app (I typed "Ubuntu" into the Windows search and double clicked Ubuntu to start)<br><br>

4. Create a username and password (doesn't need to match Windows credentials)<br><br>

5. Added `cd /mnt/c/Users/username/` to `.bashrc` so my Ubuntu terminal always starts in Windows file system (replace `"username"` with your Windows username). To edit your `.bashrc` file, open it with the following:
    ```bash
    nano -c ~/.bashrc
    ```
    Make your way to the end of the file (use the down arrow or `Ctrl + V`). Add the following text:
    ```bash
    # Move to the Windows file system
    cd /mnt/c/Users/username/
    ```
    Press `Ctrl + X` then `Y` to save changes and exit.

Now you're all set! 👍 

> Note that you'll find your Windows file system at `/mnt/c/Users/yourWindowsUsername/` - you're welcome! 😉

---

Lastly, I wanted to use my Ubuntu terminal to work with [`git`](https://git-scm.com/) so I did a few extra steps:

> Importantly, to work with git in the Windows Subsystem Linux, I needed to use [SSH based repositories](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh). This meant I had to make new clones of my repos, which were set up as https!

1. Set up your global configuration parameters:
    ```bash
    $ git config --global user.name "Joseph Crispell"
    $ git config --global user.email "myemail@hero.com"
    ```
    **Skip to step 6. if you use SSH for git repositories on your Windows machine**
    <br>

2. I created a new ssh key with the following:
    ```bash
    cd ~
    mkdir .ssh
    cd .ssh
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
    Create a name for your key. I called mine `id_rsa`, not sure why!
    <br>

3. Added my SSH key to my ssh-agent:
    ```bash
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa
    ```
    Change `id_rsa` to whatever you called your SSH key.
    <br>

4. Add the new SSH key to GitHub account:
    - Head to [github](https://github.com/)
    - Click into your settings
    - Select SSH and GPG keys
    - Click "New SSH Key"
    - Create a name for your SSH key and paste the contents of `id_rsa.pub` into the box provided
    <br>

5. Copy your SSH key from Ubuntu to Windows:
    ```bash
    cd ~/.ssh
    cp id_rsa* /mnt/c/Users/username/.ssh/
    ```
    Again, remember to change `id_rsa` to whatever you named your key. You also need to change `"username"` in the path to your Windows username.
    <br>

6. [OPTIONAL] *If you already used ssh on your Windows computer for git repositories*, you can copy the Windows SSH key onto your Ubuntu system with:
    ```bash
    cd ~
    mkdir .ssh
    cd .ssh
    cp /mnt/c/Users/username/.ssh/id_rsa* .
    ```
    Remember to change `"username"` in the path to your Windows username.


I must admit that it took me much longer than it should of to figure out the above steps, despite a lot of useful resources online:
- [Install Ubuntu on Windows 10](https://ubuntu.com/tutorials/ubuntu-on-windows#1-overview)
- [Manually install Ubuntu App](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
- [Set up git for Windows Subsystem Linux](https://peteoshea.co.uk/setup-git-in-wsl/)
- [Connecting to GitHub with SSH](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh)

For the moment, I'm mainly going to use my Ubuntu terminal for managing my `git` repositories. So really it isn't too necessary but I wanted to get Ubuntu back into my life and the linux terminal is incredibly helpful for developing code and I'm sure to use it more and more from now on! 🐧 🎉
