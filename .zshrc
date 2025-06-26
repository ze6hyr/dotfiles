# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ZSH_SYNTAX_HIGHLIGHTING_STYLE="dark"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="alanpeabody"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# this is from bugswriter
 fcd() {
   cd "$(find -type d | fzf)"
 }
# open() {
#    xdg-open "$(find -type f | fzf)"
#}
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

#Clipboard stuff
alias cin="xclip -selection c"
alias cout="xclip -selection clipboard -o"

alias vv="vifm"
alias n=nvim
alias v=vim
alias qb=qutebrowser
alias :q=exit
alias l=ls -la
alias cl=clear
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# ZSH_SYNTAX_HIGHLIGHTING_STYLE="dark"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/bin:$PATH"
export TERM=xterm-256color
#export TERM=st-256color


## Disable bold in zsh-syntax-highlighting
#ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
#ZSH_HIGHLIGHT_STYLES[command]='fg=white'
#ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
#ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
#ZSH_HIGHLIGHT_STYLES[function]='fg=blue'

# Enable cursor style customization
ZVM_CURSOR_STYLE_ENABLED=true

# Set the correct cursor styles
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

#ZVM_VI_HIGHLIGHT_FOREGROUND=green             # Color name
#ZVM_VI_HIGHLIGHT_FOREGROUND=#008800           # Hex value
ZVM_VI_HIGHLIGHT_BACKGROUND=#333333               # Color name
#ZVM_VI_HIGHLIGHT_BACKGROUND=#ff0000           # Hex value
#ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline
## added this line cause tmux not supporting cursor blinking
#echo -ne '\e[1 q'
#
## Set blinking block cursor ALWAYS
#echo -ne '\e[1 q'
#[[ "$TERM" == "st-256color" ]] && echo -ne '\e[1 q'

## Force zsh-vi-mode to always use blinking block
#ZVM_CURSOR_STYLE_BLOCK='\e[1 q'
#ZVM_CURSOR_STYLE_BAR='\e[5 q'
#ZVM_CURSOR_STYLE_UNDERLINE='\e[3 q'

#echo The more you experiment, the stronger your understanding will be!

# auto-suggest_highlight_style color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444,bg=none,"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

#this for zsh-vi-mode 
# Disable the cursor style feature
#set_blinking_cursor() {
#    printf '\e[1 q'
#}
#precmd() { set_blinking_cursor }

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##############################################################################
###############################################################################
# AI things here
#
# tmuxai apikey
#export TMUXAI_OPENROUTER_API_KEY="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"
#
#export TMUXAI_OPENROUTER_API_KEY="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"

# ollama models in /home/xami/.ollama/models
export OLLAMA_MODELS=/home/xami/.ollama/models

