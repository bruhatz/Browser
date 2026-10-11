#!/usr/bin/env bash
set -euo pipefail

wait_for_socket() {
    local socket_path=$1
    local process_name=$2

    for _ in {1..30}; do
        [[ -S "$socket_path" ]] && return 0
        pgrep -x "$process_name" >/dev/null || {
            echo "$process_name exited before creating $socket_path" >&2
            return 1
        }
        sleep 1
    done

    echo "Timed out waiting for $socket_path" >&2
    return 1
}

wait_for_port() {
    local port=$1
    local process_name=$2

    for _ in {1..30}; do
        if (echo >"/dev/tcp/127.0.0.1/$port") >/dev/null 2>&1; then
            return 0
        fi
        pgrep -f "$process_name" >/dev/null || {
            echo "$process_name exited before opening port $port" >&2
            return 1
        }
        sleep 1
    done

    echo "Timed out waiting for port $port" >&2
    return 1
}

if ! pgrep -x Xvfb >/dev/null; then
    nohup Xvfb :1 -screen 0 1280x800x24 >/tmp/xvfb.log 2>&1 </dev/null &
fi
wait_for_socket /tmp/.X11-unix/X1 Xvfb

if ! pgrep -x x11vnc >/dev/null; then
    nohup x11vnc -display :1 -forever -nopw >/tmp/x11vnc.log 2>&1 </dev/null &
fi
wait_for_port 5900 x11vnc

if ! pgrep -f '[n]ovnc_proxy.*--vnc localhost:5900' >/dev/null; then
    nohup /usr/share/novnc/utils/novnc_proxy --vnc localhost:5900 >/tmp/novnc.log 2>&1 </dev/null &
fi
wait_for_port 6080 '[n]ovnc_proxy.*--vnc localhost:5900'

if ! pgrep -u "$(id -u)" -f '[g]oogle-chrome.*--no-sandbox' >/dev/null; then
    nohup google-chrome --no-sandbox --disable-dev-shm-usage --no-first-run --no-default-browser-check \
        >/tmp/chrome.log 2>&1 </dev/null &
    for _ in {1..30}; do
        pgrep -u "$(id -u)" -f '[g]oogle-chrome.*--no-sandbox' >/dev/null && exit 0
        sleep 1
    done
    echo "Chrome did not start; check /tmp/chrome.log" >&2
    exit 1
fi
