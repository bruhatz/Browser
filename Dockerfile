# https://github.com/devcontainers/images/tree/main/src/base-ubuntu
# ubuntu24.04 (noble)
FROM mcr.microsoft.com/devcontainers/base:ubuntu24.04
# assume base image has one non root user: vscode
USER vscode

# some debugging output, just in case
#RUN cat /etc/passwd | grep home
#RUN echo "$USERNAME" ":" "$username"
#RUN cat /etc/passwd | grep home | cut -d: -f6

# /home/vscode should contain bash aliases
COPY aliases.sh /home/vscode/.bash_aliases

# install stuff
# git-lfs isn't currently installed in the base image
USER root
RUN \
 DEBIAN_FRONTEND=noninteractive \
 apt-get update \
 && apt-get install -y \
  git-lfs \
  xvfb x11vnc novnc  \
  mesa-utils
