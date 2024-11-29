#!/usr/bin/zsh

function which_term(){
    term=$(perl -lpe 's/\0/ /g' \
           /proc/$(xdotool getwindowpid $(xdotool getactivewindow))/cmdline)

    ## Enable extended globbing patterns
    shopt -s extglob
    case $term in
        ## If this terminal is a python or perl program,
        ## then the emulator's name is likely the second 
        ## part of it
        */python*|*/perl*    )
         term=$(basename "$(readlink -f $(echo "$term" | cut -d ' ' -f 2))")
         version=$(dpkg -l "$term" | awk '/^ii/{print $3}')
         ;;
        ## The special case of gnome-terminal
        *gnome-terminal-server* )
          term="gnome-terminal"
        ;;
        ## For other cases, just take the 1st
        ## field of $term
        * )
          term=${term/% */}
        ;;
     esac
     version=$(dpkg -l "$term" | awk '/^ii/{print $3}')
     echo "$term  $version"
}

function yt_dl() {
    if [[ -z "$1" ]]; then
        echo "Please provide a YouTube URL"
        return 1
    fi

    local url="$1"
    local title=$(yt-dlp --get-filename -o "%(title)s" "$url")
    
    # Download audio and subtitles
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
           --embed-thumbnail --add-metadata --write-sub --sub-lang en,ta,hi \
           -o "%(title)s.%(ext)s" "$url"
    
    # Check if download was successful
    if [[ $? -ne 0 ]]; then
        echo "Download failed. Please check the URL and try again."
        return 1
    fi
    
    # Rename subtitle files if they exist
    for lang in en ta hi; do
        if [[ -f "${title}.${lang}.vtt" ]]; then
            mv "${title}.${lang}.vtt" "${title}_${lang}.vtt"
        fi
    done
    
    # Remove unnecessary files
    rm -f "${title}"*.{webp,jpg,png,json,description}
    
    echo "Download complete. Kept MP3 and subtitle files, removed other artifacts."
}

serve() {
    if [[ -z "$1" ]]; then
        echo "Usage: serve PORT"
        return 1
    fi

    PORT=$1
    ssh -R 80:localhost:$PORT serveo.net
}

nvim_check_cpfolder() {
    if [ "$PWD" = "$HOME/dev/cp" ] && [ $# -eq 0 ]; then
        command nvim -S ./.cpsession.vim
    else
        command nvim "$@"
    fi
}

alias nvim=nvim_check_cpfolder
