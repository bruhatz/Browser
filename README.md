# Chrome GUI for Codespaces

This dev container runs Google Chrome on a virtual X11 display and streams the desktop to your browser with noVNC.

## Included

- Google Chrome Stable
- Xvfb for the virtual display
- x11vnc and noVNC for browser access
- Mesa software rendering driver
- `sx`, `svnc`, `pvnc`, and `chrome` shell aliases

## Open the Chrome desktop

The X display, VNC server, noVNC browser client, and Chrome start automatically when the Codespace starts. Codespaces forwards port 6080 and opens the desktop page in a browser. If needed, open the **Chrome desktop** port and visit `/vnc.html`.

The forwarded port is configured as **public**, so anyone with its URL can view and control the desktop. Do not use this configuration for private browsing or sensitive accounts. Chrome runs as the non-root `vscode` user; `--no-sandbox` is required by the Codespaces container environment.

## Install in a Project

Add this repository as the project's dev container:

    git submodule add https://github.com/raymond-chetty/codespaces-GUI-CE .devcontainer
    git add .gitmodules .devcontainer
    git commit -m "Add Chrome GUI dev container"

Rebuild the Codespace after adding or changing the configuration (**Codespaces: Rebuild Container** from the Command Palette). After a rebuild, the services start each time the Codespace starts.
