Codespaces GUI Community Edition
--------------------------------

A codespace configured so GUI applications can render their output in a browser.

### Installed Software

> 1. **Xvfb:** https://www.x.org/releases/current/doc/man/man1/Xvfb.1.xhtml
> 2. **x11vnc:** https://github.com/LibVNC/x11vnc
> 3. **novnc:** https://github.com/novnc/noVNC
> 4. **Mesa Utils:** https://wiki.debian.org/Mesa
> 5. **~/.bash_aliases:** preconfigured aliases to simplify starting the required services.

#### ENV:

* DISPLAY=:1.0
* ~/.bash_aliases: sx,svnc,pvnc
  * extra aliases: gi,gt
  
#### Additional Inormation:

* OS: Ubuntu 24.04 (Nobel)
* username: vscode
* extra packages: git-lfs

### Usage

"Quick Start" run the following predefined alias to get started (see ~/.bash_aliases for more details):
> [!NOTE]
> try waiting a few seconds between each step in case it takes time to start the service.

1. Start a virtual x11 frame buffer

        sx

2. Start an x11 vnc server

        svnc

> [!IMPORTANT]
> You might receive a notification that a port is now open.

3. Start a web based vnc client

        pvnc

> [!IMPORTANT]
> You might get a notification about your application running on a port, click 'open in browser'. Alternately, you can copy and paste the url that is printed in the terminal to a new browser tab.

4. *In the browser* Navigate to vnc.html

> [!NOTE]
> Click on 'vnc.html' in the directory listing that shows up in the browser at the url you received in step #3.

5. *In the browser* Press the big "Connect" button!

> [!NOTE]
> You should now see a blank screen. If you run an application that has a gui or graphics output you should see it here.

6. *optional* test gui (run in codespace terminal)

        gt

> [!NOTE]
> If all went well you should see some rotating gears in the browser tab that was previously blank.

### Install Instructions 

In order to use this devcontainer include it as a sub module when working in a generic codespace.

    git submodule add https://github.com/raymond-chetty/codespaces-GUI-CE .devcontainer

If you don't want to add the sub module to your codespace each time you create a new one, commit the new files to your current branch and commit them.

    git add .gitmodules .devcontainer
