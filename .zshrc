bindkey -v

# Basic aliases for sanity
alias ls='ls --color=auto'
alias vim='nvim'
alias git='noglob git'

# Enable powerline (daemon initialisation is perfed in ~/.xinitrc)
source /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Enable FZF bindings and completion 
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Live in tmux 5ever
if [ -z "$TMUX" ]
then
    tmux new-session -A -s tmux
fi

export VISUAL=nvim
export EDITOR="$VISUAL"

export TERM=screen-256color

export PATH=/home/sam/.local/bin:$PATH
export PATH=/home/sam/.gem/ruby/2.5.0/bin:$PATH

