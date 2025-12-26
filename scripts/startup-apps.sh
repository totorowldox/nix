#!/usr/bin/env bash

# Startup applications script for Hyprland/Niri
LOGFILE="$HOME/.cache/startup-apps.log"
mkdir -p "$(dirname "$LOGFILE")"
echo "[$(date)] Startup script started" > "$LOGFILE"

# Log function
log() {
    echo "[$(date)] $1" >> "$LOGFILE"
}

# Check if command exists
check_command() {
    if ! command -v "$1" &> /dev/null; then
        log "Error: $1 not found in PATH"
        return 1
    fi
    return 0
}

# Check if process is already running
check_running() {
    if pgrep -x "$1" > /dev/null; then
        log "$1 is already running, skipping"
        return 1
    fi
    return 0
}

# Launch app with error handling
launch_app() {
    local cmd="$1"
    shift
    if check_running "$cmd" && check_command "$cmd"; then
        log "Launching $cmd $@"
        "$cmd" "$@" &>> "$LOGFILE" &
        local pid=$!
        sleep "${APP_DELAY:-0.5}"
        if ! ps -p "$pid" > /dev/null; then
            log "Warning: $cmd (PID $pid) exited immediately"
        fi
    else
        log "Failed to launch $cmd: Command not found or already running"
    fi
}

# Launch Flatpak app
launch_flatpak() {
    local flatpak_app="$1"
    if check_command "flatpak"; then
        log "Launching flatpak app $flatpak_app"
        flatpak run "$flatpak_app" &>> "$LOGFILE" &
        sleep "${APP_DELAY:-0.5}"
    else
        log "Failed to launch flatpak $flatpak_app: flatpak not found"
    fi
}

# Trap errors
trap 'log "Script interrupted or failed"; exit 1' ERR INT TERM

# Set Wayland environment
export WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-0}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
log "Wayland environment: WAYLAND_DISPLAY=$WAYLAND_DISPLAY, XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"

# Wait for Wayland session
INITIAL_DELAY=${INITIAL_DELAY:-2}
sleep "$INITIAL_DELAY"
log "Waiting $INITIAL_DELAY seconds for Wayland session to initialize"

# Launch applications
#launch_app qq --use-wayland-ime
launch_app 1password --silent
launch_app qbittorrent
launch_flatpak "com.valvesoftware.Steam"
launch_app kleopatra
launch_app clash-verge

log "Startup script completed"
