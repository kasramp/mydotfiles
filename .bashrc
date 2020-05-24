#############################
#                           #
# Manjaro specific aliases  #
#                           #
#############################

alias apt-update='sudo pacman -Syy'
alias apt-upgrade='sudo pacman -Syu'
alias apt-install='sudo pacman -Sy'
alias apt-search='sudo pacman -Ss'
alias apt-remove='sudo pacman -Rs'
alias spotify='flatpak run com.spotify.Client'


#############################
#                           #
# General configs           #
#                           #
#############################


# Add an "alert" alias for long running commands. usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp="cp -i" # confirm before overwriting something
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

alias lang='exec /home/kixz/.config/i3/lang.sh'
alias youtube='mpsyt'
alias move='rsync -avhR --progress --remove-source-files'
alias copy='rsync -avhR --progress'
alias mp3-download='youtube-dl -x --audio-format mp3  --audio-quality  0'
alias make-debian-package='dpkg-buildpackage -us -uc'
alias negative='convert -negate'
alias markdownviewer="pandoc $1 | w3m -dump -T text/html | less"
alias routerip='traceroute 8.8.8.8'
alias sniff='nmap -p 80 -T4 -A -v XX.XX.XX.1/24'
alias radiojavan="mpv http://stream.radiojavan.com/radiojavan"
alias kralpop="mpv http://kralpopsc.radyotvonline.com/"
alias radiocheese='mpv http://thecheese.ddns.net:8004/stream'
alias nvlc='nvlc --no-fb-tty'
alias tmux-attach='tmux attach -t'
alias tmux='tmux -u'
alias playplay='playerctl play'
alias playpause='playerctl pause'
alias playnext='playerctl next; sleep .5; playerctl metadata; echo -e "\n"'
alias playback='playerctl previous'
alias playplaylist='mpv "https://www.youtube.com/playlist?list=PLIs3O8jOlzIIZibRp61bwevwQVW4FPIjp"'
alias vup='pactl set-sink-volume 1 +5%'
alias vdown='pactl set-sink-volume 1 -5%'
alias m='pactl set-sink-mute 1 toggle' 
alias calc='bc'
alias xclip='xclip -selection clipboard'
alias python='python3'
alias wireless='nmtui'
alias torrent='transmission-cli -w ~/Downloads/'
alias yank='xsel --display :0'
alias paste='xsel -o --display :0'
alias mpv-fb='mpv --vo=drm'
alias rss='newsboat'
alias startup='sudo vim /etc/rc.local'
alias vimrc="vim $HOME/.vimrc"
alias bashrc="vim $HOME/.bashrc"
alias standby="systemctl suspend"
alias merge_audio_video="ffmpeg -i $0 -i $1 -c:v copy -c:a flac -map 0:v:0 -map 1:a:0 out.mkv"

to_mp3()
{
    input_file="${1}"
    output_file=`basename "${1%.*}".mp3`
    ffmpeg -i "${input_file}" -b:a 320k "${output_file}"
}

audio_record()
{
    audio_file_name=`date '+%Y-%m-%d_%H:%M:%S'.mp3`
    path='/home/kixz/Audio/'
    mkdir -p "${path}"
    ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 320k "${path}${audio_file_name}"
}

# ex - archive extractor. usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# To make tmux does not mess vim status bar
TERM=screen-256color
EDITOR=vim
BROWSER=firefox