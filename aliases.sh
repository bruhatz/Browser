# ~/.bash_aliases

# this is done in devcontainer.json
# configure the display
#export DISPLAY=:1.0

# run these three aliases to start the display
alias sx="Xvfb :1 -screen 0 800x600x24 &"
alias svnc="x11vnc -forever -nopw &"
alias pvnc="/usr/share/novnc/utils/novnc_proxy --vnc localhost:5900 &"

# TODO: shortcut

# some aliases to test the configuration
# only available once Xvfb is running (sx)
# glxgears is visible in a browser after running svnc and pvnc 
alias gt="glxgears -info &"
alias gi="glxinfo | grep OpenGL"
