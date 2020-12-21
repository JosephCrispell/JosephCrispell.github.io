---
layout: post
title: Windows Subsystem for Linux (Ubuntu WSL)
date: 21 Dec 2020
feature-img: "assets/img/blog/ubuntuWSL/thumbnail.png"
thumbnail: "assets/img/blog/ubuntuWSL/thumbnail.png"
image: "assets/img/blog/ubuntuWSL/thumbnail.png" 
tags: [ubuntu, windows]
---

Today I set about trying to bring a little `linux` joy into my Windows work life. Although Windows 10 is the world's most popular operating system, it isn't mine! 😊 

> If you can, work in a linux, it's free, open-source, powerfula dn puts your computer in the palm of your hands. If you can't, and your stuck on a Windows 10 computer at work, then this post is for you!

Microsoft, recognising the brilliance of linux, created the Windows Subsystem Linux (WSL) to allow a linux subsystem to work within your Windows computer. Essentially a linux terminal can be used to install and run linux tools on your Windows file system! 📁

Today I am going to walk through the steps I took to install [Ubuntu]() on my Windows 10 machine:

1. Enable the Windows Subsystem Linux (WSL) by typing the following into your command line (or powershell):
  ```dos
  dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  ```
  With the a Windows update after May 2020 run thr following **instead**:
  ```dos
  dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  ```

2. Install the Ubuntu App - I couldn't download the app via Microsoft store so I did the following:
  - Selected "Ubuntu 20.04" from [here](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
  - Then used the following command to install the file in the command line:
  ```dos
  Add-AppxPackage .\[insertFileNameHereWithoutSuffix].appx
  ```

3. Start the Ubuntu app (I typed "Ubuntu" into the Windows search)

4. Create a username and password (doesn't need to match Windows credentials)

5. Added `cd /mnt/c/Users/username/` to `.bashrc` so my Ubuntu terminal always starts in Windows file system (replace "username" with your own). Open your `.bashrc` to edit with the following:
  ```bash
  nano -c ~/.bashrc
  ```
  Couple of notes for using nano:
  - Quickly skip to the end with `Ctrl + V`
  - You can't use your mouse!
  - Once you have made your edits press `Ctrl + X` then `Y` to save changes and exit

Now you're all set! 👍 I wanted to use my Ubuntu terminal to work with git so I did a few extra steps.

> Importantly, to work with git in the Windows Subsystem Linux, I needed to use SSH based repositories. This meant I had to make new clones of my repos, which were set up as https!

1. Set up your global configuration parameters:
  ```bash
  $ git config --global user.name "Joseph Crispell"
  $ git config --global user.email "myemail@hero.com"
  ```
**Skip to step 6. if you use SSH for git repositories on your Windows machine**

2. I created a new ssh key with the following:
  ```bash
  cd ~
  mkdir .ssh
  cd .ssh
  ssh-keygen -t ed25519 -C "your_email@example.com"
  ```
  Create a name for your key. I called mine `id_rsa`, not sure why!

3. Added my SSH key to my ssh-agent:
  ```bash
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
  ```

4. Add the new SSH key to GitHub account:
  - Head to [github](https://github.com/)
  - Click into your settings
  - Select SSH and GPG keys
  - Click "New SSH Key"
  - Create a name for your SSH key and paste the contents of `id_rsa.pub` into the box provided

5. Copy your SSH key from Ubuntu to Windows:
  ```bash
  cd ~/.ssh
  cp id_rsa* /mnt/c/Users/username/.ssh/
  ```

6. [IF YOU ALREADY USED SSH ON YOUR WINDOWS COMPUTER] you can copy the Windows SSH key onto your Ubuntu system with:
  ```bash
  cd ~
  mkdir .ssh
  cd .ssh
  cp /mnt/c/Users/username/.ssh/id_rsa* .
  ```

The above is a mix and match of instructions pulled from the following resources:
- [Install Ubuntu on Windows 10](https://ubuntu.com/tutorials/ubuntu-on-windows#1-overview)
- [Manually install Ubuntu App](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
- [Set up git for Windows Subsystem Linux](https://peteoshea.co.uk/setup-git-in-wsl/)
- [Connecting to GitHub with SSH](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh)

Colour me excited to use my new Ubuntu terminal!! 🎉