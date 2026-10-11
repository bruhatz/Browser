FROM mcr.microsoft.com/devcontainers/base:ubuntu24.04
COPY aliases.sh /home/vscode/.bash_aliases
COPY start-desktop.sh /usr/local/bin/start-desktop
COPY trackpad.html /tmp/trackpad.html

USER root
RUN \
 chmod +x /usr/local/bin/start-desktop \
 && ln -s start-desktop /usr/local/bin/start \
 && \
 export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
  xvfb \
  x11vnc \
  novnc \
  libgl1-mesa-dri \
  wget \
 && wget -q -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && apt-get install -y --no-install-recommends /tmp/google-chrome.deb \
 && install -m 0644 /tmp/trackpad.html /usr/share/novnc/index.html \
 && rm /tmp/trackpad.html \
 && rm /tmp/google-chrome.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER vscode
