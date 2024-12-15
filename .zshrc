# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
pokemon-colorscripts -r

alias cpcode="cd ~/myPrograms/CP/ && nvim code.cpp -c \"vsplit input.txt\" -c \"split output.txt\"  -c \"split error.txt\" -c \"vertical resize -50\" "
alias config='/usr/bin/git --git-dir=/home/adnan/.cfg/ --work-tree=/home/adnan'
alias config='/usr/bin/git --git-dir=/home/adnan/.cfg/ --work-tree=/home/adnan'
alias snvim="sudo -E -s nvim"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

