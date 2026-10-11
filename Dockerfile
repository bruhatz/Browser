FROM mcr.microsoft.com/devcontainers/base:ubuntu24.04
COPY aliases.sh /home/vscode/.bash_aliases
COPY start-desktop.sh /usr/local/bin/start-desktop

USER root
RUN \
 chmod +x /usr/local/bin/start-desktop \
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
 && rm /tmp/google-chrome.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER vscode
