bindkey -v

# Basic aliases for sanity
alias ls='ls --color=auto'
alias vim='nvim'
alias git='noglob git'
alias xclip='xclip -se c'

# Enable powerline (daemon initialisation is perfed in ~/.xinitrc)
source /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

autoload -Uz compinit
compinit

# Enable FZF bindings and completion 
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Keep a history for convenience searching
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase              #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


# Live in tmux 5ever
if [ -z "$TMUX" ]
then
    tmux new-session -A -s tmux
fi

# Have a working ssh-agent
plugins=(git ssh-agent)

export VISUAL=nvim
export EDITOR="$VISUAL"

export TERM=screen-256color

export PATH=/home/sam/.local/bin:$PATH
export PATH=/home/sam/.gem/ruby/2.5.0/bin:$PATH
export PATH=/home/sam/go/bin:$PATH
