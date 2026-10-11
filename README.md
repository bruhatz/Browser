# Chrome GUI for Codespaces

This dev container runs Google Chrome on a virtual X11 display and streams the desktop to your browser with noVNC.

## Included

- Google Chrome Stable
- Xvfb for the virtual display
- x11vnc and noVNC for browser access
- Mesa software rendering driver
- `sx`, `svnc`, `pvnc`, and `chrome` shell aliases

## Open the Chrome desktop

The X display, VNC server, noVNC browser client, and Chrome start automatically when the Codespace starts. Chrome opens horizontally centered on the 1280-pixel virtual display. Codespaces forwards port 6080 and opens the desktop page in a browser. The page asks whether you want to switch to desktop mode. Choose **OK** for the standard noVNC viewer, or **Cancel** to use the mobile trackpad on the same page.

In trackpad mode, one-finger movement moves the desktop pointer, a tap left-clicks, a 500 ms hold right-clicks, and two-finger movement scrolls in the natural trackpad direction. The noVNC keyboard, full-screen, and display settings remain available in the viewer toolbar.

To start the desktop manually, type:

    start

If `start` is not available or reports missing desktop dependencies, rebuild the dev container (**Codespaces: Rebuild Container** from the Command Palette).

Only the Chrome desktop port (6080) is forwarded, and it is configured as **public**. The underlying VNC port (5900) listens only on localhost and is not forwarded separately. Anyone with the desktop URL can view and control Chrome, so do not use it for private browsing or sensitive accounts. Chrome runs as the non-root `vscode` user; `--no-sandbox` is required by the Codespaces container environment.

## Install in a Project

Add this repository as the project's dev container:

    git submodule add https://github.com/raymond-chetty/codespaces-GUI-CE .devcontainer
    git add .gitmodules .devcontainer
    git commit -m "Add Chrome GUI dev container"

Rebuild the Codespace after adding or changing the configuration (**Codespaces: Rebuild Container** from the Command Palette). After a rebuild, the services start each time the Codespace starts.
