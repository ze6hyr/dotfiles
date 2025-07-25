# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_SYNTAX_HIGHLIGHTING_STYLE="dark"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="alanpeabody"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_SYNTAX_HIGHLIGHTING_STYLE="dark"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

#vim in bash super cool right # btw this is from luke smith
#set -o vi
#alias nv=nvim

# PROMPT CODE
bindkey -v              # Enable vi mode
setopt prompt_subst     # Allow variables inside prompt

# Mode symbols
VI_INS="$"
VI_CMD=" "
#VI_INS="λ"
#VI_CMD="μ"
VI_MODE=$VI_INS         # Default

# Update mode symbol when mode changes
function zle-keymap-select {
  [[ $KEYMAP == vicmd ]] && VI_MODE=$VI_CMD || VI_MODE=$VI_INS
  zle reset-prompt
}
zle -N zle-keymap-select

# Reset to insert mode after hitting Enter
function zle-line-finish {  VI_MODE=$VI_INS }
zle -N zle-line-finish

# Also reset after Ctrl+C
TRAPINT() {
  VI_MODE=$VI_INS
  return $((128 + $1))
}


# Git branch function
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n $branch ]] && echo "on %{$fg[magenta]%}${branch}%{$reset_color%}"
}

#LEFT PROMPT
# Colors (Zsh-safe)
local mode='%{$fg[blue]%}${VI_MODE}%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local git='$(git_branch)'
#local prompt_char='$'

PROMPT="${pwd}(${git}) ${mode} "


alias cl=clear
#alias word=desktopeditors
alias n=nvim
alias v=vim
alias qb=qutebrowser
alias :q=exit
alias l=ls -la

alias notes='nvim ~/NOTES.md'
alias notes-today='echo "## $(date +"%B %d, %Y - %H:%M")" >> ~/NOTES.md && nvim + ~/NOTES.md'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/apps:$PATH"
export PATH="/usr/bin:$PATH"
export TERM=xterm-256color

# force blinking block cursor on shell prompt 
# added this line cause tmux not supporting cursor blinking
echo -ne '\e[1 q'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#525252"
